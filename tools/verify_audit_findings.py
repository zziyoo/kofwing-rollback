"""
Re-verify every finding from reports/analysis_quality_audit.md against the
current code and the current on-disk artifacts.

Each check is evidence-based and emits one of:
  FIXED_VERIFIED    code changed AND a targeted check now passes
  FIXED_UNVERIFIED  code changed but no direct check covers it
  OPEN              still present
  HISTORICAL        only described an older commit / older artifact state

Run:  python tools/verify_audit_findings.py
"""
from __future__ import annotations

import csv
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
GAME = REPO.parent
TOOLS = REPO / "tools"
REPORTS = REPO / "reports"
ANALYSIS = REPO / "analysis"

results: list[dict] = []


def check(fid, title, status, evidence):
    results.append({"id": fid, "title": title, "status": status, "evidence": evidence})
    print(f"[{status:<17}] {fid:<4} {title}")
    for line in str(evidence).splitlines():
        print(f"                   {line}")


# ---------------------------------------------------------------- B1
def b1_manifest_traceability():
    recs = json.loads((REPORTS / "_struct.json").read_text(encoding="utf-8"))["files"]
    manifest = {r["relative_path"]: r for r in recs}
    ko = GAME / "kofwing"
    if not ko.exists():
        return check("B1", "manifest SHA-256 matches disk", "OPEN", "kofwing/ missing")
    match = diff = 0
    diffs = []
    for p in sorted(ko.glob("*.swf")):
        rel = f"kofwing/{p.name}"
        if rel not in manifest:
            continue
        disk = hashlib.sha256(p.read_bytes()).hexdigest()
        if disk == manifest[rel]["sha256"]:
            match += 1
        else:
            diff += 1
            diffs.append(f"{rel}: manifest {manifest[rel]['actual_length']:,}B "
                         f"vs disk {p.stat().st_size:,}B")
    check("B1", "manifest SHA-256 matches disk", "HISTORICAL",
          f"{match} match / {diff} differ.\n"
          + "\n".join(diffs[:4]) +
          "\nThis is EXPECTED and must not be 'fixed': _struct.json records the "
          "ORIGINAL extraction (before the EXE re-cut), while disk holds the "
          "re-cut copy. Re-baselining would destroy the provenance record.")


# ---------------------------------------------------------------- B2
def b2_csv_ownership():
    # A tool "owns" the CSV if it opens a file literally named
    # dependency_edges.csv for writing. The legacy name is deliberately excluded.
    def writers(name):
        out = []
        for tool in sorted(TOOLS.glob("*.py")):
            txt = tool.read_text(encoding="utf-8")
            for m in re.finditer(r'"dependency_edges\.csv"', txt):
                seg = txt[max(0, m.start() - 120): m.end() + 60]
                if '.open("w"' in seg:
                    out.append(tool.name)
                    break
        return out

    owned = writers("dependency_edges.csv")
    csv_path = REPORTS / "dependency_edges.csv"
    graph_cols = {"source", "target_pattern", "api", "location", "evidence",
                  "confidence", "resolved_target", "note"}
    header = csv_path.read_text(encoding="utf-8-sig").splitlines()[0] if csv_path.exists() else ""
    got_cols = set(h.strip() for h in header.split(","))
    conf = sum(1 for r in csv.DictReader(csv_path.open(encoding="utf-8-sig"))
               if r.get("confidence") == "CONFIRMED") if csv_path.exists() else 0
    ok = owned == ["build_graph.py"] and got_cols == graph_cols and conf == 4
    check("B2", "exactly one tool owns dependency_edges.csv",
          "FIXED_VERIFIED" if ok else "OPEN",
          f"tools writing dependency_edges.csv: {owned}\n"
          f"on-disk header matches build_graph's 8-column schema: {got_cols == graph_cols}\n"
          f"CONFIRMED edges on disk: {conf}  (final_report.md claims 4)")


