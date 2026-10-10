"""Test the hypothesis that the four EXE-embedded packs ARE the missing char/*.swf
character modules, by comparing their class inventory against the boot movie's
per-character classes."""
from pathlib import Path
import re

REPO = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版\_reverse")
ANALYSIS = REPO / "analysis"
MAIN = "kofwing__21256864"
PACKS = {"kofwing__11480055": "Kim", "kofwing__16695748": "Moriya",
         "kofwing__18464326": "Nameless", "kofwing__8492959": "Andy"}


def classes(aid):
    sd = next((p for p in (ANALYSIS / aid / "scripts").rglob("__Packages") if p.is_dir()), None)
    return {p.name for p in sd.rglob("*.as")} if sd else set()


main = classes(MAIN)
print(f"main classes: {len(main)}")

# what per-character classes does the boot movie own?
main_chars = set()
for n in main:
    m = re.match(r"(?:Type2_|Type3_|CKrizalid|CZero)?(.+?)_AI(_Lv\d)?\.as$", n)
    if m:
        main_chars.add(m.group(1))
    m2 = re.match(r"(.+?)_role\.as$", n)
    if m2:
        main_chars.add(m2.group(1))
print("characters represented in main SWF:", ", ".join(sorted(main_chars)))

print()
for aid, who in PACKS.items():
    pc = classes(aid)
    only_here = sorted(pc - main)
    print(f"{aid} ({who}): {len(pc)} classes, {len(only_here)} NOT in main")
    print("   " + ", ".join(only_here[:18]))
    print()

# Does main contain a *_role.as for characters it also has AI for?
print("main *_role.as files:", sorted(n for n in main if n.endswith("_role.as"))[:40])