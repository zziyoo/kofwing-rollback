"""
Phase 1 - code-level evidence for the four missing runtime dependencies, plus a
diff summary of the shared engine classes that are duplicated across the boot
movie and the four EXE-embedded character packs.

Everything here is derived from the decompiled ActionScript that came out of the
EXE, so it is independent of whatever currently sits in stage/ or sound/ on disk.
"""
from __future__ import annotations

import csv
import hashlib
import json
import re
from pathlib import Path

REPO = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版\_reverse")
ANALYSIS = REPO / "analysis"
REPORTS = REPO / "reports"

MAIN = "kofwing__21256864"
PACKS = ["kofwing__11480055", "kofwing__16695748",
         "kofwing__18464326", "kofwing__8492959"]
ENGINE_CLASSES = [
    "role_corn/Role.as",
    "role_corn/KeyControl.as",
    "HitCheck.as",
    "HitCheck_obj.as",
    "role_corn/Combo_listener.as",
    "skill/FlyingObj.as",
]

# The four dependencies we must account for, with the loader patterns that imply them.
DEPENDENCIES = {
    "char/<role>.swf": {
        "why": "per-character module loaded into the player's empty movie clip",
    },
    "data/skillList.swf": {
        "why": "move/command table, driven via onLoadSkill()",
    },
    "code.swf": {
        "why": "loaded into code_mc at the top level",
    },
    "stage/weather/<tq>.swf": {
        "why": "weather overlay selected by the stage module via _root.tq",
    },
}


def scripts_dir(aid: str) -> Path | None:
    base = ANALYSIS / aid / "scripts"
    if not base.exists():
        return None
    return next((p for p in base.rglob("__Packages") if p.is_dir()), base)


def find_dep_evidence() -> list[dict]:
    rows = []
    base = ANALYSIS / MAIN
    needles = [
        ("char/<role>.swf", re.compile(r"[\"'](char/)")),
        ("data/skillList.swf", re.compile(r"skillList\.swf")),
        ("code.swf", re.compile(r"[\"']code\.swf[\"']")),
        ("stage/weather/<tq>.swf", re.compile(r"stage/weather/")),
    ]
    for dep, rx in needles:
        hits = []
        for p in base.rglob("*.as"):
            try:
                text = p.read_text(encoding="utf-8", errors="replace")
            except Exception:
                continue
            for i, line in enumerate(text.splitlines(), 1):
                if rx.search(line):
                    hits.append({
                        "script": str(p.relative_to(base)).replace("\\", "/"),
                        "line": i,
                        "code": line.strip()[:200],
                    })
        dynamic = any(('"' in h["code"] and "'" in h["code"]) or "+" in h["code"]
                      for h in hits)
        rows.append({
            "dependency": dep,
            "purpose": DEPENDENCIES[dep]["why"],
            "call_sites": len(hits),
            "path_is_dynamic": dynamic,
            "sites": hits,
        })
    return rows


def trace_post_load(dep_file_glob: str, symbols: list[str]) -> list[dict]:
    """Find where a loaded object's members are used after the load call."""
    base = ANALYSIS / MAIN
    out = []
    for sym in symbols:
        rx = re.compile(rf"\b{re.escape(sym)}\b")
        hits = []
        for p in base.rglob("*.as"):
            try:
                text = p.read_text(encoding="utf-8", errors="replace")
            except Exception:
                continue
            for i, line in enumerate(text.splitlines(), 1):
                if rx.search(line):
                    hits.append({
                        "script": str(p.relative_to(base)).replace("\\", "/"),
                        "line": i,
                        "code": line.strip()[:200],
                    })
        out.append({"symbol": sym, "uses": len(hits), "sites": hits})
    return out


