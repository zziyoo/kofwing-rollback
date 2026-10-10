#!/usr/bin/env python3
"""
Phase 3 + 4: classify every analysed SWF by evidence, then extract the
dependency edges between SWFs and external resources.

Classification is evidence-driven. Each rule below lists the concrete signals it
looks for, and a file only gets a role if it actually matches. Sprite counts
alone never decide a role - a character library is identified by the character
strings, script behaviour and export names it carries.

Dependency edges are graded:
  CONFIRMED  a literal path handed to a loader API that resolves to a real file
  LIKELY     a literal filename/extension match with a plausible loader nearby
  INFERRED   dynamic concatenation / indirect variable reference (no literal path)
"""
from __future__ import annotations

import csv
import json
import re
import sys
from pathlib import Path

# --- loader API patterns (AS2 flash.* plus AS3) -----------------------
LOAD_CALLS = {
    "loadMovie": re.compile(r"\b(?:_root\.|_level0\.)?loadMovie\s*\(\s*[\"']([^\"']+)[\"']"),
    "loadClip": re.compile(r"\bloadClip\s*\(\s*[\"']([^\"']+)[\"']"),
    "loadVariables": re.compile(r"\bloadVariables\s*\(\s*[\"']([^\"']+)[\"']"),
    "getURL": re.compile(r"\bgetURL\s*\(\s*[\"']([^\"']+)[\"']"),
    "URLLoader": re.compile(r"\bURLLoader\b"),
    "MovieClipLoader": re.compile(r"\bMovieClipLoader\b"),
    "attachSound": re.compile(r"\battachSound\s*\(\s*[\"']([^\"']+)[\"']"),
    "newSound": re.compile(r"\bnew\s+Sound\s*\(\s*\)"),
    "loadSound": re.compile(r"\bloadSound\s*\(\s*[\"']([^\"']+)[\"']"),
    "navigateToURL": re.compile(r"\bnavigateToURL\s*\(\s*[\"']([^\"']+)[\"']"),
}
LOADER_NAME_HINT = re.compile(
    r"\b(loadMovie|loadClip|loadVariables|getURL|attachSound|loadSound|URLLoader|"
    r"MovieClipLoader|navigateToURL)\b"
)
EXT_RE = re.compile(r"^[\w\s\-一-鿿\.]+\.(swf|mp3|wav|txt|xml|ini|dat|jpg|png)$",
                    re.IGNORECASE)

# --- role signatures ---------------------------------------------------
SIG = {
    # stage modules publish bgArray (parallax layer descriptors)
    "stage_bg_contract": re.compile(r"\bbgArray\s*="),
    "bg_layer_fields": re.compile(r"\bisBmd\s*:\s*(?:true|false)|isBase\s*:"),
    # combat engine identifiers seen in the game logic
    "engine": re.compile(
        r"\b(role_mc|char_mc|land_Y|skillNum|hitValue|winTimes|inFreeze|inPause|"
        r"chageSide[12]|player_type|isKO|moreVs3V3|stageID)\b"
    ),
    # SFX bank export names such as Kim_cpu1 / Andy_player / Iori_fire_m1
    "sfx_export_names": re.compile(
        r"^(?:Type2_)?[A-Za-z0-9]+_(?:cpu\d+|player\d?|hurt\d*|hit\w*|fire_\w+|ko_snd_\w+)$"
    ),
    "flash_runtime_api": re.compile(r"\bASSetPropFlags\s*=|\bASnative\s*\(1,0\)"),
    "flash_settings_ui": re.compile(r"\b(LocalStorage|Webcam|Microphone|PrivacyPanel|HardwareAcceleration)\b"),
    "flash_debug_ui": re.compile(r"debug/debug\.swf|\bFocusManager\b|\bUIObjectExtensions\b"),
    "flash_fullscreen_overlay": re.compile(
        r"\bFullScreen_MC\b|\bAlertResponseOverlayMessage\b|"
        r"Press Esc to exit full screen mode"
    ),
    "sharedobject_settings": re.compile(r"\bSharedObject\.getLocal\b|\bSetSetting\s*="),
    "security_allowdomain": re.compile(r"System\.security\.allowDomain"),
    "global_api_use": re.compile(r"\b_level0\.[A-Za-z_][A-Za-z0-9_]*"),
    "root_api_use": re.compile(r"\b_root\.[A-Za-z_][A-Za-z0-9_]*"),
    "xml_parsing": re.compile(r"\bnew\s+XML\s*\(|\.firstChild\b|\.nodeName\b"),
}
SFX_EXT_RE = re.compile(r"\.(wav|mp3)$", re.IGNORECASE)

