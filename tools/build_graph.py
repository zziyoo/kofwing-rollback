#!/usr/bin/env python3
"""
Build the SWF dependency graph.

Edges are extracted from real loader calls found in the exported ActionScript.
For every edge we record the exact script file and line, the literal code that
produced it, and a confidence grade.

Confidence grading rules
  CONFIRMED  a literal, non-concatenated path handed to a loader AND the target
             exists on disk (or is a registry file we verified).
  PATTERN    a literal directory/extension prefix that the game concatenates
             with a runtime variable. The shape of the dependency is proven by
             the code, but the exact file cannot be known statically.
  MISSING    same as PATTERN, but no file in the tree can satisfy it.
  INFERRED   indirect/dynamic reference with no literal path at all.
"""
from __future__ import annotations

import csv
import json
import re
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
ANALYSIS = REPO / "analysis"
REPORTS = REPO / "reports"
GAME_ROOT = Path(sys.argv[1]) if len(sys.argv) > 1 else REPO.parent

# Calls that pull in an external file. Tuple = (api, regex, group holding the path).
LOAD_PATTERNS = [
    ("MovieClipLoader.loadClip", re.compile(r"\.?loadClip\s*\(\s*\"([^\"]+)\""), 1),
    ("loadMovie", re.compile(r"\.?loadMovie\s*\(\s*\"([^\"]+)\""), 1),
    ("LoadVars.load", re.compile(r"\b\w+\.load\s*\(\s*\"([^\"]+\.txt)\""), 1),
    ("Sound.loadSound", re.compile(r"\.?loadSound\s*\(\s*\"([^\"]+)\""), 1),
    ("Sound.attachSound", re.compile(r"\.?attachSound\s*\(\s*\"([^\"]+)\""), 1),
    ("getURL", re.compile(r"\bgetURL\s*\(\s*\"([^\"]+)\""), 1),
]

CONCAT = re.compile(r"\"([^\"]*?)\"\s*\+\s*[A-Za-z_$][\w$]*")
CONCAT2 = re.compile(r"[A-Za-z_$][\w$]*\s*\+\s*\"([^\"]*?)\"")


def existing(relpath: str) -> bool:
    p = (GAME_ROOT / relpath)
    return p.exists()


_NAME_INDEX: dict[str, str] | None = None


def _build_name_index() -> dict[str, str]:
    """One walk of the game root, reused for every edge.

    The previous implementation re-walked the whole tree (including the 146 MB
    EXE) once per edge; with hundreds of edges that dominated the runtime.
    """
    global _NAME_INDEX
    if _NAME_INDEX is None:
        idx: dict[str, str] = {}
        for p in GAME_ROOT.rglob("*"):
            if p.is_file():
                idx.setdefault(p.name.lower(), str(p.relative_to(GAME_ROOT)).replace("\\", "/"))
        _NAME_INDEX = idx
    return _NAME_INDEX


def any_file_named(name: str) -> str | None:
    return _build_name_index().get(name.lower())


def scan_scripts():
    """Yield (analysis_id, relative_swf, script_path, line_no, line_text)."""
    for aid in sorted(d.name for d in ANALYSIS.iterdir() if d.is_dir() and not d.name.startswith("_")):
        mpath = ANALYSIS / aid / "metadata.json"
        if not mpath.exists():
            continue
        rel = json.loads(mpath.read_text(encoding="utf-8"))["relative_path"]
        sdir = ANALYSIS / aid / "scripts"
        if not sdir.exists():
            continue
        for sp in sdir.rglob("*"):
            if not sp.is_file():
                continue
            try:
                text = sp.read_text(encoding="utf-8", errors="replace")
            except Exception:  # noqa: BLE001
                continue
            for i, line in enumerate(text.splitlines(), 1):
                if line.strip():
                    yield aid, rel, sp, i, line.strip()


