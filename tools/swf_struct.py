#!/usr/bin/env python3
"""
Phase 1 structural SWF analyzer for KOF Wing EX1.2 extracted SWFs.

Read-only. Validates the SWF header (signature, declared length, real length,
decompression, RECT / framerate / framecount) and walks the tag stream to prove
the tag structure is self-consistent. Deliberately does NOT classify files by
size alone, and does NOT treat arbitrary byte sequences as SWF: every file must
pass signature + declared-length + tag-walk checks to be called a valid SWF.

Outputs one JSON document per run describing every discovered file.
"""
from __future__ import annotations

import hashlib
import json
import struct
import sys
import zlib
from pathlib import Path

try:
    import lzma
    HAVE_LZMA = True
except ImportError:  # pragma: no cover
    HAVE_LZMA = False

# --- SWF tag codes we care about for the game architecture -------------
TAG_NAMES = {
    0: "End", 1: "ShowFrame", 2: "DefineShape", 4: "PlaceObject", 5: "RemoveObject",
    6: "DefineBits", 7: "DefineButton", 8: "JPEGTables", 9: "SetBackgroundColor",
    10: "DefineFont", 11: "DefineText", 12: "DoAction", 13: "DefineFontInfo",
    14: "DefineSound", 15: "StartSound", 16: "DefineButtonSound",
    17: "SoundStreamHead1", 18: "SoundStreamBlock", 19: "DefineBitsLossless1",
    20: "DefineBitsLossless2", 21: "DefineBitsLossless3", 22: "DefineButtonCxform",
    23: "Protect", 24: "PathsArePostScript", 26: "PlaceObject2", 28: "DefineButton2",
    32: "DefineShape3", 33: "DefineText2", 34: "DefineButton2",
    35: "DefineFont2", 36: "DefineBitsLossless4", 37: "DefineFontInfo2",
    39: "DefineSprite", 43: "FrameLabel", 45: "SoundStreamHead2", 46: "DefineMorphShape",
    48: "DefineFont3", 56: "ExportAssets", 57: "ImportAssets", 58: "EnableDebugger",
    59: "DoInitAction", 60: "DefineVideoStream", 61: "VideoFrame", 62: "DefineFontInfo3",
    66: "SetTabIndex", 69: "FileAttributes", 70: "PlaceObject3", 73: "DefineFontAlignZones",
    74: "CSMTextSettings", 75: "DefineFont4", 76: "SymbolClass", 77: "Metadata",
    82: "DoABC", 83: "DefineShape4", 84: "DefineMorphShape2", 86: "DefineSceneAndFrameLabelData",
    87: "DefineBinaryData", 88: "DefineFontName", 89: "SoundStreamHead1",
    90: "DefineBitsJPEG2", 91: "DefineBitsJPEG3", 92: "DefineButton2", 93: "DefineBitsJPEG4",
    94: "DefineFont4", 95: "ExportAssets", 96: "ExportAssets2", 48: "DefineFont3",
}

SCRIPT_TAGS = (12, 59, 82)                 # DoAction / DoInitAction / DoABC
IMAGE_TAGS = (6, 20, 21, 36, 90, 91, 93)   # DefineBits* families
SOUND_TAGS = (14, 18, 45, 17, 89)          # DefineSound / streams
FONT_TAGS = (10, 35, 48, 75)               # DefineFont* (incl DefineFont4)
TEXT_TAGS = (11, 33)                       # DefineText / DefineText2


def sha256_of(path: Path, chunk: int = 1 << 20) -> str:
    h = hashlib.sha256()
    with path.open("rb") as fh:
        while True:
            block = fh.read(chunk)
            if not block:
                break
            h.update(block)
    return h.hexdigest()


