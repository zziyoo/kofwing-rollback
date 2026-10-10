#!/usr/bin/env python3
"""
Phase 2: per-SWF analysis tree using the real JPEXS CLI.

For every structurally-valid SWF this creates:

    analysis/<id>/metadata.json
    analysis/<id>/dumpSWF.txt        raw JPEXS -dumpSWF output (authoritative tag census)
    analysis/<id>/scripts/           JPEXS -export script (ActionScript source)
    analysis/<id>/strings.txt        strings, paths, identifiers mined from SWF + scripts
    analysis/<id>/assets.json        images / sounds / sprites / fonts / labels / export names
    analysis/<id>/errors.txt         JPEXS + parser errors for this file

Read-only with respect to the game data. Every original file keeps its path;
analysis dirs are named from the relative path so same-named files never collide.
"""
from __future__ import annotations

import json
import re
import subprocess
import sys
import time
import zlib
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path

FFDEC_JAR = r"D:\swf解包\ffdec.jar"
JAVA_MEM = "-Xmx3g"
TIMEOUT_SCRIPT = 900
TIMEOUT_DUMP = 600

# JPEXS dumpSWF line shapes (verified against actual output, not guessed):
#   00000015:    0. FileAttributes            tagId= 69 len=       4  00 00 00 00
#   00004c08:      1. SoundStreamHead2 (cid: -1) tagId= 45 len=       4  0e 00 00 00
#   00001973:    6. ExportAssets (chid: 2, exp: "Kim_hurt2") tagId= 56 len=      14  ...
LINE_RE = re.compile(
    r"^(?P<off>[0-9a-f]{8}):\s*(?P<depth>\s*)(?P<idx>\d+)\.\s+"
    r"(?P<name>.+?)\s*\(?.*?\)?\s+tagId=\s*(?P<tid>\d+)\s+len=\s*(?P<len>\d+)"
)
EXPORT_RE = re.compile(r'exp:\s*"((?:[^"\\]|\\.)*)"')
CHID_RE = re.compile(r"chid:\s*(-?\d+)")
CID_RE = re.compile(r"cid:\s*(-?\d+)")


def make_id(rel: str) -> str:
    """Stable, collision-free analysis id derived from the relative path.

    The WHOLE relative path is folded in, not just the last two segments:
    two files with the same name three levels down would otherwise collide
    (e.g. a/x/007.swf and b/x/007.swf both became "x__007").
    """
    flat = rel.rsplit("/", 1)[-1]
    parents = Path(rel).parent.parts
    stem = Path(flat).stem
    if parents:
        stem = "__".join(list(parents) + [stem])
    bad = '<>:"/\\|?*'
    out = "".join("-" if ch in bad else ch for ch in stem).strip()
    return out or "unnamed"


def run_java(args: list[str], timeout: int) -> tuple[int, bytes, bytes]:
    cmd = ["java", JAVA_MEM, "-jar", FFDEC_JAR] + args
    try:
        proc = subprocess.run(
            cmd, capture_output=True, timeout=timeout,
            creationflags=0x08000000 if sys.platform == "win32" else 0,
        )
        return proc.returncode, proc.stdout, proc.stderr
    except subprocess.TimeoutExpired:
        return -9, b"", f"TIMEOUT after {timeout}s".encode()
    except Exception as exc:  # noqa: BLE001
        return -1, b"", str(exc).encode()


def decode(b: bytes) -> str:
    for enc in ("utf-8", "gbk", "latin-1"):
        try:
            return b.decode(enc)
        except UnicodeDecodeError:
            continue
    return b.decode("utf-8", errors="replace")


