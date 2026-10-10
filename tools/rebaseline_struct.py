"""
Create a re-baselined structural scan WITHOUT touching the historical
_struct.json, and record full provenance for it.

The historical _struct.json records the ORIGINAL extraction (boot movie =
125,450,217 B). Disk now holds the copy re-cut from the EXE (125,442,502 B).
Both records are kept; this adds a third, clearly-labelled one describing
exactly what is on disk right now.

Per the project's rules the scan is only written to reports/_struct_current.json.
"""
from __future__ import annotations

import hashlib
import json
import platform
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
GAME = REPO.parent
TOOL = REPO / "tools" / "swf_struct.py"
HIST = REPO / "reports" / "_struct.json"
OUT = REPO / "reports" / "_struct_current.json"
PROV = REPO / "reports" / "_struct_current_provenance.json"

sys.path.insert(0, str(REPO / "tools"))
import swf_struct  # noqa: E402


def sha_and_size(p: Path) -> tuple[str, int]:
    h = hashlib.sha256()
    n = 0
    with p.open("rb") as fh:
        while True:
            b = fh.read(1 << 20)
            if not b:
                break
            h.update(b)
            n += len(b)
    return h.hexdigest(), n


def main() -> int:
    target = GAME / "kofwing"
    started = datetime.now(timezone.utc).astimezone()
    t0 = time.time()

    files = sorted((p for p in target.rglob("*")
                    if p.is_file() and p.suffix.lower() == ".swf"),
                   key=lambda p: str(p).lower())
    records = [swf_struct.analyze(p, str(p.relative_to(GAME)).replace("\\", "/"))
               for p in files]

    by_sha: dict[str, list[str]] = {}
    for r in records:
        by_sha.setdefault(r["sha256"], []).append(r["relative_path"])

    good = [r for r in records if r["valid_swf"]]
    summary = {
        "total_files": len(records),
        "valid_swf": len(good),
        "invalid_swf": len(records) - len(good),
        "declared_length_mismatch": sum(1 for r in records if not r["length_match"]),
        "with_as2": sum(1 for r in good if r["has_do_action"] or r["has_do_init_action"]),
        "with_as3": sum(1 for r in good if r["has_do_abc"]),
        "with_sprite": sum(1 for r in good if r["n_sprite"] > 0),
        "with_sound": sum(1 for r in good if r["n_sound_tags"] > 0),
        "distinct_sha256": len(by_sha),
        "duplicate_groups": sum(1 for v in by_sha.values() if len(v) > 1),
        "total_bytes": sum(r["bytes"] for r in records),
        "swf_versions": sorted({r["swf_version"] for r in good if r["swf_version"]}),
        "counting_rule": ("total_files/invalid_swf/duplicate/total_bytes cover ALL "
                          "candidates; with_* are computed over structurally VALID SWF only"),
    }

    OUT.write_text(json.dumps({"summary": summary, "files": records},
                              ensure_ascii=False, indent=1), encoding="utf-8")

    # ---- provenance --------------------------------------------------
    hist = json.loads(HIST.read_text(encoding="utf-8"))
    hmap = {r["relative_path"]: r for r in hist["files"]}
    inputs = []
    for p in files:
        rel = str(p.relative_to(GAME)).replace("\\", "/")
        sha, size = sha_and_size(p)
        h = hmap.get(rel)
        inputs.append({
            "path": rel,
            "sha256": sha,
            "bytes": size,
            "historical_sha256": h["sha256"] if h else None,
            "historical_bytes": h["actual_length"] if h else None,
            "matches_historical": bool(h and h["sha256"] == sha),
        })
    changed = [i for i in inputs if not i["matches_historical"]]

    prov = {
        "generated_at": started.isoformat(),
        "duration_seconds": round(time.time() - t0, 2),
        "tool": "tools/swf_struct.py",
        "tool_sha256": sha_and_size(TOOL)[0],
        "python": platform.python_version(),
        "platform": platform.platform(),
        "input_root": str(target),
        "input_file_count": len(files),
        "scan_succeeded": True,
        "historical_record": {
            "path": str(HIST.relative_to(REPO)).replace("\\", "/"),
            "note": "records the ORIGINAL extraction; intentionally NOT overwritten",
        },
        "differences_vs_historical": {
            "changed_files": changed,
            "changed_count": len(changed),
            "explanation": ("The boot movie and the 4 rejected candidates were re-cut "
                            "from wingex1.2.exe after the original extraction. The boot "
                            "movie is 7,715 bytes shorter because the re-cut ran to EOF "
                            "instead of the stale declared FileLength. Its tag stream "
                            "remains complete."),
        },
        "summary": summary,
    }
    PROV.write_text(json.dumps(prov, ensure_ascii=False, indent=1), encoding="utf-8")

    print(f"wrote {OUT.name}: {summary['total_files']} files, "
          f"{summary['valid_swf']} valid, {summary['invalid_swf']} rejected, "
          f"with_sound={summary['with_sound']}")
    print(f"wrote {PROV.name}")
    print(f"inputs differing from the historical record: {len(changed)}")
    for c in changed:
        print(f"  {c['path']}: hist {c['historical_bytes']:,}B -> now {c['bytes']:,}B")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())