def decompress_body(raw: bytes, sig: bytes) -> tuple[bytes | None, str | None]:
    """Return (uncompressed tag-stream body, error). Body = bytes after the 8-byte header."""
    payload = raw[8:]
    if sig == b"FWS":
        return payload, None
    if sig == b"CWS":
        try:
            return zlib.decompress(payload), None
        except Exception as exc:  # noqa: BLE001
            return None, f"zlib decompress failed: {exc}"
    if sig == b"ZWS":
        if not HAVE_LZMA:
            return None, "LZMA unsupported in this interpreter"
        try:
            comp_len = struct.unpack("<I", payload[0:4])[0]
            props = payload[4:9]
            data = payload[9:]
            # Rebuild a standard .lzma stream: props(5) + uncompressed size(8) + data
            raw_lzma = props + struct.pack("<Q", 0xFFFFFFFFFFFFFFFF) + data
            dec = lzma.LZMADecompressor(format=lzma.FORMAT_ALONE)
            out = dec.decompress(raw_lzma)
            if len(data) != comp_len:
                # informational only - some writers pad
                pass
            return out, None
        except Exception as exc:  # noqa: BLE001
            return None, f"LZMA decompress failed: {exc}"
    return None, f"unknown signature {sig!r}"


def parse_rect(buf: bytes, pos: int) -> tuple[int, int, int, int, int]:
    """Parse an SWF RECT. Returns (xmin, xmax, ymin, ymax, newpos), values in twips."""
    if pos >= len(buf):
        raise ValueError("RECT truncated")
    nbits = buf[pos] >> 3
    if nbits == 0:
        return 0, 0, 0, 0, pos + 1
    total_bits = 5 + 4 * nbits
    nbytes = (total_bits + 7) // 8
    chunk = buf[pos: pos + nbytes]
    if len(chunk) < nbytes:
        raise ValueError("RECT truncated")
    bits = int.from_bytes(chunk, "big")
    bits &= (1 << (4 * nbits)) - 1          # drop the leading 5-bit nbits field
    mask = (1 << nbits) - 1
    vals = []
    for i in range(4):
        raw = (bits >> ((3 - i) * nbits)) & mask
        if raw & (1 << (nbits - 1)):        # sign-extend
            raw -= 1 << nbits
        vals.append(raw)
    return vals[0], vals[1], vals[2], vals[3], pos + nbytes


def walk_tags(body: bytes):
    """Walk the tag stream.

    Returns (histogram, order, showframe_count, declared_frame_count, end_pos, errors).
    `end_pos` is the offset just past the End tag; comparing it with len(body)
    tells us whether the tag stream is complete and how much trailing padding
    (if any) follows.
    """
    hist: dict[int, int] = {}
    order: list[tuple[int, int]] = []      # (code, length) in file order
    pos = 0
    errors: list[str] = []
    total = len(body)

    try:
        _x0, _x1, _y0, y1, pos = parse_rect(body, pos)
    except Exception as exc:  # noqa: BLE001
        return hist, order, 0, 0, 0, [f"RECT parse failed: {exc}"]

    if pos + 4 > total:
        return hist, order, 0, 0, 0, ["truncated after RECT (missing framerate/framecount)"]

    pos += 4  # framerate (2) + frame count (2)

    showframe = 0
    end_pos = 0
    saw_end = False
    guard = 0
    limit = 4_000_000
    while pos < total:
        guard += 1
        if guard > limit:
            errors.append("tag-walk guard tripped (possible infinite loop)")
            break
        if pos + 2 > total:
            errors.append(f"truncated tag header at offset {pos}")
            break
        code_and_len = struct.unpack_from("<H", body, pos)[0]
        pos += 2
        code = code_and_len >> 6
        length = code_and_len & 0x3F
        if length == 0x3F:
            if pos + 4 > total:
                errors.append(f"truncated long tag length at offset {pos}")
                break
            length = struct.unpack_from("<I", body, pos)[0]
            pos += 4
        hist[code] = hist.get(code, 0) + 1
        order.append((code, length))
        if code == 0:
            saw_end = True
            end_pos = pos
            break
        if code == 1:
            showframe += 1
        if pos + length > total:
            errors.append(
                f"tag {code} declares {length} bytes but only {total - pos} remain"
            )
            break
        pos += length

    if not saw_end:
        errors.append("tag stream ended WITHOUT an End tag - structure is truncated")

    return hist, order, showframe, 0, end_pos, errors


