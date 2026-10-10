"""Correct verification of the duplicated-engine diff.

The first attempt compared files line-by-line BY POSITION, which reports a huge
diff whenever a single early insertion shifts everything after it. This version
uses difflib opcodes so that insertions/deletions are measured properly.
"""
import difflib
import hashlib
from pathlib import Path

REPO = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版\_reverse")
A = REPO / "analysis"
MAIN = "kofwing__21256864"
PACKS = ["kofwing__11480055", "kofwing__16695748",
         "kofwing__18464326", "kofwing__8492959"]
CLASSES = ["role_corn/Role.as", "role_corn/KeyControl.as", "HitCheck.as",
           "HitCheck_obj.as", "role_corn/Combo_listener.as", "skill/FlyingObj.as"]


def find(aid, name):
    for p in (A / aid / "scripts").rglob(name):
        if p.is_file() and p.name == name:
            return p
    return None


for cls in CLASSES:
    name = Path(cls).name
    variants = {}
    for aid in [MAIN] + PACKS:
        p = find(aid, name)
        if p:
            variants[aid] = p.read_text(encoding="utf-8", errors="replace")
    if len(variants) < 2:
        print(f"{cls}: only {len(variants)} copy/copies found")
        continue

    base_aid = MAIN if MAIN in variants else next(iter(variants))
    base = variants[base_aid].splitlines()
    base_sha = hashlib.sha256("\n".join(base).encode()).hexdigest()[:12]

    print(f"\n=== {cls} ===  copies={len(variants)}  base={base_aid} "
          f"lines={len(base)} sha={base_sha}")
    groups = {}
    for aid, text in variants.items():
        groups.setdefault(
            hashlib.sha256("\n".join(text.splitlines()).encode()).hexdigest(), []
        ).append(aid)
    print(f"  distinct variants: {len(groups)}")
    for h, aids in groups.items():
        print(f"    {h[:12]}: {', '.join(aids)}")

    # proper diff vs the boot movie version
    for aid, text in variants.items():
        if aid == base_aid:
            continue
        other = text.splitlines()
        sm = difflib.SequenceMatcher(None, base, other, autojunk=False)
        added = removed = 0
        changed_pairs = []
        for tag, i1, i2, j1, j2 in sm.get_opcodes():
            if tag == "insert":
                added += j2 - j1
            elif tag == "delete":
                removed += i2 - i1
            elif tag == "replace":
                removed += i2 - i1
                added += j2 - j1
                changed_pairs.append((i1, base[i1:i2], other[j1:j2]))
        pct = 100.0 * sm.ratio()
        print(f"  vs {aid}: similarity={pct:.2f}%  "
              f"lines_removed={removed} lines_added={added}")
        if changed_pairs:
            for i1, b, o in changed_pairs[:4]:
                print(f"     ~boot L{i1+1}: {str(b)[:90]}")
                print(f"      pack L{i1+1}: {str(o)[:90]}")
        break  # all packs share one variant; one comparison is enough