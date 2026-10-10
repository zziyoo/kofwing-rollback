#!/usr/bin/env python3
"""Build reports/file_inventory.csv and reports/file_inventory.md from all phases."""
from __future__ import annotations

import csv
import json
import sys
from pathlib import Path

REPORTS = Path(__file__).resolve().parent.parent / "reports"

FIELDS = [
    "relative_path", "filename", "analysis_id", "directory", "extension",
    "bytes", "sha256", "duplicate_sha256", "is_swf_signature", "valid_swf",
    "swf_version", "compression", "declared_length", "actual_length",
    "length_match", "length_delta", "frame_rate", "declared_frame_count",
    "showframe_count", "canvas_px", "tag_total", "tag_walk_ok",
    "n_do_action", "n_do_init_action", "has_as1_as2_script", "n_do_abc", "has_as3",
    "n_sprite", "n_image_tags", "n_sound_tags", "n_font_tags", "n_text_tags",
    "n_shape_tags", "n_frame_label", "n_symbol_class", "n_export_assets",
    "n_define_binary", "n_video_stream", "jpexs_parsed_lines",
    "script_files_exported", "string_count", "sfe_export_count",
    "role", "role_confidence", "role_evidence", "errors", "warnings",
]


def main() -> int:
    struct = json.loads((REPORTS / "_struct.json").read_text(encoding="utf-8"))
    cls_path = REPORTS / "classification.json"
    cls = json.loads(cls_path.read_text(encoding="utf-8")) if cls_path.exists() else {}

    dup_count: dict[str, int] = {}
    for r in struct["files"]:
        dup_count[r["sha256"]] = dup_count.get(r["sha256"], 0) + 1

    rows = []
    for r in struct["files"]:
        aid = r.get("analysis_id") or _guess_id(r["relative_path"])
        meta_path = REPORTS.parent / "analysis" / aid / "metadata.json"
        assets_path = REPORTS.parent / "analysis" / aid / "assets.json"
        meta = json.loads(meta_path.read_text(encoding="utf-8")) if meta_path.exists() else {}
        assets = json.loads(assets_path.read_text(encoding="utf-8")) if assets_path.exists() else {}
        c = cls.get(aid, {})
        rows.append({
            "relative_path": r["relative_path"],
            "filename": r["filename"],
            "analysis_id": aid,
            "directory": str(Path(r["relative_path"]).parent).replace("\\", "/"),
            "extension": r["extension"],
            "bytes": r["bytes"],
            "sha256": r["sha256"],
            "duplicate_sha256": dup_count.get(r["sha256"], 1) > 1,
            "is_swf_signature": r["is_swf_signature"],
            "valid_swf": r["valid_swf"],
            "swf_version": r["swf_version"],
            "compression": r["compression"],
            "declared_length": r["declared_length"],
            "actual_length": r["actual_length"],
            "length_match": r["length_match"],
            "length_delta": r.get("length_delta"),
            "frame_rate": r["frame_rate"],
            "declared_frame_count": r["declared_frame_count"],
            "showframe_count": r["showframe_count"],
            "canvas_px": "x".join(str(v) for v in (r.get("canvas_px_1440dpi") or [])),
            "tag_total": r["tag_total"],
            "tag_walk_ok": r["tag_walk_ok"],
            "n_do_action": r["n_do_action"],
            "n_do_init_action": r["n_do_init_action"],
            "has_as1_as2_script": r["has_do_action"] or r["has_do_init_action"],
            "n_do_abc": r["n_do_abc"],
            "has_as3": r["has_do_abc"],
            "n_sprite": r["n_sprite"],
            "n_image_tags": r["n_image_tags"],
            "n_sound_tags": r["n_sound_tags"],
            "n_font_tags": r["n_font_tags"],
            "n_text_tags": r["n_text_tags"],
            "n_shape_tags": r["n_shape_tags"],
            "n_frame_label": r["n_frame_label"],
            "n_symbol_class": r["n_symbol_class"],
            "n_export_assets": r["n_export_assets"],
            "n_define_binary": r["n_define_binary"],
            "n_video_stream": r["n_video_stream"],
            "jpexs_parsed_lines": meta.get("jpexs_dump_parsed_lines", 0),
            "script_files_exported": meta.get("script_files_exported", 0),
            "string_count": meta.get("string_count", 0),
            "sfe_export_count": assets.get("n_export_assets", 0),
            "role": c.get("role", ""),
            "role_confidence": c.get("confidence", ""),
            "role_evidence": " | ".join(c.get("evidence", [])),
            "errors": " | ".join(r.get("errors", [])),
            "warnings": " | ".join(r.get("warnings", [])),
        })

    out_csv = REPORTS / "file_inventory.csv"
    with out_csv.open("w", newline="", encoding="utf-8-sig") as fh:
        w = csv.DictWriter(fh, fieldnames=FIELDS)
        w.writeheader()
        w.writerows(rows)

    s = struct["summary"]
    md = []
    md.append("# File Inventory - King of Fighters Wing EX1.2\n")
    md.append(f"Generated from `{s['root']}` - all `.swf` files found recursively "
               "(including sub-directories).\n")
    md.append("## Summary\n")
    md.append("| Metric | Value |")
    md.append("| --- | --- |")
    md.append(f"| Total `.swf` files discovered | {s['total_files']} |")
    md.append(f"| Structurally valid SWF | {s['valid_swf']} |")
    md.append(f"| **Rejected as not-a-SWF (false positives)** | **{s['invalid_swf']}** |")
    md.append(f"| Files with a stale `FileLength` header | {s['declared_length_mismatch']} |")
    md.append(f"| Files containing AS1/AS2 script | {s['with_as2']} |")
    md.append(f"| Files containing AS3 script (`DoABC`) | {s['with_as3']} |")
    md.append(f"| Files containing `DefineSprite` | {s['with_sprite']} |")
    md.append(f"| Files containing sound tags | {s['with_sound']} |")
    md.append(f"| Distinct SHA-256 values | {s['distinct_sha256']} |")
    md.append(f"| Duplicate groups | {s['duplicate_groups']} |")
    md.append(f"| Total bytes | {s['total_bytes']:,} |")
    md.append(f"| SWF versions present | {s['swf_versions']} |")
    md.append("")
    md.append("### What was verified before a file was accepted as an SWF\n")
    md.append("A file is only counted as a valid SWF when **all** of the following hold:\n")
    md.append("1. Bytes 0-2 are a real signature: `FWS` (uncompressed), `CWS` (zlib) or `ZWS` (LZMA).")
    md.append("2. The body actually decompresses.")
    md.append("3. The RECT + framerate + frame-count header parses.")
    md.append("4. The tag stream walks cleanly all the way to an `End` tag without any tag "
               "declaring more bytes than remain.\n")
    md.append("A stale `FileLength` value is reported as a **warning**, not a failure: these files "
               "were repackaged by a third-party SWF tool that left the header length untouched, "
               "while the tag stream itself is complete. JPEXS opens them normally.\n")

    md.append("\n## Rejected files (with the reason)\n")
    md.append("| File | Version | Bytes | Reason |")
    md.append("| --- | --- | --- | --- |")
    for r in struct["files"]:
        if not r["valid_swf"]:
            md.append(f"| `{r['relative_path']}` | {r['swf_version']} | {r['bytes']:,} | "
                      f"{r['errors'][0] if r['errors'] else 'tag stream invalid'} |")
    md.append("")

    md.append("\n## All files\n")
    md.append("| Path | Size | Ver | Compress | FPS | Canvas | Tags | DoAction | DoInit | DoABC | "
              "Sprite | Img | Snd | Scripts | Role | Conf |")
    md.append("| --- | ---: | ---: | --- | ---: | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- | --- |")
    for r in rows:
        md.append(
            f"| `{r['relative_path']}` | {r['bytes']:,} | {r['swf_version']} | "
            f"{(r['compression'] or '-')} | {r['frame_rate']} | {r['canvas_px']} | "
            f"{r['tag_total']} | {r['n_do_action']} | {r['n_do_init_action']} | {r['n_do_abc']} | "
            f"{r['n_sprite']} | {r['n_image_tags']} | {r['n_sound_tags']} | "
            f"{r['script_files_exported']} | {r['role']} | {r['role_confidence']} |"
        )
    md.append("")

    dupes: dict[str, list[str]] = {}
    for r in struct["files"]:
        dupes.setdefault(r["sha256"], []).append(r["relative_path"])
    multi = {k: v for k, v in dupes.items() if len(v) > 1}
    if multi:
        md.append("\n## Byte-identical duplicate groups\n")
        md.append("These paths hold identical content. Both are kept - nothing is overwritten - "
                   "but only one copy needs editing if you patch a resource.\n")
        md.append("| SHA-256 (short) | Paths |")
        md.append("| --- | --- |")
        for k, v in multi.items():
            md.append(f"| `{k[:16]}...` | " + "<br>".join(f"`{p}`" for p in v) + " |")
    md.append("")

    (REPORTS / "file_inventory.md").write_text("\n".join(md), encoding="utf-8")
    print(f"wrote {out_csv.name} ({len(rows)} rows) and file_inventory.md")
    return 0


def _guess_id(rel: str) -> str:
    stem = rel.rsplit("/", 1)[-1]
    if "/" in rel:
        stem = rel.rsplit("/", 2)[-2] + "__" + stem
    return Path(stem).stem


if __name__ == "__main__":
    raise SystemExit(main())