"""Locate the engine class files (__Packages) across analysed modules."""
import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
ANALYSIS = REPO / "analysis"

mods = sys.argv[1:] or ["kofwing__21256864", "kofwing__11480055", "kofwing__16695748",
                        "kofwing__18464326", "kofwing__8492959"]
for m in mods:
    root = ANALYSIS / m
    if not root.exists():
        print(f"{m}: MISSING")
        continue
    classes = [p for p in root.rglob("*.as")
               if "__Packages" in p.parts or p.name.endswith((".as",))]
    pk = [p for p in classes if "__Packages" in p.parts]
    print(f"### {m}: total .as={len(classes)}  __Packages={len(pk)}")
    big = sorted(pk, key=lambda p: -p.stat().st_size)[:14]
    for p in big:
        rel = p.relative_to(root)
        print(f"      {str(rel):<62} {p.stat().st_size:>9,}")
    if not pk:
        # show the biggest scripts overall so we know where code actually lives
        big = sorted(classes, key=lambda p: -p.stat().st_size)[:6]
        for p in big:
            rel = p.relative_to(root)
            print(f"      (no packages) {str(rel):<46} {p.stat().st_size:>9,}")