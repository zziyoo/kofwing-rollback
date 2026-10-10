#!/usr/bin/env python3
"""
Registry parser for the game's external `list.txt` resource tables.

The EXE is a Flash projector, so its AS2 code calls loadVariables() against
plain-text files. Flash's loadVariables() parses a text file as if it were an
HTML form post body: `&key=value&` pairs separated by `&`. The three list.txt
files found in sound/, stage/ and stage2/ follow exactly that layout.

We parse them, then cross-check every referenced target against the files that
actually exist on disk so we can state, with evidence, which entries resolve and
which are stale.
"""
from __future__ import annotations

import csv
import json
import re
import sys
from pathlib import Path

PAIR_RE = re.compile(r"&([^=&]*)=([^&]*)&")

# Values that are configuration scalars rather than file references. Classifying
# these as missing files would be a false finding.
CONFIG_SCALAR_KEYS = {"musicNum", "version", "stageNum", "charNum"}


def parse_registry(text: str) -> dict:
    """Extract &key=value& pairs, honouring a UTF-8 BOM if present."""
    if text.startswith("\ufeff"):
        text = text.lstrip("\ufeff")
    pairs = []
    for m in PAIR_RE.finditer(text):
        pairs.append((m.group(1), m.group(2)))
    return {"pairs": pairs, "count": len(pairs)}


def build_case_insensitive_index(dirs: list[Path]) -> dict[str, list[Path]]:
    idx: dict[str, list[Path]] = {}
    for d in dirs:
        if not d.exists():
            continue
        for p in d.rglob("*"):
            if p.is_file():
                idx.setdefault(p.name.lower(), []).append(p)
    return idx


def main() -> int:
    root = Path(sys.argv[1])
    out_dir = Path(sys.argv[2])
    out_dir.mkdir(parents=True, exist_ok=True)

    search_dirs = [root / "stage", root / "stage2", root / "sound", root / "kofwing"]
    idx = build_case_insensitive_index(search_dirs)

    registries = {}
    findings = []
    for rel_dir, name, kind in (
        ("stage", "list.txt", "stage_registry"),
        ("stage2", "list.txt", "stage2_registry"),
        ("sound", "list.txt", "music_registry"),
    ):
        p = root / rel_dir / name
        if not p.exists():
            continue
        raw = p.read_text(encoding="utf-8", errors="replace")
        parsed = parse_registry(raw)
        entries = []
        for key, value in parsed["pairs"]:
            if key == "stageBG":
                items = [v.strip() for v in value.split(",") if v.strip()]
                for item in items:
                    target = item + ".swf"
                    hits = idx.get(target.lower(), [])
                    entries.append({
                    "kind": "stageBG_item",
                    "key": key,
                    "declared": item,
                    "target": target,
                    "resolved_file": str(hits[0].relative_to(root)).replace("\\", "/")
                    if hits else None,
                    "status": "resolved" if hits else "MISSING",
                })
                continue

            if key in CONFIG_SCALAR_KEYS:
                entries.append({
                    "kind": "scalar",
                    "key": key,
                    "declared": value,
                    "resolved_file": None,
                    "status": "SCALAR",
                })
                continue

            target = value if "." in Path(value).name else value + ".swf"
            hits = idx.get(target.lower(), [])
            entries.append({
                "kind": "map",
                "key": key,
                "declared": value,
                "target": target,
                "resolved_file": str(hits[0].relative_to(root)).replace("\\", "/")
                if hits else None,
                "status": "resolved" if hits else "MISSING",
            })

        registries[kind] = {
            "path": str(p.relative_to(root)).replace("\\", "/"),
            "pair_count": parsed["count"],
            "scalars": sum(1 for e in entries if e["status"] == "SCALAR"),
            "resolved": sum(1 for e in entries if e["status"] == "resolved"),
            "missing": sum(1 for e in entries if e["status"] == "MISSING"),
            "case_diffs": 0,
            "entries": entries,
        }
        for e in entries:
            findings.append({"registry": kind, **e})

    # Flag entries whose declared name differs only in letter case from the real
    # file. Flash on Windows resolves these fine, but it matters if the data is
    # ever ported to a case-sensitive filesystem.
    for f in findings:
        if f["status"] == "resolved":
            actual = Path(f["resolved_file"]).name
            target = f.get("target") or f["declared"]
            if Path(actual).stem.lower() != Path(target).stem.lower():
                f["status"] = "CASE_MISMATCH"
            elif actual != target:
                f["status"] = "CASE_DIFFERS"

    (out_dir / "registries.json").write_text(
        json.dumps(registries, ensure_ascii=False, indent=1), encoding="utf-8"
    )

    with (out_dir / "registry_entries.csv").open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.writer(fh)
        w.writerow(["registry", "kind", "key", "declared_value", "resolved_file", "status"])
        for f in findings:
            w.writerow([f["registry"], f["kind"], f["key"], f["declared"],
                        f["resolved_file"] or "", f["status"]])

    for kind, reg in registries.items():
        print(f"{kind}: pairs={reg['pair_count']} entries -> "
              f"resolved={reg['resolved']} missing={reg['missing']} "
              f"scalars={reg['scalars']} case_diffs={reg.get('case_diffs', 0)}")
    print("\n-- MISSING entries (declared but no such file on disk) --")
    for f in findings:
        if f["status"] == "MISSING":
            print(f"  {f['registry']:<18} {f['key']:<12} -> {f['declared']}")
    print("\n-- stage/list.txt character -> stage mappings that DO resolve --")
    for f in findings:
        if f["registry"] == "stage_registry" and f["kind"] == "map" \
                and f["status"] == "resolved":
            print(f"  {f['key']:<12} -> {f['declared']:<18} = {f['resolved_file']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())