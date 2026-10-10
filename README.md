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
| Main program is `kofwing/21256864.swf` (LZMA/SWF v15) | **Confirmed** — EXE offset 21,256,864 → exactly EOF; only LZMA movie |
| The EXE **is** the launcher; there is no launcher SWF | Confirmed |
| 4 extracted "SWFs" are **not SWFs at all** | Confirmed — signature `GFX`, they are byte patterns inside the boot movie's LZMA stream |
| The game is 100% ActionScript 1/2 — **zero `DoABC` tags** | Confirmed |
| All gameplay code (427 classes) lives inside the boot movie | Confirmed |
| 83 stage SWFs share a uniform `bgArray` contract | Confirmed — identical in all 83 |
| **Only 4 of 25 characters load from an external `char/` folder** | Confirmed — hardcoded whitelist at `frame_1629:730` |
| `data/skillList.swf` was recovered from `data/data_old.tar` | Confirmed — contains **794 moves across 22 characters** |
| `musicNum=50` is referenced **zero** times in the code | Confirmed — dead config |
| AS2 script editing + SWF re-save actually work | **Experimentally proven** — see `reports/modding_pipeline_validation.md` |
| Game actually runs with a patched SWF | **UNVERIFIED** — no Flash runtime available here |
| EXE repackaging | **NOT ACHIEVED** — 7 unverified preconditions listed in the report |

## Quick facts

```
97   .swf candidates          (see "counting rule" below)
93   structurally valid SWF
 4   rejected as false positives
89   stale FileLength headers (warning, not corruption)
82   valid SWF containing AS1/AS2
 5   valid SWF containing sound tags
 0   valid SWF containing AS3
427  AS2 classes decompiled from the main movie
252  per-character AI classes (variants included)
 21  independent characters (after folding Type2_/Type3_/C prefixes)
794  moves extracted from data/skillList.swf
```

**Counting rule:** `total` / `invalid` / `duplicate` / `total bytes` cover all
candidates; the `with_*` rows count only structurally valid SWF. Recorded
explicitly in `_struct.json` under `counting_rule`.

**Character counting rule:** variant markers are stripped from the base name by
`tools/build_code_index.py::split_character_name()` — `Type2_`, `Type3_`, and a
leading `C` followed by an uppercase letter (`CZero`→`Zero`, `CKrizalid`→`Krizalid`).
Applied uniformly; no name is ever dropped to make a number agree with prose.

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

## Reports — start with `final_report.md`

| Report | What it answers |
|---|---|
| `final_report.md` | **Executive summary.** Directory completeness, config defects, what is proven vs unverified, remaining-issues list by priority |
| `manual_smoke_test.md` | **What YOU must run locally.** Baseline test, patched-SWF test, EXE-repack prerequisites, rollback |
| `runtime_dependency_audit.md` | The 4 missing runtime deps with `file:line` evidence; the 4-character whitelist discovery; **contains a correction notice** |
| `modding_assessment.md` | Which subsystem to edit for which goal; JPEXS vs Flash CS6 boundary; **contains a correction notice** (dead code) |
| `modding_pipeline_validation.md` | **Can we actually edit and repack?** Three propositions proven separately: script edit / SWF re-save / game runs |
| `modding_code_map.md` | Navigation map by theme, with blast radius and minimal verification per entry |
| `stage_audit.md` / `bgm_audit.md` | Stage and BGM configuration semantics and defects |
| `analysis_quality_audit.md` | Audit of this toolchain; §0 holds the closing re-verification table |
| `dependency_graph.md` | Load graph with per-edge code evidence |
| `move_list.md` / `.json` | **All 794 moves** extracted from `data/skillList.swf` |
| `file_inventory.md` / `.csv` | All 97 candidates with validation results |
| `code_index.md` / `.csv` | Location of every gameplay subsystem |
| `registries.json` / `registry_entries.csv` | Parsed `list.txt` tables |

### Provenance records — three scans, none overwrites another

