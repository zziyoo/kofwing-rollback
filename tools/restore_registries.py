"""Rebuild the three list.txt registries from the parsed data saved in registries.json."""
import json
from pathlib import Path

GAME = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版")
REG = GAME / "_reverse" / "reports" / "registries.json"

data = json.loads(REG.read_text(encoding="utf-8"))

# registries.json is keyed by logical name; map back to on-disk location
PLACEMENT = {
    "stage_registry": GAME / "stage" / "list.txt",
    "stage2_registry": GAME / "stage2" / "list.txt",
    "music_registry": GAME / "sound" / "list.txt",
}

for key, target in PLACEMENT.items():
    reg = data.get(key)
    if not reg:
        print(f"{key}: no data")
        continue
    lines = []
    stagebg = [e for e in reg["entries"] if e["kind"] == "stageBG_item"]
    maps = [e for e in reg["entries"] if e["kind"] == "map"]
    scalars = [e for e in reg["entries"] if e["kind"] == "scalar"]

    if stagebg:
        joined = ",".join(e["declared"] for e in stagebg)
        lines.append(f"\ufeff&stageBG={joined}&")

    for e in scalars:
        lines.append(f"&{e['key']}={e['declared']}&")

    for e in maps:
        lines.append(f"&{e['key']}={e['declared']}&")

    body = "\n".join(lines) + "\n"
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(body, encoding="utf-8")
    print(f"restored {target.relative_to(GAME)}  "
          f"({len(stagebg)} stageBG, {len(scalars)} scalar, {len(maps)} map entries, "
          f"{len(body.encode('utf-8'))} bytes)")