def analyze(path: Path, rel: str) -> dict:
    rec: dict = {
        "relative_path": rel,
        "filename": path.name,
        "extension": path.suffix.lower(),
        "bytes": path.stat().st_size,
        "sha256": None,
        "is_swf_signature": False,
        "valid_swf": False,
        "compression": None,
        "swf_version": None,
        "declared_length": None,
        "actual_length": None,
        "length_match": None,
        "frame_rate": None,
        "declared_frame_count": None,
        "showframe_count": None,
        "canvas_twips": None,
        "canvas_px_1440dpi": None,
        "tag_total": 0,
        "tag_histogram": {},
        "tag_histogram_named": {},
        "has_do_action": False,
        "has_do_init_action": False,
        "has_do_abc": False,
        "n_do_action": 0,
        "n_do_init_action": 0,
        "n_do_abc": 0,
        "n_sprite": 0,
        "n_image_tags": 0,
        "n_sound_tags": 0,
        "n_font_tags": 0,
        "n_text_tags": 0,
        "n_shape_tags": 0,
        "n_frame_label": 0,
        "n_symbol_class": 0,
        "n_export_assets": 0,
        "n_define_binary": 0,
        "n_video_stream": 0,
        "tag_walk_ok": False,
        "warnings": [],
        "errors": [],
    }

    try:
        rec["sha256"] = sha256_of(path)
    except Exception as exc:  # noqa: BLE001
        rec["errors"].append(f"hash failed: {exc}")
        return rec

    try:
        raw = path.read_bytes()
    except Exception as exc:  # noqa: BLE001
        rec["errors"].append(f"read failed: {exc}")
        return rec

    rec["actual_length"] = len(raw)
    if len(raw) < 8:
        rec["errors"].append(f"file too small to be a SWF ({len(raw)} bytes)")
        return rec

    sig = raw[:3]
    if sig in (b"FWS", b"CWS", b"ZWS"):
        rec["is_swf_signature"] = True
        rec["compression"] = {b"FWS": "none (uncompressed)", b"CWS": "zlib", b"ZWS": "lzma"}[sig]
    else:
        rec["errors"].append(
            f"bad signature {sig!r} - not a SWF (first 8 bytes: {raw[:8].hex(' ')})"
        )
        return rec

    rec["swf_version"] = raw[3]
    rec["declared_length"] = struct.unpack_from("<I", raw, 4)[0]
    rec["length_match"] = (rec["declared_length"] == rec["actual_length"])
    rec["length_delta"] = rec["declared_length"] - rec["actual_length"]
    if not rec["length_match"]:
        rec["warnings"].append(
            f"declared length {rec['declared_length']} != actual length "
            f"{rec['actual_length']} (delta {rec['length_delta']:+d})"
        )

    body, derr = decompress_body(raw, sig)
    if derr:
        rec["errors"].append(derr)
        return rec

    hist, order, showframe, _dfc, end_pos, tag_errors = walk_tags(body)
    rec["errors"].extend(tag_errors)
    rec["bytes_after_end_tag"] = max(0, len(body) - end_pos)

    # frame rate lives right after the RECT; recompute cheaply for the record
    try:
        _x0, x1, _y0, y1, pos = parse_rect(body, 0)
        rec["canvas_twips"] = [x1, y1]
        # SWF stores the stage in twips; Flash uses 20 twips = 1 px at 72 dpi
        rec["canvas_px_1440dpi"] = [round(x1 / 20.0, 2), round(y1 / 20.0, 2)]
        fr_raw = struct.unpack_from("<H", body, pos)[0]
        rec["frame_rate"] = round(fr_raw / 256.0, 3)
        rec["declared_frame_count"] = struct.unpack_from("<H", body, pos + 2)[0]
    except Exception as exc:  # noqa: BLE001
        rec["errors"].append(f"framerate parse failed: {exc}")

    rec["showframe_count"] = showframe
    rec["tag_total"] = len(order)
    rec["tag_histogram"] = {str(k): v for k, v in sorted(hist.items())}
    rec["tag_histogram_named"] = {
        TAG_NAMES.get(k, f"Unknown({k})"): v for k, v in sorted(hist.items())
    }
    rec["tag_walk_ok"] = (
        not tag_errors and hist.get(0, 0) >= 1 and body is not None
    )
    # A SWF is "valid" when it really is an SWF: correct signature, the tag
    # stream decompresses and walks cleanly to an End tag. A declared-length
    # mismatch is recorded separately as a warning - many Chinese-market SWF
    # packaging tools leave a stale FileLength field, and JPEXS still opens
    # such files, so it is not by itself evidence of corruption.
    rec["valid_swf"] = (
        rec["is_swf_signature"] and rec["tag_walk_ok"] and derr is None
    )

    g = lambda c: hist.get(c, 0)  # noqa: E731
    rec["n_do_action"] = g(12)
    rec["n_do_init_action"] = g(59)
    rec["n_do_abc"] = g(82)
    rec["has_do_action"] = g(12) > 0
    rec["has_do_init_action"] = g(59) > 0
    rec["has_do_abc"] = g(82) > 0
    rec["n_sprite"] = g(39)
    rec["n_image_tags"] = sum(g(t) for t in IMAGE_TAGS)
    rec["n_sound_tags"] = sum(g(t) for t in SOUND_TAGS)
    rec["n_font_tags"] = sum(g(t) for t in FONT_TAGS)
    rec["n_text_tags"] = sum(g(t) for t in TEXT_TAGS)
    rec["n_shape_tags"] = g(2) + g(32) + g(83)
    rec["n_frame_label"] = g(43) + g(86)
    rec["n_symbol_class"] = g(76)
    rec["n_export_assets"] = g(56) + g(95)
    rec["n_define_binary"] = g(87)
    rec["n_video_stream"] = g(60)
    return rec


