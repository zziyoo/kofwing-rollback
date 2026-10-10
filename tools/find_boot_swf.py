#!/usr/bin/env python3
"""
Locate the real boot SWF inside the Flash projector EXE.

A Flash Projector embeds the main movie after its runtime stub. The stub's
trailer stores a magic marker (0xFWS/0xCWS/0xZWS "magic" bytes + length) that
Flasher's SWFTools use to find it. We scan for every SWF signature in the EXE
and report offsets, declared versions and lengths, then test each candidate
against the known SWF inventory by SHA-256.

Read-only: the EXE is opened for reading only.
"""
from __future__ import annotations

import hashlib
import json
import struct
import sys
from pathlib import Path

SIGS = (b"FWS", b"CWS", b"ZWS")


def scan(exe: Path, chunk: int = 1 << 22):
    hits = []
    data_size = exe.stat().st_size
    with exe.open("rb") as fh:
        offset = 0
        tail = b""
        while offset < data_size:
            buf = fh.read(chunk)
            if not buf:
                break
            blob = tail + buf
            base = offset - len(tail)
            for sig in SIGS:
                start = 0
                while True:
                    i = blob.find(sig, start)
                    if i < 0:
                        break
                    abs_off = base + i
                    if abs_off + 8 <= data_size:
                        ver = blob[i + 3]
                        (declared,) = struct.unpack_from("<I", blob, i + 4)
                        hits.append({
                            "offset": abs_off,
                            "signature": sig.decode(),
                            "version": ver,
                            "declared_length": declared,
                        })
                    start = i + 1
            tail = blob[-8:]
            offset += len(buf)
    # dedupe overlapping detections at the same offset
    uniq = {}
    for h in hits:
        uniq.setdefault(h["offset"], h)
    return sorted(uniq.values(), key=lambda h: h["offset"])


def main() -> int:
    exe = Path(sys.argv[1])
    struct_json = Path(sys.argv[2])
    out_json = Path(sys.argv[3])

    data = json.loads(struct_json.read_text(encoding="utf-8"))
    known = {}
    for r in data["files"]:
        known.setdefault(r["sha256"], []).append(r["relative_path"])

    root = exe.parent
    hits = scan(exe)
    print(f"EXE: {exe.name}  size={exe.stat().st_size:,}")
    print(f"signature hits: {len(hits)}")

    results = []
    with exe.open("rb") as fh:
        for h in hits:
            fh.seek(h["offset"])
            head = fh.read(1 << 20)
            # verify the compressed body actually inflates
            ok = None
            if h["signature"] in ("FWS", "CWS"):
                import zlib
                try:
                    body = head[8:] if h["signature"] == "FWS" else zlib.decompressobj().decompress(head[8:])
                    ok = len(body) > 64
                except Exception:  # noqa: BLE001
                    ok = False
            sha = hashlib.sha256(head).hexdigest()
            results.append({
                **h,
                "plausible": bool(ok) and h["declared_length"] > 1000,
                "sha256_first_1mb": sha,
            })

    plausible = [r for r in results if r["plausible"]]
    print(f"plausible SWF headers: {len(plausible)}")
    for r in plausible[:40]:
        print(f"  off={r['offset']:>12,}  sig={r['signature']} ver={r['version']:>2} "
              f"declared={r['declared_length']:>12,}")

    # Correlate: hash the full byte range each plausible candidate claims
    matched = []
    with exe.open("rb") as fh:
        for r in plausible:
            fh.seek(r["offset"])
            blob = fh.read(r["declared_length"])
            if len(blob) < r["declared_length"]:
                r["bytes_available"] = len(blob)
                r["match"] = None
                matched.append(r)
                continue
            h = hashlib.sha256(blob).hexdigest()
            r["bytes_available"] = len(blob)
            r["sha256_full"] = h
            r["match"] = known.get(h)
            matched.append(r)

    print("\n-- candidates matching extracted SWF files by SHA-256 --")
    any_match = False
    for r in matched:
        if r.get("match"):
            any_match = True
            print(f"  off={r['offset']:>12,} ver={r['version']:>2} "
                  f"declared={r['declared_length']:>12,} -> {r['match']}")
    if not any_match:
        print("  (none - extracted files were trimmed or re-saved during extraction)")

    out_json.write_text(
        json.dumps({
            "exe": str(exe),
            "exe_size": exe.stat().st_size,
            "signature_hits": len(hits),
            "plausible": len(plausible),
            "candidates": results,
        }, ensure_ascii=False, indent=1),
        encoding="utf-8",
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())