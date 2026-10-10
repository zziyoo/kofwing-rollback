#!/usr/bin/env python3
"""Build reports/code_index.md - where each gameplay subsystem lives."""
from __future__ import annotations

import csv
import json
import re
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
ANALYSIS = REPO / "analysis"
REPORTS = REPO / "reports"

CATEGORY_RULES = [
    ("AI (per character)", re.compile(r"_AI(_Lv\d)?\.as$")),
    ("AI (player/auto)", re.compile(r"_Player\.as$")),
    ("Character definition", re.compile(r"_role\.as$")),
    ("Combo system", re.compile(r"Combo.*\.as$")),
    ("Hitbox / collision", re.compile(r"HitCheck.*\.as$")),
    ("Input handling", re.compile(r"KeyControl\.as$|Input.*\.as$")),
    ("Projectiles / objects", re.compile(r"skill[/\\].*\.as$|FlyingObj.*\.as$")),
    ("Shared role core", re.compile(r"role_corn[/\\].*\.as$")),
    ("Stage / background", re.compile(r"Stage.*\.as$|.*_control2\.as$")),
    ("Flash MXML framework", re.compile(r"mx[/\\].*\.as$")),
    ("Ad / network", re.compile(r"FWAd.*\.as$|Net.*\.as$|Ad.*\.as$")),
    ("Utility / library", re.compile(r"\.as$")),
]


def categorise(rel: str) -> str:
    for name, rx in CATEGORY_RULES:
        if rx.search(rel.replace("/", "\\")):
            return name
    return "Utility / library"


def main() -> int:
    main_id = "kofwing__21256864"
    # JPEXS nests its own output folder, so classes live at scripts/scripts/__Packages
    pk = next((p for p in (ANALYSIS / main_id / "scripts").rglob("__Packages")
               if p.is_dir()), None)
    rows = []
    if pk is None:
        print("ERROR: __Packages directory not found")
        return 1
    for p in sorted(pk.rglob("*.as")):
        rel = str(p.relative_to(pk)).replace("\\", "/")
        rows.append({
            "class_path": rel,
            "bytes": p.stat().st_size,
            "category": categorise(rel),
        })

    by_cat = defaultdict(list)
    for r in rows:
        by_cat[r["category"]].append(r)

    with (REPORTS / "code_index.csv").open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.DictWriter(fh, fieldnames=["class_path", "bytes", "category"])
        w.writeheader()
        w.writerows(sorted(rows, key=lambda r: (r["category"], -r["bytes"])))

    md = ["# Code Location Index - main program `kofwing/21256864.swf`\n",
          f"All AS2 classes decompiled by JPEXS from the boot movie: **{len(rows)} classes**.\n",
          "Paths are relative to "
          "`_reverse/analysis/kofwing__21256864/scripts/__Packages/`.\n"]

    md.append("\n## Subsystem map\n")
    md.append("| Subsystem | Classes | Largest file |")
    md.append("| --- | ---: | --- |")
    for cat, items in sorted(by_cat.items(), key=lambda kv: -len(kv[1])):
        top = max(items, key=lambda r: r["bytes"])
        md.append(f"| {cat} | {len(items)} | `{top['class_path']}` ({top['bytes']:,} B) |")

    md.append("\n## Character AI classes\n")
    md.append("Every playable character has its own AI class plus five difficulty "
               "tiers (`Lv1`-`Lv5`) and usually a `Type2_` variant.\n")
    ai = [r for r in rows if r["category"].startswith("AI")]
    chars = defaultdict(list)
    for r in ai:
        m = re.match(r"(Type2_)?(.+?)_AI(_Lv\d|_Player)?\.as$", r["class_path"])
        if m:
            chars[m.group(2)].append(r["class_path"])
    md.append("| Character | AI classes |")
    md.append("| --- | ---: |")
    for c in sorted(chars):
        md.append(f"| {c} | {len(chars[c])} |")
    md.append("")

    md.append("\n## Largest / most important classes\n")
    md.append("| Class | Bytes | Subsystem |")
    md.append("| --- | ---: | --- |")
    for r in sorted(rows, key=lambda r: -r["bytes"])[:40]:
        md.append(f"| `{r['class_path']}` | {r['bytes']:,} | {r['category']} |")
    md.append("")

    (REPORTS / "code_index.md").write_text("\n".join(md), encoding="utf-8")
    print(f"classes: {len(rows)}  characters with AI: {len(chars)}")
    print("categories:", {k: len(v) for k, v in sorted(by_cat.items(), key=lambda kv: -len(kv[1]))})
    return 0


if __name__ == "__main__":
    raise SystemExit(main())