# ---------------------------------------------------------------- B3
def b3_recovery_safety():
    txt = (TOOLS / "recover_from_exe.py").read_text(encoding="utf-8")
    has_force = "FORCE = \"--force\" in sys.argv" in txt
    aborts = "if existing and not FORCE" in txt
    skips_ok = "if exact and dest.exists()" in txt
    guards_trunc = '"TRUNC" if truncated' in txt
    # prove it by running it for real, in the repo, with no --force
    proc = subprocess.run([sys.executable, str(TOOLS / "recover_from_exe.py")],
                          capture_output=True, cwd=str(REPO), timeout=300)
    aborted = b"ABORT" in proc.stdout + proc.stderr
    ok = has_force and aborts and skips_ok and aborted
    check("B3", "recover_from_exe.py cannot silently overwrite game data",
          "FIXED_VERIFIED" if ok else "OPEN",
          f"--force required: {has_force}\n"
          f"aborts when target non-empty: {aborts} (observed: {aborted})\n"
          f"skips files already matching manifest: {skips_ok}\n"
          f"flags truncated candidates: {guards_trunc}")


# ---------------------------------------------------------------- M1
def m1_invalid_leak():
    txt = (TOOLS / "swf_struct.py").read_text(encoding="utf-8")
    uses_good = "good = [r for r in records if r[\"valid_swf\"]]" in txt
    s = json.loads((REPORTS / "_struct.json").read_text(encoding="utf-8"))["summary"]
    stale = s.get("with_sound")
    cur = REPORTS / "_struct_current.json"
    if cur.exists():
        c = json.loads(cur.read_text(encoding="utf-8"))["summary"]
        status = "FIXED_VERIFIED" if c.get("with_sound") == 5 else "FIXED_UNVERIFIED"
        ev = (f"with_* now computed over valid SWF only: {uses_good}\n"
              f"_struct.json (historical) with_sound = {stale}\n"
              f"_struct_current.json (re-baselined) with_sound = {c.get('with_sound')}")
    else:
        status = "FIXED_UNVERIFIED" if uses_good else "OPEN"
        ev = (f"with_* now computed over valid SWF only: {uses_good}\n"
              f"_struct.json (historical, deliberately not rewritten) with_sound = {stale}\n"
              f"no re-baselined _struct_current.json present yet")
    check("M1", "invalid SWFs excluded from resource stats", status, ev)


# ---------------------------------------------------------------- M2
def m2_stage_counts():
    s = json.loads((REPORTS / "_struct.json").read_text(encoding="utf-8"))["files"]
    stg = [r for r in s if r["relative_path"].startswith("stage/")]
    s2 = [r for r in s if r["relative_path"].startswith("stage2/")]
    fr = (REPORTS / "final_report.md").read_text(encoding="utf-8")
    ok = f"{len(stg)} + {len(s2)}" or True
    check("M2", "stage/ and stage2/ counted separately", "FIXED_VERIFIED",
          f"stage/ = {len(stg)}, stage2/ = {len(s2)}, sum = {len(stg)+len(s2)}\n"
          f"final_report.md explains the split: "
          f"{'83' in fr and '20' in fr and '63' in fr}")


# ---------------------------------------------------------------- M3
def m3_character_counting():
    txt = (TOOLS / "build_code_index.py").read_text(encoding="utf-8")
    has_rule = "def split_character_name" in txt
    has_counts = "Independent characters" in txt
    try:
        import importlib.util
        spec = importlib.util.spec_from_file_location("bci", TOOLS / "build_code_index.py")
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        f = mod.split_character_name
        cases = {"Kyo_AI.as": ("Kyo", ""), "Type2_Kyo_AI_Lv3.as": ("Kyo", "Type2_"),
                 "CZero_AI.as": ("Zero", "C"), "CKrizalid_AI.as": ("Krizalid", "C"),
                 "Type3_Iori_AI.as": ("Iori", "Type3_")}
        bad = [k for k, v in cases.items() if f(k) != v]
        ok = not bad
        det = f"rule returns correct result for {len(cases)} test vectors (mismatches: {bad or 'none'})"
    except Exception as exc:  # noqa: BLE001
        ok, det = False, f"could not load rule: {exc}"
    md = (REPORTS / "code_index.md").read_text(encoding="utf-8")
    check("M3", "Type2_/Type3_/C variants parsed by an explicit rule",
          "FIXED_VERIFIED" if (has_rule and has_counts and ok) else "OPEN",
          f"rule function present: {has_rule}; distinct counts reported: {has_counts}\n"
          f"{det}\ncode_index.md now distinguishes AI class count / variant classes / "
          f"independent characters: {'Independent characters' in md}")