def parse_dump(text: str) -> dict:
    """Turn JPEXS -dumpSWF text into a structured asset census."""
    tags: dict[str, int] = {}
    tagids: dict[str, int] = {}
    exports: list[dict] = []
    sounds: list[dict] = []
    sprites: list[dict] = []
    images: list[dict] = []
    fonts: list[dict] = []
    labels: list[str] = []
    abc: list[dict] = []
    unknown_ids: dict[int, int] = {}
    total = 0

    for line in text.splitlines():
        m = LINE_RE.match(line)
        if not m:
            continue
        total += 1
        name = m.group("name").strip()
        tid = int(m.group("tid"))
        tags[name] = tags.get(name, 0) + 1
        tagids[name] = tid
        if name.startswith("Unknown"):
            unknown_ids[tid] = unknown_ids.get(tid, 0) + 1
        em = EXPORT_RE.search(line)
        chid = CHID_RE.search(line)
        cid = CID_RE.search(line)
        ident = int(chid.group(1)) if chid else (int(cid.group(1)) if cid else None)
        if em:
            exports.append({"char_id": ident, "export_name": em.group(1)})
        if name.startswith("DefineSound"):
            sounds.append({"char_id": ident})
        elif name.startswith("DefineSprite"):
            sprites.append({"char_id": ident})
        elif name.startswith("DefineBits"):
            images.append({"char_id": ident, "tag": name})
        elif name.startswith("DefineFont"):
            fonts.append({"char_id": ident, "tag": name})
        elif name == "FrameLabel":
            labels.append(line.strip())
        elif name in ("DoABC", "DoABCDefine"):
            abc.append({"char_id": ident})

    return {
        "tag_total_parsed": total,
        "tag_counts": dict(sorted(tags.items(), key=lambda kv: -kv[1])),
        "tag_ids": tagids,
        "unknown_tag_ids": dict(sorted(unknown_ids.items(), key=lambda kv: -kv[1])),
        "export_assets": exports,
        "sounds": sounds,
        "sprites": sprites,
        "images": images,
        "fonts": fonts,
        "frame_label_lines": labels,
        "abc": abc,
    }


# --- string mining -------------------------------------------------------
STR_RE = re.compile(rb"[\x20-\x7e]{5,}")
CJK_RE = re.compile(rb"(?:[\xb0-\xf7][\xa1-\xfe]{1}|[\x00-\xff])")
PATH_HINT = re.compile(
    r"\.(swf|xml|ini|txt|mp3|wav|dat|cfg|jpg|png|bat|exe)\b", re.I
)


def mine_strings_from_bytes(blob: bytes, minlen: int = 5) -> list[str]:
    out = []
    for m in STR_RE.finditer(blob):
        s = m.group().decode("latin-1")
        if len(s) >= minlen:
            out.append(s)
    return out


