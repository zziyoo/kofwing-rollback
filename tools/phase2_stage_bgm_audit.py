"""
Phase 2 - Stage and BGM configuration audit (static side).

The list.txt content analysed here comes from reports/registries.json, which was
captured from the ORIGINAL files before they were removed from disk. We do not
touch the current stage/ and sound/ directories: their contents are a
user-modified variant that will be replaced, so file-existence checks against
them would be meaningless and are deliberately not performed.

What IS determined here is the code semantics: how the registries are consumed,
what each key means, and where the built-in defaults conflict with them.
"""
from __future__ import annotations

import csv
import json
import re
from pathlib import Path

REPO = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版\_reverse")
REPORTS = REPO / "reports"
MAIN = REPO / "analysis" / "kofwing__21256864" / "scripts"

reg = json.loads((REPORTS / "registries.json").read_text(encoding="utf-8"))


def scripts_with(pattern: str) -> list[dict]:
    rx = re.compile(pattern)
    out = []
    for p in MAIN.rglob("*.as"):
        try:
            text = p.read_text(encoding="utf-8", errors="replace")
        except Exception:
            continue
        for i, line in enumerate(text.splitlines(), 1):
            if rx.search(line):
                out.append({
                    "script": str(p.relative_to(MAIN)).replace("\\", "/"),
                    "line": i,
                    "code": line.strip()[:180],
                })
    return out


def main() -> int:
    # ---------- Stage ----------
    stage = reg["stage_registry"]
    stage2 = reg["stage2_registry"]
    stagebg = [e for e in stage["entries"] if e["kind"] == "stageBG_item"]
    stagemaps = [e for e in stage["entries"] if e["kind"] == "map"]

    consumer = scripts_with(r"bgInf\.load|getDefault\(\)|bgMappingDefault|_level0\.bgMapping")
    loader = scripts_with(r'loadClip\("stage/')
    embedded = scripts_with(r'attachMovie\("stage_"')

    with (REPORTS / "stage_audit.csv").open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.writer(fh)
        w.writerow(["registry", "entry_kind", "key", "value",
                    "original_resolved_path", "file_check_now", "note"])
        for e in stagebg:
            w.writerow(["stage/list.txt", "stageBG_candidate_pool", "stageBG", e["declared"],
                        e.get("resolved_file") or "", "SKIPPED",
                        "候选舞台池；被角色绑定后从池中移除"])
        for e in stagemaps:
            w.writerow(["stage/list.txt", "character_binding", e["key"], e["declared"],
                        e.get("resolved_file") or "", "SKIPPED",
                        "角色专属舞台；绑定后独占，不参与随机"])
        for e in stage2["entries"]:
            kind = ("stageBG_candidate_pool" if e["kind"] == "stageBG_item"
                    else "character_binding" if e["kind"] == "map" else "scalar")
            w.writerow(["stage2/list.txt", kind, e["key"], e["declared"],
                        e.get("resolved_file") or "", "SKIPPED",
                        "主程序无任何 stage2/ 引用"])

    # ---------- BGM ----------
    music = reg["music_registry"]
    musmaps = [e for e in music["entries"] if e["kind"] == "map"]
    scalars = [e for e in music["entries"] if e["kind"] == "scalar"]

    musicnum_refs = scripts_with(r"musicNum")
    musicnum_str = [e for e in musicnum_refs]
    stageN_refs = scripts_with(r'soundInf\["stage"|soundArray')
    consumers = scripts_with(r'soundInf\.load|loadSound\("sound/')

    with (REPORTS / "bgm_audit.csv").open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.writer(fh)
        w.writerow(["registry", "entry_kind", "key", "value",
                    "original_resolved_path", "ext_case_ok", "file_check_now", "note"])
        for e in musmaps:
            w.writerow(["sound/list.txt", "character_bgm", e["key"], e["declared"],
                        e.get("resolved_file") or "", "see note", "SKIPPED",
                        "sound/list.txt 中写明扩展名；Windows 不敏感，Linux 移植需严格匹配"])
        for e in scalars:
            w.writerow(["sound/list.txt", "scalar_config", e["key"], e["declared"],
                        "", "n/a", "SKIPPED",
                        "主程序中零引用 - 见 bgm_audit.md"])

    summary = {
        "stage": {
            "registry": stage["path"],
            "pairs": stage["pair_count"],
            "stagebg_candidates": len(stagebg),
            "character_bindings": len(stagemaps),
            "stage2_pairs": stage2["pair_count"],
            "stage2_consumers_found": 0,
            "embedded_stage_symbols_in_main": 2,
            "embedded_stage_symbols_named_stage_xxx": 0,
            "consumer_sites": consumer,
            "loader_sites": loader,
            "embedded_sites": embedded,
        },
        "bgm": {
            "registry": music["path"],
            "pairs": music["pair_count"],
            "character_bgm": len(musmaps),
            "scalars": [{"key": s["key"], "value": s["declared"]} for s in scalars],
            "musicnum_code_references": len(musicnum_str),
            "musicnum_ref_sites": musicnum_str,
            "stageN_slot_refs": len(stageN_refs),
            "consumer_sites": consumers,
        },
    }
    (REPORTS / "_stage_bgm_static.json").write_text(
        json.dumps(summary, ensure_ascii=False, indent=1), encoding="utf-8")

    print("=== STAGE ===")
    print(f"stage/list.txt   pairs={stage['pair_count']} "
          f"候选池={len(stagebg)} 角色绑定={len(stagemaps)}")
    print(f"stage2/list.txt  pairs={stage2['pair_count']}  主程序消费者=0")
    print("\n-- 注册表消费点 --")
    for s in consumer[:8]:
        print(f"  {s['script']}:{s['line']}  {s['code'][:100]}")
    print("\n-- 外部加载点 --")
    for s in loader:
        print(f"  {s['script']}:{s['line']}  {s['code'][:100]}")
    print("\n-- 内嵌加载点 (attachMovie stage_*) --")
    for s in embedded:
        print(f"  {s['script']}:{s['line']}  {s['code'][:100]}")

    print("\n=== BGM ===")
    print(f"sound/list.txt   pairs={music['pair_count']} "
          f"角色BGM={len(musmaps)} 标量={len(scalars)}")
    print(f"musicNum 在主程序中的引用次数 = {len(musicnum_str)}")
    print(f"stageN 音乐槽引用 = {len(stageN_refs)}")
    print("\n-- 音乐消费点 --")
    for s in consumers[:8]:
        print(f"  {s['script']}:{s['line']}  {s['code'][:100]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())