def engine_diff() -> list[dict]:
    rows = []
    for cls in ENGINE_CLASSES:
        variants = {}
        for aid in [MAIN] + PACKS:
            sd = scripts_dir(aid)
            if sd is None:
                continue
            target = sd / "__Packages" / cls if "__Packages" in str(sd) else sd / cls
            cands = [target] if target.exists() else list(sd.rglob(Path(cls).name))
            cands = [c for c in cands if c.is_file() and c.name == Path(cls).name]
            if not cands:
                continue
            p = cands[0]
            b = p.read_bytes()
            variants[aid] = {
                "bytes": len(b),
                "sha256": hashlib.sha256(b).hexdigest(),
                "lines": b.count(b"\n") + 1,
            }
        shas = {v["sha256"] for v in variants.values()}
        rows.append({
            "class": cls,
            "copies": len(variants),
            "distinct_variants": len(shas),
            "identical_across_all": len(shas) == 1,
            "per_module": variants,
        })
    return rows


def line_diff_summary(cls: str) -> dict | None:
    """For a class with >1 variant, report how many lines actually differ."""
    variants = {}
    for aid in [MAIN] + PACKS:
        sd = scripts_dir(aid)
        if sd is None:
            continue
        cands = [p for p in sd.rglob(Path(cls).name)
                 if p.is_file() and p.name == Path(cls).name]
        if not cands:
            continue
        variants[aid] = cands[0].read_text(encoding="utf-8", errors="replace")
    if len(variants) < 2:
        return None
    base_aid = MAIN if MAIN in variants else list(variants)[0]
    base = variants[base_aid].splitlines()
    out = []
    for aid, text in variants.items():
        if aid == base_aid:
            continue
        other = text.splitlines()
        same = sum(1 for a, b in zip(base, other) if a == b)
        out.append({
            "compared_against": base_aid,
            "module": aid,
            "base_lines": len(base),
            "module_lines": len(other),
            "identical_lines": same,
            "differing_lines": max(len(base), len(other)) - same,
            "pct_identical": round(100.0 * same / max(1, max(len(base), len(other))), 2),
        })
    return {"class": cls, "comparisons": out}


def main() -> int:
    deps = find_dep_evidence()
    post = {
        "data/skillList.swf": trace_post_load(
            "data/skillList.swf", ["skList", "onLoadSkill", "currentName", "currentMode"]),
        "code.swf": trace_post_load("code.swf", ["code_mc"]),
        "char/<role>.swf": trace_post_load("char/<role>.swf",
                                           ["P1_mc", "P2_mc", "_lockroot", "roleName"]),
    }
    eng = engine_diff()
    details = {c["class"]: line_diff_summary(c["class"]) for c in eng}

    REPORTS.mkdir(parents=True, exist_ok=True)
    (REPORTS / "_runtime_dep_evidence.json").write_text(
        json.dumps({"dependencies": deps, "post_load": post,
                    "engine_diff": eng, "engine_line_diff": details},
                   ensure_ascii=False, indent=1), encoding="utf-8")

    with (REPORTS / "runtime_dependency_audit.csv").open(
            "w", newline="", encoding="utf-8-sig") as fh:
        w = csv.writer(fh)
        w.writerow(["dependency", "purpose", "call_sites", "path_is_dynamic",
                    "script", "line", "code"])
        for d in deps:
            if not d["sites"]:
                w.writerow([d["dependency"], d["purpose"], 0, d["path_is_dynamic"], "", "", ""])
            for s in d["sites"]:
                w.writerow([d["dependency"], d["purpose"], d["call_sites"],
                            d["path_is_dynamic"], s["script"], s["line"], s["code"]])

    print("=== 依赖调用点 ===")
    for d in deps:
        print(f"{d['dependency']:<26} sites={d['call_sites']:<3} dynamic={d['path_is_dynamic']}")
        for s in d["sites"][:4]:
            print(f"    {s['script']}:{s['line']}  {s['code'][:110]}")
    print("\n=== 引擎副本差异 ===")
    for e in eng:
        print(f"{e['class']:<28} copies={e['copies']} distinct={e['distinct_variants']} "
              f"identical={e['identical_across_all']}")
        if details.get(e["class"]):
            for c in details[e["class"]]["comparisons"]:
                print(f"    vs {c['module']}: {c['differing_lines']} lines differ "
                      f"({c['pct_identical']}% identical)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())