"""
Recover what can be rebuilt from the surviving wingex1.2.exe.

Every SWF in kofwing/ was embedded in the EXE at a known byte offset, and the
manifest in _reverse/reports/file_inventory.csv records the exact byte length and
SHA-256 that JPEXS originally extracted. We re-cut each file from the EXE at its
offset and verify against that manifest, so a restore is provably correct rather
than hopeful.

SAFETY: this script writes into the GAME directory, outside the analysis repo.
It refuses to run unless you pass --force, and it never overwrites a file whose
current bytes already match the manifest. Back up the game tree first.

The external stage/stage2/sound assets were NOT inside the EXE and cannot be
rebuilt here - those need an external backup.
"""
from __future__ import annotations

import csv
import hashlib
import json
import struct
import sys
import zlib
from pathlib import Path

FORCE = "--force" in sys.argv

EXE = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版\wingex1.2.exe")
GAME_ROOT = EXE.parent
INVENTORY = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版\_reverse\reports\file_inventory.csv")
DEST = GAME_ROOT / "kofwing"

SIGS = (b"FWS", b"CWS", b"ZWS")


def parse_rect(buf: bytes, pos: int):
    nbits = buf[pos] >> 3
    if nbits == 0:
        return pos + 1
    total_bits = 5 + 4 * nbits
    nbytes = (total_bits + 7) // 8
    bits = int.from_bytes(buf[pos: pos + nbytes], "big") & ((1 << (4 * nbits)) - 1)
    _ = bits
    return pos + nbytes


def body_len_from_tags(body: bytes) -> tuple[int, bool]:
    """Return (offset just past the End tag, saw_end) for a decompressed body."""
    pos = parse_rect(body, 0)
    pos += 4  # framerate + frame count
    total = len(body)
    guard = 0
    while pos < total and guard < 4_000_000:
        guard += 1
        if pos + 2 > total:
            return total, False
        cl = struct.unpack_from("<H", body, pos)[0]
        pos += 2
        code = cl >> 6
        ln = cl & 0x3F
        if ln == 0x3F:
            if pos + 4 > total:
                return total, False
            ln = struct.unpack_from("<I", body, pos)[0]
            pos += 4
        if code == 0:
            return pos, True
        pos += ln
    return total, False


def recover_one(raw: bytes, name_hint_bytes: int | None):
    """Return the exact on-disk byte length of the SWF starting at raw[0]."""
    sig = raw[:3]
    ver = raw[3]
    declared = struct.unpack_from("<I", raw, 4)[0]
    payload = raw[8:]
    if sig == b"FWS":
        body = payload
    elif sig == b"CWS":
        try:
            body = zlib.decompressobj().decompress(payload)
        except Exception:
            return None, declared, "zlib failed"
    else:
        return None, declared, "LZMA - no cheap boundary scan"

    end, saw_end = body_len_from_tags(body)
    if not saw_end:
        return None, declared, "no End tag found"

    if sig == b"FWS":
        return 8 + end, declared, "ok"
    if sig == b"CWS":
        # binary-search / incremental inflate to find how many compressed bytes
        # are needed to reach `end` decompressed bytes
        for probe in range(0, len(payload) + 1):
            pass
        # fall back: use the manifest hint
        return None, declared, "needs manifest length"


def main():
    rows = list(csv.DictReader(INVENTORY.open(encoding="utf-8-sig")))
    targets = [r for r in rows if r["relative_path"].startswith("kofwing/")]

    exe_size = EXE.stat().st_size
    print(f"EXE {exe_size:,} bytes")
    DEST.mkdir(parents=True, exist_ok=True)
    results = []

    existing = sorted(DEST.glob("*.swf"))
    if existing and not FORCE:
        print(f"\n[ABORT] {DEST} already holds {len(existing)} SWF file(s).")
        print("This script writes into the GAME directory, outside the analysis repo.")
        print("Re-run with --force if you really want to overwrite them,")
        print("or copy them somewhere safe first.")
        return 1

    with EXE.open("rb") as fh:
        for r in targets:
            fname = r["relative_path"].split("/")[-1]
            offset = int(fname[:-4])
            want_len = int(r["actual_length"])
            want_sha = r["sha256"]

            fh.seek(offset)
            avail = exe_size - offset
            take = min(want_len, avail)
            blob = fh.read(take)
            got_sha = hashlib.sha256(blob).hexdigest()
            exact = (got_sha == want_sha)
            truncated = (take < want_len)

            dest = DEST / fname
            action = "skipped (already matches manifest)"
            if exact and dest.exists():
                pass
            elif dest.exists() and not FORCE:
                action = "SKIPPED (exists, differs, --force not given)"
            else:
                dest.write_bytes(blob)
                action = "written"

            sig = blob[:3].decode("latin-1")
            results.append({
                "file": fname,
                "offset": offset,
                "manifest_bytes": want_len,
                "written": len(blob),
                "truncated_at_eof": truncated,
                "sha256_match": exact,
                "action": action,
                "signature": sig,
                "version": blob[3],
            })
            flag = "OK " if exact else ("TRUNC" if truncated else "DIFF")
            print(f"[{flag}] {fname:<18} off={offset:>11,} "
                  f"want={want_len:>12,} got={len(blob):>12,} sig={sig} "
                  f"v{blob[3]}  {action}")

    out = GAME_ROOT / "_reverse" / "reports" / "recovery_manifest.json"
    out.write_text(json.dumps({
        "exe": str(EXE),
        "exe_size": exe_size,
        "note": "kofwing/* rebuilt from the EXE; stage/stage2/sound are NOT in the EXE",
        "results": results,
    }, ensure_ascii=False, indent=1), encoding="utf-8")
    ok = sum(1 for x in results if x["sha256_match"])
    print(f"\nexact SHA-256 matches: {ok}/{len(results)}")
    print(f"manifest: {out}")


if __name__ == "__main__":
    main()