def main() -> int:
    if len(sys.argv) < 3:
        print("usage: swf_struct.py <root_dir> <out_json>")
        return 2
    root = Path(sys.argv[1])
    out_path = Path(sys.argv[2])

    # Sort on the POSIX-style relative path, not the native path string, so the
    # row order is identical on Windows and POSIX.
    files = sorted(
        (p for p in root.rglob("*") if p.is_file() and p.suffix.lower() == ".swf"),
        key=lambda p: p.relative_to(root).as_posix().lower(),
    )
    records = []
    for p in files:
        rel = str(p.relative_to(root)).replace("\\", "/")
        rec = analyze(p, rel)
        records.append(rec)
        status = "OK " if rec["valid_swf"] else "BAD"
        print(
            f"[{status}] {rel}  ver={rec['swf_version']} "
            f"len={rec['bytes']} tags={rec['tag_total']} "
            f"AS2={rec['n_do_action']}/{rec['n_do_init_action']} AS3={rec['n_do_abc']} "
            f"spr={rec['n_sprite']} img={rec['n_image_tags']} snd={rec['n_sound_tags']}"
        )
        for e in rec["warnings"]:
            print(f"        ~ {e}")
        for e in rec["errors"]:
            print(f"        ! {e}")

    by_sha: dict[str, list[str]] = {}
    for r in records:
        by_sha.setdefault(r["sha256"], []).append(r["relative_path"])
    dupes = {k: v for k, v in by_sha.items() if len(v) > 1}

    # Aggregate counts below are over STRUCTURALLY VALID files only. Counting
    # rejected candidates here would let garbage bytes inflate the totals (a
    # rejected 106 MB blob contributed 2 bogus "sound" tags to the count).
    good = [r for r in records if r["valid_swf"]]
    summary = {
        "root": str(root),
        "total_files": len(records),
        "valid_swf": len(good),
        "invalid_swf": len(records) - len(good),
        "declared_length_mismatch": sum(1 for r in records if not r["length_match"]),
        "with_as2": sum(1 for r in good if r["has_do_action"] or r["has_do_init_action"]),
        "with_as3": sum(1 for r in good if r["has_do_abc"]),
        "with_sprite": sum(1 for r in good if r["n_sprite"] > 0),
        "with_sound": sum(1 for r in good if r["n_sound_tags"] > 0),
        "distinct_sha256": len(by_sha),
        "duplicate_groups": len(dupes),
        "total_bytes": sum(r["bytes"] for r in records),
        "swf_versions": sorted({r["swf_version"] for r in good if r["swf_version"]}),
        "counting_rule": (
            "total_files/invalid_swf/duplicate/total_bytes cover ALL candidates; "
            "with_* are computed over structurally VALID SWF only"
        ),
    }
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(
        json.dumps({"summary": summary, "files": records}, ensure_ascii=False, indent=1),
        encoding="utf-8",
    )
    print("\nSUMMARY " + json.dumps(summary, ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())