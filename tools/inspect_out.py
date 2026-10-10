"""Ad-hoc inspection helper for the KOF Wing EX1.2 analysis outputs."""
import json
import sys
from pathlib import Path

REPORTS = Path(__file__).resolve().parent.parent / "reports"


def load(name):
    return json.loads((REPORTS / name).read_text(encoding="utf-8"))


def role_summary():
    d = load("classification.json")
    order = ["game_module_unclassified", "combat_engine_module", "sfx_bank",
             "stage_background", "settings_store", "flash_runtime_helper",
             "flash_settings_panel", "flash_debug_ui", "not_a_swf"]
    seen = set()
    for want in order:
        for k, v in d.items():
            if v["role"] == want and k not in seen:
                seen.add(k)
                print(f"{k:<24} {v['role']:<24} conf={v['confidence']:<7} "
                      f"scripts={v['script_files']:<6} loaders={v['loader_calls']:<4} "
                      f"size={v['bytes']:>12,}")
                for e in v["evidence"]:
                    print(f"    - {e}")
    print(f"\ntotal classified: {len(d)}")


def api_surface():
    d = load("classification.json")
    for k, v in d.items():
        if not v.get("level0_api"):
            continue
        print(f"### {k}  ({v['role']})  level0 API surface: {len(v['level0_api'])}")
        print("   " + ", ".join(v["level0_api"][:80]))


if __name__ == "__main__":
    cmd = sys.argv[1] if len(sys.argv) > 1 else "roles"
    {"roles": role_summary, "api": api_surface}[cmd]()