ROLE_RULES = [
    # (role, confidence, required signals, explanatory note)
    ("stage_background", "high", ["stage_bg_contract", "bg_layer_fields"],
     "defines global bgArray[] of parallax layer descriptors consumed by the main program"),
    ("combat_engine_module", "high", ["engine", "sfx_export_names"],
     "contains battle-engine script AND linked SFX export names (role_mc/land_Y/skillNum/hitValue)"),
    ("combat_engine_module", "medium", ["engine"],
     "contains battle-engine script identifiers (role_mc/land_Y/skillNum/hitValue)"),
    ("sfx_bank", "high", ["sfx_export_names"],
     "ExportAssets names are character voice/hit SFX banks"),
    ("flash_runtime_helper", "high", ["flash_runtime_api"],
     "AS2 runtime API prototype definitions only - no game logic"),
    ("flash_settings_panel", "high", ["flash_settings_ui"],
     "Flash Player settings/permission panel"),
    ("flash_debug_ui", "high", ["flash_debug_ui"],
     "Flash authoring/debug UI component"),
    ("flash_fullscreen_overlay", "high", ["flash_fullscreen_overlay"],
     "Flash Player fullscreen-mode alert overlay"),
    ("settings_store", "medium", ["sharedobject_settings"],
     "SharedObject-backed settings/version module"),
]


def collect_scripts(analysis_root: Path, aid: str) -> list[Path]:
    d = analysis_root / aid / "scripts"
    if not d.exists():
        return []
    return [p for p in d.rglob("*") if p.is_file()]


def classify(aid: str, meta: dict, assets: dict, scripts: list[Path]) -> dict:
    blob_parts = []
    loader_hits = 0
    for p in scripts:
        try:
            t = p.read_text(encoding="utf-8", errors="replace")
        except Exception:  # noqa: BLE001
            continue
        blob_parts.append(t)
    blob = "\n".join(blob_parts)

    present = {k: bool(rx.search(blob)) for k, rx in SIG.items()}
    loader_hits = len(LOADER_NAME_HINT.findall(blob))

    # SFX export-name evidence comes from the tag census, not from script text
    names = assets.get("export_names", [])
    sfx_names = [n for n in names if SIG["sfx_export_names"].match(n)]

    role, conf, why = None, "none", []
    if not meta.get("valid_swf"):
        role, conf = "not_a_swf", "high"
        why.append("SWF signature present but the tag stream does not decode to an End tag")
        return {"role": role, "confidence": conf, "signals": present,
                "evidence": why, "loader_calls": loader_hits,
                "sfx_export_count": len(sfx_names),
                "sfx_sample": [], "level0_api": [], "root_api": [],
                "script_bytes": len(blob)}

    if sfx_names:
        present["sfx_export_names"] = True
    present["sfx_export_count"] = len(sfx_names)

    for cand_role, cand_conf, needed, note in ROLE_RULES:
        if all(present.get(k) for k in needed):
            role, conf = cand_role, cand_conf
            why.append(note)
            break

    if role is None:
        role = "game_module_unclassified"
        conf = "low"
        why.append("no decisive signature matched; needs manual review")

    # sub-signals recorded for the report
    globs = sorted(set(re.findall(r"_level0\.([A-Za-z_][A-Za-z0-9_]*)", blob)))
    rglobs = sorted(set(re.findall(r"_root\.([A-Za-z_][A-Za-z0-9_]*)", blob)))
    return {
        "role": role,
        "confidence": conf,
        "signals": present,
        "evidence": why,
        "loader_calls": loader_hits,
        "sfx_export_count": len(sfx_names),
        "sfx_sample": sfx_names[:12],
        "level0_api": globs[:200],
        "root_api": rglobs[:100],
        "script_bytes": len(blob),
    }


def extract_edges(aid: str, rel: str, scripts: list[Path], known_swf: dict,
                  known_mp3: set, registries: set) -> list[dict]:
    """Pull outbound references out of one SWF's ActionScript."""
    edges = []
    for p in scripts:
        try:
            text = p.read_text(encoding="utf-8", errors="replace")
        except Exception:  # noqa: BLE001
            continue
        lines = text.splitlines()
        for api, rx in LOAD_CALLS.items():
            for m in rx.finditer(text):
                target = m.group(1) if m.lastindex else "(dynamic)"
                ln = text[: m.start()].count("\n") + 1
                snippet = lines[ln - 1].strip() if 0 < ln <= len(lines) else ""
                edges.append(make_edge(rel, target, api, f"{p.name}:{ln}",
                                       snippet, known_swf, known_mp3, registries))
        # dynamic path assembly: "stage/" + name + ".swf"
        for m in re.finditer(r"[\"'][^\"']*[/\\][^\"']*[\"']\s*\+", text):
            ln = text[: m.start()].count("\n") + 1
            edges.append({
                "source_swf": rel,
                "target": m.group(0).strip("\"'"),
                "api": "string_concat",
                "location": f"{p.name}:{ln}",
                "evidence": lines[ln - 1].strip() if 0 < ln <= len(lines) else "",
                "confidence": "INFERRED",
                "note": "path assembled at runtime; exact target unknown statically",
            })
    # dedupe identical source/target/api/location
    seen, out = set(), []
    for e in edges:
        k = (e["source_swf"], e["target"], e["api"], e["location"])
        if k in seen:
            continue
        seen.add(k)
        out.append(e)
    return out