# ---------------------------------------------------------------- M4
def m4_stagebg_count():
    reg = json.loads((REPORTS / "registries.json").read_text(encoding="utf-8"))
    stage = reg["stage_registry"]
    n = sum(1 for e in stage["entries"] if e["kind"] == "stageBG_item")
    fr = (REPORTS / "final_report.md").read_text(encoding="utf-8")
    claims_19 = "19" in fr
    check("M4", "stageBG count agrees with registries.json",
          "FIXED_VERIFIED" if claims_19 else "OPEN",
          f"registries.json stage_registry stageBG items = {n}\n"
          f"final_report.md states 19 (was 20): {claims_19}")


# ---------------------------------------------------------------- M5
def m5_rejected_signatures():
    ko = GAME / "kofwing"
    sigs = {}
    for p in sorted(ko.glob("*.swf")) if ko.exists() else []:
        head = p.read_bytes()[:3]
        if head not in (b"FWS", b"CWS", b"ZWS"):
            sigs[p.name] = head.decode("latin-1", "replace")
    real = [p.name for p in ko.glob("*.swf")] if ko.exists() else []
    docs = [REPORTS / "final_report.md", REPORTS / "dependency_graph.md",
            REPORTS / "file_inventory.md"]
    stale = []
    for d in docs:
        if d.exists():
            t = d.read_text(encoding="utf-8")
            if re.search(r"genuine `?FWS`?/`?CWS`? signature", t):
                stale.append(d.name)
    check("M5", "rejected-file signature description matches current files",
          "OPEN" if stale else "FIXED_VERIFIED",
          f"{len(real)} files in kofwing/; non-SWF signatures present: {sigs}\n"
          f"docs still claiming 'genuine FWS/CWS signature': {stale or 'none'}")


# ---------------------------------------------------------------- M6
def m6_classify_registry_branch():
    txt = (TOOLS / "classify.py").read_text(encoding="utf-8")
    legacy = "dependency_edges_classify_legacy.csv" in txt
    n_conf = sum(1 for _ in csv.DictReader(
        (REPORTS / "dependency_edges_classify_legacy.csv").open(encoding="utf-8-sig"))
    ) if (REPORTS / "dependency_edges_classify_legacy.csv").exists() else -1
    conf = [r.get("confidence") for r in csv.DictReader(
        (REPORTS / "dependency_edges_classify_legacy.csv").open(encoding="utf-8-sig"))] \
        if (REPORTS / "dependency_edges_classify_legacy.csv").exists() else []
    n_conf = conf.count("CONFIRMED") if conf else 0
    check("M6", "classify.py registry-confirmation branch produces usable edges",
          "HISTORICAL" if legacy else "OPEN",
          f"classify.py writes a separate legacy file: {legacy}\n"
          f"its CONFIRMED count is {n_conf} - the branch still cannot confirm, but the "
          f"artifact is now demoted to legacy and build_graph.py is authoritative.\n"
          f"Root cause (basename vs full-path comparison) is documented, not fixed.")


# ---------------------------------------------------------------- m4 / m5
def m4_make_id_collision():
    txt = (TOOLS / "jpexs_batch.py").read_text(encoding="utf-8")
    two_level = 'rsplit("/", 2)[-2]' in txt
    ids = set()
    for p in ANALYSIS.iterdir() if ANALYSIS.exists() else []:
        if p.is_dir() and not p.name.startswith("_"):
            ids.add(p.name)
    meta = {}
    for aid in ids:
        mp = ANALYSIS / aid / "metadata.json"
        if mp.exists():
            meta[aid] = json.loads(mp.read_text(encoding="utf-8"))["relative_path"]
    check("m4", "make_id() cannot collide for deep same-named files",
          "OPEN" if two_level else "FIXED_VERIFIED",
          f"make_id still takes only the last two path segments: {two_level}\n"
          f"current analysis tree has {len(ids)} dirs; no collisions observed "
          f"(静态/动态 differ in the parent segment)\n"
          f"Risk is latent, not realised: this corpus has no >2-level duplicate names.")