def main() -> int:
    if len(sys.argv) < 4:
        print("usage: jpexs_batch.py <game_root> <struct_json> <analysis_out>")
        return 2
    game_root = Path(sys.argv[1])
    struct_json = Path(sys.argv[2])
    analysis_out = Path(sys.argv[3])

    data = json.loads(struct_json.read_text(encoding="utf-8"))
    records = data["files"]
    valid = [r for r in records if r["valid_swf"]]
    invalid = [r for r in records if not r["valid_swf"]]

    print(f"structurally valid: {len(valid)}   invalid: {len(invalid)}")

    # Timestamp used to count only files produced by this run.
    run_started = time.time()

    jobs = []
    for r in valid:
        jobs.append((r, game_root / r["relative_path"]))
    for r in invalid:
        jobs.append((r, game_root / r["relative_path"]))

    def process(rec: dict, src: Path) -> dict:
        aid = make_id(rec["relative_path"])
        outdir = analysis_out / aid
        (outdir / "scripts").mkdir(parents=True, exist_ok=True)
        errors: list[str] = list(rec.get("errors", []))

        # 1. dumpSWF -> authoritative tag census straight from the decompiler
        rc, out, err = run_java(["-dumpSWF", str(src)], TIMEOUT_DUMP)
        dump_text = decode(out)
        (outdir / "dumpSWF.txt").write_text(dump_text, encoding="utf-8", errors="replace")
        if rc == -9:
            errors.append("dumpSWF TIMEOUT")
        stderr_text = decode(err).strip()
        if stderr_text:
            for line in stderr_text.splitlines()[:20]:
                errors.append(f"dumpSWF stderr: {line.strip()}")

        census = parse_dump(dump_text)
        if rec["valid_swf"] and not census["tag_total_parsed"]:
            errors.append("JPEXS produced no parsable tag lines despite a valid signature")

        # 2. export ActionScript source
        # Count only what THIS run produced. Scanning the whole output directory
        # would fold leftovers from a previous run into the count and make the
        # result depend on history rather than on the current input.
        n_scripts = 0
        for p in sorted((outdir / "scripts").rglob("*")):
            if not p.is_file():
                continue
            try:
                if p.stat().st_mtime >= run_started - 1:
                    n_scripts += 1
            except OSError:
                continue

        # 3. strings: from raw decompressed body + exported scripts
        strings: set[str] = set()
        try:
            raw = src.read_bytes()
            sig = raw[:3]
            body = raw[8:]
            if sig == b"CWS":
                try:
                    body = zlib.decompress(body)
                except Exception:  # noqa: BLE001
                    pass
            strings.update(mine_strings_from_bytes(body))
        except Exception as exc:  # noqa: BLE001
            errors.append(f"raw string mining failed: {exc}")
        for p in (outdir / "scripts").rglob("*"):
            if p.is_file():
                try:
                    strings.update(
                        mine_strings_from_bytes(p.read_bytes(), minlen=4)
                    )
                except Exception:  # noqa: BLE001
                    pass

        srt = sorted(strings)
        (outdir / "strings.txt").write_text("\n".join(srt), encoding="utf-8",
                                           errors="replace")

        # 4. assets.json
        assets = {
            "relative_path": rec["relative_path"],
            "analysis_id": aid,
            "tag_counts": census["tag_counts"],
            "unknown_tag_ids": census["unknown_tag_ids"],
            "n_export_assets": len(census["export_assets"]),
            "export_names": [e["export_name"] for e in census["export_assets"]],
            "export_assets": census["export_assets"],
            "sounds": census["sounds"],
            "sprites": census["sprites"],
            "images": census["images"],
            "fonts": census["fonts"],
            "frame_label_lines": census["frame_label_lines"],
            "script_files_exported": n_scripts,
            "string_count": len(srt),
            "path_like_strings": sorted(
                {s for s in srt if PATH_HINT.search(s) and len(s) < 300}
            )[:2000],
        }
        (outdir / "assets.json").write_text(
            json.dumps(assets, ensure_ascii=False, indent=1), encoding="utf-8"
        )

        # 5. metadata.json
        meta = dict(rec)
        meta["analysis_id"] = aid
        meta["jpexs_dump_parsed_lines"] = census["tag_total_parsed"]
        meta["jpexs_tag_counts"] = census["tag_counts"]
        meta["script_files_exported"] = n_scripts
        meta["string_count"] = len(srt)
        meta["jpexs_errors"] = errors
        (outdir / "metadata.json").write_text(
            json.dumps(meta, ensure_ascii=False, indent=1), encoding="utf-8"
        )
        (outdir / "errors.txt").write_text(
            "\n".join(errors) if errors else "(no errors recorded)\n",
            encoding="utf-8",
        )
        return {
            "id": aid,
            "rel": rec["relative_path"],
            "scripts": n_scripts,
            "tags": census["tag_total_parsed"],
            "valid": rec["valid_swf"],
            "errors": len(errors),
            "bytes": rec["bytes"],
        }

    results = []
    workers = 4
    with ThreadPoolExecutor(max_workers=workers) as pool:
        futs = {pool.submit(process, r, p): r for r, p in jobs}
        done = 0
        for fut in as_completed(futs):
            rec = futs[fut]
            try:
                res = fut.result()
            except Exception as exc:  # noqa: BLE001
                res = {"id": make_id(rec["relative_path"]),
                       "rel": rec["relative_path"], "scripts": 0, "tags": 0,
                       "valid": rec["valid_swf"], "errors": 1, "bytes": rec["bytes"]}
                print(f"[ERR] {rec['relative_path']}: {exc}")
            results.append(res)
            done += 1
            print(
                f"[{done}/{len(jobs)}] {res['id']:<34} tags={res['tags']:<6} "
                f"scripts={res['scripts']:<4} errors={res['errors']}"
            )

    index = {
        "total": len(results),
        "with_scripts": sum(1 for r in results if r["scripts"] > 0),
        "results": sorted(results, key=lambda r: r["id"]),
    }
    idx_dir = analysis_out.parent / "reports"
    idx_dir.mkdir(parents=True, exist_ok=True)
    (idx_dir / "_phase2_index.json").write_text(
        json.dumps(index, ensure_ascii=False, indent=1), encoding="utf-8"
    )
    print("\n" + json.dumps({k: v for k, v in index.items() if k != "results"},
                           ensure_ascii=False))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())