| File | Describes | Boot movie bytes |
|---|---|---:|
| `reports/_struct.json` | the **original** extraction (historical record) | 125,450,217 |
| `reports/_struct_current.json` | what is on disk **right now** | 125,442,502 |
| `reports/_struct_current_provenance.json` | full provenance of the re-baseline | — |

The 7,715-byte gap is explained: the EXE re-cut ran to EOF instead of trusting the
stale `FileLength`. The tag stream is complete either way. Do not merge these records.

## Known JPEXS CLI gotchas (measured, not documented)

1. `-compress` takes the **method first** — `-compress <method> <infile> <outfile>` —
   contradicting its own `-help`.
2. `-compress` **exits 0 on failure**. Never trust the exit code; verify the artifact.
3. `-dumpSWF` line count ≠ tag count: it recurses into nested sprites and reuses indices
   (553,260 lines for this movie, but only 71,378 real tags).
4. `-replace <scriptName>` naming was not resolved; use the verified `-importScript` path.
5. JPEXS mangles non-ASCII paths **in console output only** — file I/O is unaffected.

## Reproducing

Run from the repo root; `analysis/` is built from the `kofwing/` folder.

```bash
# 1. structural validation (pure Python, no JPEXS needed)
python tools/swf_struct.py  <game_root> reports/_struct.json

# 2. locate the boot movie inside the EXE
python tools/find_boot_swf.py <exe> reports/_struct.json reports/_exe_scan.json

# 3. per-SWF JPEXS dump + script export  (requires ffdec.jar)
python tools/jpexs_batch.py <game_root> reports/_struct.json analysis

# 4. registries, classification, graphs, indexes
python tools/parse_registries.py <game_root> reports
python tools/classify.py analysis reports <game_root>
python tools/build_graph.py   <game_root>
python tools/build_inventory.py
python tools/build_code_index.py

# 5. phase 1-2 evidence and the recovered move table
python tools/phase1_dep_audit.py
python tools/phase2_stage_bgm_audit.py
python tools/engine_diff_verify.py
python tools/extract_move_list.py     # needs the extracted skillList scripts

# 6. re-baseline the CURRENT input without touching the historical record
python tools/rebaseline_struct.py

# 7. re-verify every finding in analysis_quality_audit.md
python tools/verify_audit_findings.py

# 8. tests
python -m unittest discover -s tests -t .
```

`tools/swf_struct.py` encodes the validation rules independently of JPEXS, so a file is
never accepted just because a decompiler opened it.

> **Never re-run step 1 on the full game tree.** It would overwrite the manifest record
> of the *original* extraction with whatever is on disk. Use
> `tools/rebaseline_struct.py`, which writes to a separate path and records provenance.

## Safety guards

`tools/recover_from_exe.py` is the only tool that writes **outside** this repository,
into the game directory. It is guarded and the guards are tested:

- refuses to run without `--force`
- aborts when the target directory already holds files
- never rewrites a file that already matches the manifest
- flags truncated candidates instead of silently accepting them

Guard tests live in `tests/test_safety_guards.py` (uses synthetic fixtures, never real
game files).

## experiments/

`experiments/tools/` (helper scripts) and `experiments/help/` (captured JPEXS `-help`
text) are tracked so the JPEXS experiments stay reproducible.
`experiments/work/` and `experiments/logs/` hold rebuilt SWFs and tag dumps —
**~978 MB across ~27k files, gitignored.** Regenerate them by re-running the
experiments rather than committing them.

## Notes for anyone reading the results

- A **stale `FileLength` header is not corruption.** 89 of 97 files declare a length
  larger than their real size. Their tag streams are complete and JPEXS opens them fine.
- The four rejected files account for **359 MB — over 60% of the apparent data volume**.
  Any size-based reasoning over this corpus is badly misled.
- SWF→FLA conversion does **not** recover original timelines, layer names or symbol
  structure. Keep the original SWFs and test every patch on a copy.