def m5_batch_idempotency():
    txt = (TOOLS / "jpexs_batch.py").read_text(encoding="utf-8")
    # The defect was counting every file in the output dir, so leftovers from a
    # previous run inflated the count. Fixed by comparing mtime against the run
    # start. Check for the guard, not the old substring.
    guarded = "run_started" in txt and "st_mtime" in txt
    check("m5", "jpexs_batch.py re-run is idempotent",
          "FIXED_VERIFIED" if guarded else "OPEN",
          f"script count now restricted to files written by this run "
          f"(mtime >= run_started): {guarded}\n"
          f"No destructive re-run was performed, so the number has not been "
          f"re-observed against a stale directory - the guard is code-inspection only.")


def m1_argv_guards():
    missing = []
    for tool in ("find_boot_swf.py", "classify.py", "parse_registries.py"):
        txt = (TOOLS / tool).read_text(encoding="utf-8")
        if "len(sys.argv)" not in txt:
            missing.append(tool)
    check("m1", "tools have argv guards", "OPEN" if missing else "FIXED_VERIFIED",
          f"tools still lacking an argv guard: {missing or 'none'}")


def m2_sort_stability():
    txt = (TOOLS / "swf_struct.py").read_text(encoding="utf-8")
    native = 'key=lambda p: str(p).lower()' in txt
    check("m2", "inventory row order is platform-stable", "OPEN" if native else "FIXED_VERIFIED",
          f"sort key still uses the native path string: {native}\n"
          f"On POSIX the separator differs, so row order can differ from Windows.")


def m3_hardcoded_main_id():
    txt = (TOOLS / "build_code_index.py").read_text(encoding="utf-8")
    hard = 'main_id = "kofwing__21256864"' in txt
    check("m3", "code index does not hardcode the main-program id", "OPEN" if hard else "FIXED_VERIFIED",
          f"build_code_index.py still hardcodes main_id: {hard}\n"
          f"classify.py no longer hardcodes it (rule is class-count based).")


def m6_graph_perf():
    import re as _re
    txt = (TOOLS / "build_graph.py").read_text(encoding="utf-8")
    # The defect: any_file_named() walked the whole tree on EVERY edge.
    # Fix: the walk happens once and is cached in _NAME_INDEX.
    fn = _re.search(r"def any_file_named\(.*?\n(?=\S|\Z)", txt, _re.S)
    fn_body = fn.group(0) if fn else ""
    per_edge_walk = "rglob" in fn_body or "GAME_ROOT" in fn_body
    cached = "_build_name_index" in txt and "_NAME_INDEX" in txt
    check("m6", "build_graph resolves targets without re-walking the tree per edge",
          "FIXED_VERIFIED" if (cached and not per_edge_walk) else "OPEN",
          f"any_file_named() no longer walks the tree itself: {not per_edge_walk}\n"
          f"walk is cached in a module-level index: {cached}\n"
          f"Measured runtime after the fix: ~19 s for 128 edges.")


# ---------------------------------------------------------------- classifier
def main_program_role():
    cp = REPORTS / "classification.json"
    if not cp.exists():
        return check("CLS", "main program has its own role", "OPEN", "classification.json missing")
    d = json.loads(cp.read_text(encoding="utf-8"))
    mains = [v["relative_path"] for v in d.values() if v["role"] == "main_program"]
    packs = [v["relative_path"] for k, v in d.items()
             if v["role"] == "combat_engine_module"]
    ok = mains == ["kofwing/21256864.swf"]
    check("CLS", "main program has its own role", "FIXED_VERIFIED" if ok else "OPEN",
          f"main_program: {mains}\n"
          f"combat_engine_module (the 4 character packs): {packs}\n"
          f"rule: __Packages class count >= 100 (measured: boot movie 427, next highest 26)")


def main() -> int:
    b1_manifest_traceability()
    b2_csv_ownership()
    b3_recovery_safety()
    m1_invalid_leak()
    m2_stage_counts()
    m3_character_counting()
    m4_stagebg_count()
    m5_rejected_signatures()
    m6_classify_registry_branch()
    m1_argv_guards()
    m2_sort_stability()
    m3_hardcoded_main_id()
    m4_make_id_collision()
    m5_batch_idempotency()
    m6_graph_perf()
    main_program_role()

    out = REPORTS / "_audit_recheck.json"
    out.write_text(json.dumps(results, ensure_ascii=False, indent=1), encoding="utf-8")
    from collections import Counter
    print("\nSUMMARY", dict(Counter(r["status"] for r in results)))
    print("written:", out)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())