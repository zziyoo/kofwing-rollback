"""Aggregate statistics for the final report."""
import csv
import json
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
REPORTS = REPO / "reports"
ANALYSIS = REPO / "analysis"

struct = json.loads((REPORTS / "_struct.json").read_text(encoding="utf-8"))
s = struct["summary"]
cls = json.loads((REPORTS / "classification.json").read_text(encoding="utf-8"))

total_scripts = sum(len(list(d.rglob("*.as"))) for d in ANALYSIS.iterdir()
                    if d.is_dir() and not d.name.startswith("_"))
total_as_bytes = sum(p.stat().st_size for d in ANALYSIS.iterdir()
                     if d.is_dir() and not d.name.startswith("_")
                     for p in d.rglob("*.as"))
total_strings = 0
for d in ANALYSIS.iterdir():
    if d.is_dir() and not d.name.startswith("_"):
        sp = d / "strings.txt"
        if sp.exists():
            total_strings += sum(1 for _ in sp.open(encoding="utf-8", errors="replace"))

from collections import Counter
roles = Counter(v["role"] for v in cls.values())

print("total swf files        :", s["total_files"])
print("valid swf              :", s["valid_swf"])
print("rejected (false pos)   :", s["invalid_swf"])
print("stale FileLength       :", s["declared_length_mismatch"])
print("with AS2               :", s["with_as2"])
print("with AS3               :", s["with_as3"])
print("with DefineSprite      :", s["with_sprite"])
print("with sound tags        :", s["with_sound"])
print("distinct sha256        :", s["distinct_sha256"])
print("duplicate groups       :", s["duplicate_groups"])
print("total bytes            :", f"{s['total_bytes']:,}")
print("exported .as files     :", total_scripts)
print("exported .as bytes     :", f"{total_as_bytes:,}")
print("strings mined          :", total_strings)
print("roles                  :", dict(roles))
print()
# role byte totals
bybytes = {}
for k, v in cls.items():
    bybytes[v["role"]] = bybytes.get(v["role"], 0) + v["bytes"]
for r, b in sorted(bybytes.items(), key=lambda kv: -kv[1]):
    print(f"  {r:<26} {b:>14,} bytes")