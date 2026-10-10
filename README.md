# KOF Wing EX1.2 — SWF Architecture Analysis

Static reverse-engineering analysis of the Flash movie embedded in `wingex1.2.exe`,
plus the external resource directories that ship with it.

Built with **JPEXS Free Flash Decompiler 26.3.0** (CLI) and purpose-written Python
parsers. Everything in `reports/` is generated output; `tools/` is the reproducible
pipeline that produces it.

> **Provenance.** This repository contains *decompiled ActionScript recovered from a
> commercial game* as well as the author's analysis of it. The decompiled sources are
> the property of their original copyright holder and are included here for personal
> study, compatibility research and modding purposes only. They are not the author's
> work and no ownership of them is claimed.

---

## Headline findings

| Finding | Confidence |
|---|---|
| Main program is `kofwing/21256864.swf` (125 MB, `ZWS`/LZMA, SWF v15) | **Confirmed** — EXE offset 21,256,864 → EOF; last SWF in the file; only LZMA movie |
| The EXE **is** the launcher; there is no launcher SWF | Confirmed |
| 4 extracted "SWFs" are **not SWFs at all** | Confirmed — overlaps inside the boot movie's LZMA stream |
| The game is 100% ActionScript 1/2 — **zero `DoABC` tags** | Confirmed |
| All gameplay code (427 classes) lives inside the boot movie | Confirmed |
| 83 stage SWFs share a uniform `bgArray` contract | Confirmed — identical in all 83 |
| `char/`, `data/skillList.swf`, `code.swf`, `stage/weather/` are **required but absent** | Confirmed — loader calls exist, files do not |
| `stage2/` is never referenced by the main program | Confirmed — zero hits in full-text search |
| 4 characters keep their AI only in EXE-embedded packs, each with a duplicate engine | Confirmed |

## Quick facts

```
97   .swf files scanned
93   structurally valid SWF
 4   rejected as false positives
89   files carry a stale FileLength header (warning, not corruption)
82   files contain AS1/AS2 script
 0   files contain AS3
427  AS2 classes decompiled from the main movie
252  per-character AI classes (24 characters)
```

## Layout

```
reports/                         generated analysis
├── final_report.md              executive summary -> open this first
├── modding_assessment.md        what can be changed, where, and with which tool
├── dependency_graph.md          load graph with per-edge code evidence
├── dependency_graph.mmd         Mermaid source
├── dependency_edges.csv         machine-readable edges (CONFIRMED/PATTERN/MISSING/INFERRED)
├── file_inventory.md / .csv     all 97 files with validation results
├── code_index.md / .csv         location of every gameplay subsystem
├── registries.json              parsed list.txt tables + resolution status
└── registry_entries.csv

tools/                           the pipeline (Python 3.11, stdlib only)
├── swf_struct.py                SWF header + tag-walk validator, no JPEXS needed
├── jpexs_batch.py               per-file dumpSWF + ActionScript export
├── parse_registries.py          list.txt parser + on-disk resolution check
├── classify.py                  evidence-based role assignment
├── build_graph.py               dependency edges + Mermaid output
├── build_inventory.py           file_inventory.{csv,md}
├── build_code_index.py          code_index.{csv,md}
├── find_boot_swf.py             EXE signature scan + SHA-256 correlation
└── inspect_out.py, stats.py, find_classes.py

analysis/<id>/                   one directory per SWF, named from its relative path
├── metadata.json                structural facts + JPEXS error log
├── dumpSWF.txt                  raw JPEXS tag census
├── assets.json                  images / sounds / sprites / export names
├── strings.txt                  strings, paths, identifiers
├── errors.txt
└── scripts/                     JPEXS-exported ActionScript
```

## Reproducing

```bash
# 1. structural validation (pure Python, no JPEXS)
python tools/swf_struct.py  <game_root> reports/_struct.json

# 2. locate the boot movie inside the EXE
python tools/find_boot_swf.py <exe> reports/_struct.json reports/_exe_scan.json

# 3. per-SWF JPEXS dump + script export  (requires ffdec.jar)
python tools/jpexs_batch.py <game_root> reports/_struct.json analysis

# 4. registries, classification, graphs, reports
python tools/parse_registries.py <game_root> reports
python tools/classify.py analysis reports <game_root>
python tools/build_graph.py   <game_root>
python tools/build_inventory.py
python tools/build_code_index.py
```

`tools/swf_struct.py` encodes the validation rules independently of JPEXS, so a file is
never accepted just because a decompiler opened it.

## Notes for anyone reading the results

- A **stale `FileLength` header is not corruption.** 89 of 97 files declare a length
  larger than their real size. Their tag streams are complete and JPEXS opens them fine.
- The four rejected files account for **359 MB — over 60% of the apparent data volume**.
  Any size-based reasoning over this corpus is badly misled.
- SWF→FLA conversion does **not** recover original timelines, layer names or symbol
  structure. Keep the original SWFs and test every patch on a copy.