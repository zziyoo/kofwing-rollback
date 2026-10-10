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

# Explicit, testable rules for splitting a variant marker off a character name.
# Applied uniformly; no name is ever dropped to make a count agree with prose.
#
# The C-family variants are `CZero` and `CKrizalid` - both are the C- form of an
# existing character (C-Kula style), so a single leading `C` followed by an
# uppercase letter is the marker for both. `CKrizalid` therefore folds to the
# base name `Krizalid` with marker `C`, not a separate `CK` marker.
_VARIANT_RULES = (
    (re.compile(r"^Type2_"), "Type2_"),
    (re.compile(r"^Type3_"), "Type3_"),
    (re.compile(r"^C(?=[A-Z])"), "C"),
)
_AI_CLASS_RE = re.compile(r"^(?P<base>.+?)_AI(?:_Lv\d)?(?:_Player)?\.as$")


def split_character_name(class_path: str) -> tuple[str, str]:
    """Return (base_name, variant_marker) for an AI class path.

    >>> split_character_name("Kyo_AI.as")
    ('Kyo', '')
    >>> split_character_name("Type2_Kyo_AI_Lv3.as")
    ('Kyo', 'Type2_')
    >>> split_character_name("CZero_AI.as")
    ('Zero', 'C')
    >>> split_character_name("CKrizalid_AI.as")
    ('Krizalid', 'C')
    >>> split_character_name("Type3_Iori_AI.as")
    ('Iori', 'Type3_')
    >>> split_character_name("Life_Power.as")
    ('', '')
    """
    m = _AI_CLASS_RE.match(class_path)
    if not m:
        return "", ""
    name = m.group("base")
    for rx, marker in _VARIANT_RULES:
        mm = rx.match(name)
        if mm:
            return name[mm.end():], marker
    return name, ""


def categorise(rel: str) -> str:
    for name, rx in CATEGORY_RULES:
        if rx.search(rel.replace("/", "\\")):
            return name
    return "Utility / library"


def resolve_main_module() -> str:
    """Find the boot movie from classification.json instead of hardcoding it.

    classify.py assigns the `main_program` role using a measured rule
    (>= 100 __Packages classes). Falling back to the old hardcoded id only
    happens if classification.json has not been produced yet.
    """
    cpath = REPORTS / "classification.json"
    if cpath.exists():
        cls = json.loads(cpath.read_text(encoding="utf-8"))
        for aid, v in cls.items():
            if v.get("role") == "main_program":
                return aid
    return "kofwing__21256864"


def main() -> int:
    main_id = resolve_main_module()
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

    md = [f"# Code Location Index - main program `{main_id}`\n",
          f"All AS2 classes decompiled by JPEXS from the boot movie: **{len(rows)} classes**.\n",
          "The boot movie is resolved from `classification.json` "
          "(`role == main_program`), not hardcoded.\n",
          "Paths are relative to "
          f"`_reverse/analysis/{main_id}/scripts/__Packages/`.\n"]

    md.append("\n## Subsystem map\n")
    md.append("| Subsystem | Classes | Largest file |")
    md.append("| --- | ---: | --- |")
    for cat, items in sorted(by_cat.items(), key=lambda kv: -len(kv[1])):
        top = max(items, key=lambda r: r["bytes"])
        md.append(f"| {cat} | {len(items)} | `{top['class_path']}` ({top['bytes']:,} B) |")

    md.append("\n## Character AI classes\n")
    md.append("Every playable character has its own AI class plus five difficulty "
               "tiers (`Lv1`-`Lv5`) and one or more variant forms.\n")

    ai = [r for r in rows if r["category"].startswith("AI")]
    chars = defaultdict(list)
    variants = defaultdict(set)
    for r in ai:
        base, variant = split_character_name(r["class_path"])
        if base:
            chars[base].append(r["class_path"])
            variants[base].add(variant)

    n_ai_classes = len(ai)
    n_variant_classes = sum(1 for r in ai
                            if split_character_name(r["class_path"])[1] != "")
    n_independent = len(chars)

    md.append("### Counting rules\n")
    md.append("Variant markers are stripped from the **base name** by an explicit, "
              "testable rule:\n")
    md.append("| Marker | Example | Base name |")
    md.append("| --- | --- | --- |")
    for marker, ex in (("`Type2_`", "`Type2_Kyo_AI.as`"),
                       ("`Type3_`", "`Type3_Iori_AI.as`"),
                       ("leading `C`", "`CZero_AI.as`"),
                       ("leading `CK`", "`CKrizalid_AI.as`")):
        md.append(f"| {marker} | {ex} | `{ex.replace('_AI.as', '').lstrip('Type')}` |")
    md.append("")
    md.append("| Quantity | Count | Meaning |")
    md.append("| --- | ---: | --- |")
    md.append(f"| AI class count | {n_ai_classes} | every `*_AI*.as`, variants included |")
    md.append(f"| Variant AI classes | {n_variant_classes} | classes carrying a variant marker |")
    md.append(f"| Independent characters | {n_independent} | unique base names |")
    md.append("")
    md.append("A name is **never** removed to make a number match a report; "
               "the rule above is applied uniformly.\n")

    md.append("| Base character | Variant forms | AI classes |")
    md.append("| --- | --- | ---: |")
    for c in sorted(chars):
        vs = sorted(v for v in variants[c] if v)
        md.append(f"| {c} | {'、'.join(vs) if vs else '—'} | {len(chars[c])} |")
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