def make_edge(src, target, api, location, snippet, known_swf, known_mp3, registries):
    base = target.replace("\\", "/").split("/")[-1]
    conf, note = "LIKELY", ""
    if api in ("loadMovie", "loadClip", "URLLoader") and base.lower() in known_swf:
        conf = "CONFIRMED"
        note = f"literal path resolves to extracted SWF {known_swf[base.lower()]}"
    elif api in ("attachSound", "loadSound", "newSound") and base.lower() in known_swf:
        conf = "LIKELY"
        note = "linked sound identifier matches a declared export/asset name"
    elif base.lower() in known_swf:
        conf = "LIKELY"
        note = f"string matches extracted SWF {known_swf[base.lower()]}"
    elif base.lower() in known_mp3 or SFX_EXT_RE.search(base):
        conf = "LIKELY"
        note = "external audio reference (sound/ registry or literal audio file)"
    elif base.lower() in registries:
        conf = "CONFIRMED"
        note = "references the external loadVariables() registry file"
    else:
        conf = "INFERRED"
        note = "literal path not present in the extracted tree"
    return {"source_swf": src, "target": target, "api": api, "location": location,
            "evidence": snippet[:220], "confidence": conf, "note": note}


def main() -> int:
    analysis_root = Path(sys.argv[1])
    reports = Path(sys.argv[2])
    game_root = Path(sys.argv[3])

    ids = sorted([d.name for d in analysis_root.iterdir()
              if d.is_dir() and not d.name.startswith("_")])
    classifications, edges, all_level0, all_root = {}, [], {}, {}

    # known targets for resolution
    known_swf, known_mp3, registries = {}, set(), set()
    for p in game_root.rglob("*.swf"):
        known_swf.setdefault(p.name.lower(), str(p.relative_to(game_root)).replace("\\", "/"))
    for p in (game_root / "sound").glob("*"):
        if p.suffix.lower() in (".mp3", ".wav"):
            known_mp3.add(p.name.lower())
    for rel in ("stage/list.txt", "stage2/list.txt", "sound/list.txt"):
        if (game_root / rel).exists():
            registries.add(rel.lower())

    for aid in ids:
        mpath = analysis_root / aid / "metadata.json"
        apath = analysis_root / aid / "assets.json"
        if not mpath.exists():
            continue
        meta = json.loads(mpath.read_text(encoding="utf-8"))
        assets = json.loads(apath.read_text(encoding="utf-8")) if apath.exists() else {}
        scripts = collect_scripts(analysis_root, aid)
        rel = meta["relative_path"]
        cls = classify(aid, meta, assets, scripts)
        cls["relative_path"] = rel
        cls["analysis_id"] = aid
        cls["bytes"] = meta["bytes"]
        cls["script_files"] = len(scripts)
        classifications[aid] = cls
        if cls["level0_api"]:
            all_level0[aid] = cls["level0_api"]
        if cls["root_api"]:
            all_root[aid] = cls["root_api"]
        edges.extend(extract_edges(aid, rel, scripts, known_swf, known_mp3, registries))

    (reports / "classification.json").write_text(
        json.dumps(classifications, ensure_ascii=False, indent=1), encoding="utf-8")

    # NOTE: dependency_edges.csv is owned by build_graph.py, which emits the
    # graded schema (CONFIRMED/PATTERN/MISSING/INFERRED) that the reports cite.
    # Writing here too used to silently clobber it with a different schema.
    # This tool's coarser edge list goes to a separate, clearly-named file.
    legacy_edges = reports / "dependency_edges_classify_legacy.csv"
    with legacy_edges.open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.DictWriter(fh, fieldnames=["source_swf", "target", "api", "location",
                                           "evidence", "confidence", "note"])
        w.writeheader()
        order = {"CONFIRMED": 0, "LIKELY": 1, "INFERRED": 2}
        for e in sorted(edges, key=lambda e: (order[e["confidence"]], e["source_swf"])):
            w.writerow(e)

    (reports / "_edges.json").write_text(
        json.dumps(edges, ensure_ascii=False, indent=1), encoding="utf-8")
    (reports / "_level0_api.json").write_text(
        json.dumps(all_level0, ensure_ascii=False, indent=1), encoding="utf-8")

    from collections import Counter
    print("role histogram:")
    for r, c in Counter(v["role"] for v in classifications.values()).most_common():
        print(f"  {r:<28} {c}")
    print(f"\nedges: {len(edges)}  "
          f"(CONFIRMED={sum(1 for e in edges if e['confidence'] == 'CONFIRMED')}, "
          f"LIKELY={sum(1 for e in edges if e['confidence'] == 'LIKELY')}, "
          f"INFERRED={sum(1 for e in edges if e['confidence'] == 'INFERRED')})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())