def main() -> int:
    edges = []
    seen = set()

    def add(**kw):
        key = (kw["source"], kw["target_pattern"], kw["api"], kw["location"])
        if key in seen:
            return
        seen.add(key)
        edges.append(kw)

    for aid, rel, sp, ln, line in scan_scripts():
        for api, rx, gidx in LOAD_PATTERNS:
            for m in rx.finditer(line):
                lit = m.group(gidx)
                if "+" in lit:
                    continue  # handled by the concatenation pass below
                conf, note, resolved = grade_literal(lit, api)
                add(source=rel, target_pattern=lit, api=api,
                    location=f"{aid}: {sp.name}:{ln}",
                    evidence=line[:240], confidence=conf, note=note,
                    resolved_target=resolved or "")

        # concatenated paths: "stage/" + bgID + ".swf"
        for m in CONCAT.finditer(line):
            prefix = m.group(1)
            if not prefix or "/" not in prefix:
                continue
            conf, note, _ = grade_prefix(prefix, line)
            add(source=rel, target_pattern=f"{prefix}<variable>.swf",
                api="dynamic_path_concat", location=f"{aid}: {sp.name}:{ln}",
                evidence=line[:240], confidence=conf, note=note, resolved_target="")

    order = {"CONFIRMED": 0, "PATTERN": 1, "MISSING": 2, "INFERRED": 3}
    edges.sort(key=lambda e: (order[e["confidence"]], e["source"], e["target_pattern"]))

    with (REPORTS / "dependency_edges.csv").open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.DictWriter(fh, fieldnames=["source", "target_pattern", "api", "location",
                                           "evidence", "confidence", "resolved_target", "note"])
        w.writeheader()
        w.writerows(edges)

    (REPORTS / "_edges_full.json").write_text(
        json.dumps(edges, ensure_ascii=False, indent=1), encoding="utf-8")

    # --- mermaid graph -------------------------------------------------
    mmd = ["graph LR"]
    mmd.append('  subgraph EXE["wingex1.2.exe (Flash Projector)"]')
    mmd.append('    BOOT["21256864.swf<br/>MAIN GAME<br/>125 MB / ZWS v15"]')
    mmd.append('    ENG["kofwing combat+SFX modules<br/>11480055 / 16695748<br/>18464326 / 8492959"]')
    mmd.append('    RT["Flash runtime helpers<br/>6148152 / 6230976 / 6235248<br/>7298128 / 20817874"]')
    mmd.append('  end')
    mmd.append('  subgraph EXT["External runtime directories"]')
    mmd.append('    CH["char/ (MISSING)<br/>character modules"]')
    mmd.append('    SK["data/skillList.swf (MISSING)<br/>move tables"]')
    mmd.append('    CODE["code.swf (MISSING)"]')
    mmd.append('    STG["stage/*.swf<br/>83 stage SWFs"]')
    mmd.append('    WTH["stage/weather/*.swf (MISSING)"]')
    mmd.append('    SOUND["sound/*.mp3<br/>43 tracks + list.txt"]')
    mmd.append('  end')
    mmd.append('  REG1["stage/list.txt"]')
    mmd.append('  REG2["stage2/list.txt"]')
    mmd.append('  REG3["sound/list.txt"]')
    mmd.append('  BOOT -->|"loadClip char/&lt;role&gt;.swf"| CH')
    mmd.append('  BOOT -->|"loadMovie data/skillList.swf"| SK')
    mmd.append('  BOOT -->|"loadMovie code.swf"| CODE')
    mmd.append('  BOOT -->|"LoadVars.load stage/list.txt"| REG1')
    mmd.append('  BOOT -->|"LoadVars.load sound/list.txt"| REG3')
    mmd.append('  REG1 -->|"bgID name list"| BOOT')
    mmd.append('  REG3 -->|"char->mp3 map"| BOOT')
    mmd.append('  BOOT -->|"loadClip stage/&lt;bgID&gt;.swf"| STG')
    mmd.append('  BOOT -->|"loadMovie stage/weather/&lt;tq&gt;.swf"| WTH')
    mmd.append('  BOOT -->|"Sound.loadSound sound/&lt;file&gt;.mp3"| SOUND')
    mmd.append('  STG -.->|"exports bgArray[] back"| BOOT')
    mmd.append('  CH -.->|"if present: role/skill/hitbox"| BOOT')
    mmd.append('  ENG -.->|"embedded in EXE"| BOOT')
    mmd.append('  RT -.->|"Flash Player runtime"| BOOT')
    mmd.append("  classDef ok fill:#d4edda,stroke:#28a745")
    mmd.append("  classDef miss fill:#f8d7da,stroke:#dc3545")
    mmd.append("  classDef ext fill:#d1ecf1,stroke:#17a2b8")
    mmd.append("  class CH,SK,CODE,WTH miss")
    mmd.append("  class STG,SOUND,REG1,REG2,REG3 ext")
    (REPORTS / "dependency_graph.mmd").write_text("\n".join(mmd), encoding="utf-8")

    from collections import Counter
    print("edge confidence histogram:",
          dict(Counter(e["confidence"] for e in edges)))
    print("total edges:", len(edges))
    print("\n-- CONFIRMED --")
    for e in edges:
        if e["confidence"] == "CONFIRMED":
            print(f"  {e['source']:<22} -> {e['target_pattern']:<24} [{e['api']}]")
    print("\n-- MISSING --")
    for e in edges:
        if e["confidence"] == "MISSING":
            print(f"  {e['source']:<22} -> {e['target_pattern']:<34} [{e['api']}]")
    return 0


def grade_literal(lit: str, api: str = ""):
    norm = lit.replace("\\", "/")
    # attachSound("boom.wav") with no directory is a link id resolved from the
    # SWF's OWN sound library, not an external file.
    if api == "Sound.attachSound" and "/" not in norm:
        return ("INFERRED",
                "bare link id - resolved from this SWF's internal DefineSound/ExportAssets "
                "library, not an external file", "")
    if norm.lower().endswith(".txt"):
        if existing(norm):
            return "CONFIRMED", "registry text file exists on disk", norm
        return "MISSING", "referenced text file not present in the tree", ""
    if norm.lower().startswith("http://") or norm.lower().startswith("https://"):
        return "INFERRED", "remote URL, only reachable with network access", ""
    if norm.lower().endswith((".mp3", ".wav")):
        if existing(norm):
            return "CONFIRMED", "audio file exists on disk", norm
        return "MISSING", "audio file not present (may be an embedded link id)", ""
    if norm.lower().endswith(".swf"):
        hit = any_file_named(Path(norm).name)
        if hit:
            return "CONFIRMED", f"resolves to extracted SWF {hit}", hit
        return "MISSING", "SWF not present in the extracted tree", ""
    return "INFERRED", "non-file reference (link id / UI asset)", ""


def grade_prefix(prefix: str, line: str):
    """A literal directory prefix concatenated with a runtime variable."""
    first = prefix.split("/")[0].lower()
    exists_dir = (GAME_ROOT / first).exists()
    if exists_dir:
        return "PATTERN", f"directory `{prefix}` exists; filename chosen at runtime", ""
    return "MISSING", (f"directory `{prefix}` does not exist in this distribution - "
                       f"the game falls back or the files are shipped separately"), ""


if __name__ == "__main__":
    raise SystemExit(main())