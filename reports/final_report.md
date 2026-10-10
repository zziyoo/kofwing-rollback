# Final Report - King of Fighters Wing EX1.2 (前瞻版) SWF Architecture Analysis

**Scope:** static analysis of all `.swf` files extracted from `wingex1.2.exe`, plus the external
resource directories that ship alongside it.
**Method:** read-only. JPEXS Free Flash Decompiler 26.3.0 nightly (build 3573) at
`D:\swf解包\ffdec.jar`, driven via CLI, plus purpose-written Python parsers for SWF header
validation and edge extraction.
**Nothing in the game tree was modified, recompiled, or published.**

---

## 1. Executive summary

The main program is **`kofwing/21256864.swf`** - a 125 MB LZMA-compressed AS2 movie found at
EXE offset 21,256,864, running to end-of-file. This is proven three independent ways (EXE layout,
format, content), not inferred from size.

The game is **100% ActionScript 1/2**. Zero `DoABC` tags exist anywhere in the 97 files. That
makes the whole codebase directly editable and recompilable with JPEXS alone - no AVM2 bytecode
and no Flash IDE required for script-level changes.

All gameplay logic - 427 AS2 classes including every character's AI, the shared role state
machine, hit detection and combo tracking - lives inside that single boot movie. The 83 files
under `stage/` and `stage2/` are **not** gameplay code; they are stage-background modules that
publish a uniform `bgArray` contract.

**The most important practical finding: the extracted tree is not a complete game.** The boot
movie loads four paths that do not exist here:

| Required path | Loaded by |
| --- | --- |
| `char/<role>.swf` | `frame_1629/DoAction.as:792,812,915,919` |
| `data/skillList.swf` | `DefineSprite_60324/frame_1/DoAction.as:15` |
| `code.swf` | `frame_1629/DoAction.as:3541` |
| `stage/weather/<tq>.swf` | `DefineSprite_3266/frame_1/DoAction.as:1` |

Without `char/` and `skillList.swf` there are no characters and no move tables, so a full match
cannot run from this directory alone.

---

## 2. File inventory and validity

Full data: [`file_inventory.csv`](file_inventory.csv) · [`file_inventory.md`](file_inventory.md)

| Metric | Value |
| --- | ---: |
| `.swf` files discovered (recursive) | **97** |
| Structurally valid SWF | **93** |
| **Rejected as false positives** | **4** |
| Files with a stale `FileLength` header | 89 |
| Files containing AS1/AS2 script | 82 |
| Files containing AS3 (`DoABC`) | **0** |
| Files containing `DefineSprite` | 91 |
| Files containing sound tags | 6 |
| Distinct SHA-256 values | 91 |
| Byte-identical duplicate groups | 6 |
| Total bytes | 594,904,068 |
| SWF versions present | 4, 6, 7, 8, 15, 24, 47 |
| ActionScript files exported | **31,215** |
| ActionScript bytes exported | 19,025,558 |
| Strings mined | 2,592,071 |

### The four rejected files are provably not SWFs

`27969957.swf`, `40440656.swf`, `74424254.swf`, `84187910.swf` begin with a genuine `FWS`/`CWS`
signature but their tag streams decode to garbage - unknown tag IDs 175-980 with random payloads,
and no `End` tag. JPEXS reports `Unknown (tid: NNN)` for essentially every line.

The cause is now proven: **these four are overlaps inside the boot movie's compressed body.**
Each one starts at an offset *greater than* 21,256,864 (i.e. inside `21256864.swf`) and runs
to end-of-file - the extractor found `FWS` byte patterns inside the LZMA stream and emitted them
as separate files. They are extraction artefacts, not game resources. They must not be fed to
editors or counted in any resource total.

### Validation actually performed

A file was accepted as an SWF only if: the 3-byte signature is `FWS`/`CWS`/`ZWS`; the body
decompresses; the RECT + framerate + frame-count header parses; and the tag stream walks cleanly
to an `End` tag with no tag declaring more bytes than remain.

A **stale `FileLength` header is reported as a warning, not a failure.** 89 of 97 files declare a
length larger than their real size (e.g. `stage2/Ryo.swf` declares 119,067 but is 115,188 bytes).
These files parse correctly and JPEXS opens them normally - the field is simply left over from
third-party repackaging. Treating this as corruption would have wrongly rejected 92% of the set.

---

## 3. Main program, launcher and core-logic candidates

### Ranked candidates

| Rank | File | Role | Confidence | Basis |
| --- | --- | --- | --- | --- |
| **1** | `kofwing/21256864.swf` | **Main program** | **Confirmed** | Last SWF in EXE, offset→EOF; `ZWS`/v15; 553,260 tags; 427 classes; contains every loader call and the roster. |
| 2 | `kofwing/11480055.swf` | Combat engine + Kim character pack | Confirmed | Carries the only copy of `Kim_AI*`, `Kim_role`, plus full `Role.as`/`HitCheck`. |
| 3 | `kofwing/8492959.swf` | Combat engine + Andy pack | Confirmed | Same structure, `Andy_AI*`. |
| 4 | `kofwing/16695748.swf` | Combat engine + Moriya pack | Confirmed | Same structure, `Moriya_AI*`. |
| 5 | `kofwing/18464326.swf` | Combat engine + Nameless pack | Confirmed | Same structure, `Nameless_AI*`. |
| 6 | `kofwing/6148152.swf` | AS2 runtime boilerplate | Confirmed | Pure `ASSetNative` prototype definitions; **no game logic** - not a launcher. |

### There is no launcher SWF

The Flash Projector EXE *is* the launcher. The first SWF in the file is `6148152.swf` at offset
6,148,152, but it contains only AS2 API prototype scaffolding. Misreading it as a bootstrap
module would send you in the wrong direction entirely.

The other four small `kofwing/` files are standard **Flash Player runtime** resources, not game
code: `6230976.swf` (fullscreen alert overlay, `FullScreen_MC`), `6235248.swf` (SharedObject
settings/version store), `7298128.swf` (permission panel: Webcam/Microphone/Privacy), and
`20817874.swf` (debug UI, `debug/debug.swf`).

---

## 4. Responsibilities, evidence and confidence

| Role | Count | Bytes | Evidence |
| --- | ---: | ---: | --- |
| Stage background module | 83 | 97,245,483 | Every one exports a global `bgArray` of `{isBmd, mc, v_rate, isBase}` - a uniform, machine-checkable contract. |
| Combat engine / character pack | 5 | 137,775,132 | `role_corn/Role.as`, `HitCheck.as`, `HitCheck_obj.as` plus `<Name>_AI*.as` classes. |
| Flash runtime helper | 4 | 107,798 | AS2 API stubs, fullscreen overlay, settings panel, debug UI. |
| SharedObject settings store | 1 | 968 | `SharedObject.getLocal`, `SetSetting`, XML version check. |
| Not an SWF (extraction artefact) | 4 | 359,774,687 | Tag streams never reach an `End` tag; lie inside the boot movie. |

Note the false positives account for **359 MB** of the 594 MB total - over 60% of apparent data
volume is extraction noise. Any size-based reasoning on this set would be badly misled.

---

## 5. Code location index

Machine-readable: [`code_index.csv`](code_index.csv) · [`code_index.md`](code_index.md)
Base path: `_reverse/analysis/kofwing__21256864/scripts/scripts/__Packages/`

| Subsystem | Classes | Key file | Size |
| --- | ---: | --- | ---: |
| Character state machine | shared | `role_corn/Role.as` | 198 KB |
| Hitbox / collision | 2 | `HitCheck.as`, `HitCheck_obj.as` | 20 / 21 KB |
| Input handling | 2 | `role_corn/KeyControl.as` | 12 KB |
| Per-character AI | 252 | `<Name>_AI.as` | ~120 KB each |
| Character definition | 42 | `<Name>_role.as` | 9-14 KB |
| Combo system | 26 | `*_Combo.as`, `Combo_listener.as` | 3-5 KB |
| Flash MXML framework | 43 | `mx/**` | - |

**24 characters have AI classes in the boot movie**: Ash, Athena, CKrizalid, Chunli, CZero,
Goenitz, Haohmaru, Igniz, Iori, K, Krizalid, Kula, Kusanagi, Kyo, KyoW, Mai, Orochi, Oswald,
Rugal, Ryo, Ryu, Terry, Zero (plus `Type2_`/`Type3_` variants).

**Four characters keep their AI only in the EXE-embedded packs** - Andy, Kim, Moriya, Nameless.
Each pack carries a *complete duplicate* of the shared engine (`Role.as`, `HitCheck.as`,
`KeyControl.as`). Patching hit detection in the boot movie alone will silently leave those four
characters on old behaviour.

### Inline gameplay data found in `frame_1629/DoAction.as`

```actionscript
// line 3348 - playable roster
var cpuNormal_list = new Array("Kyo","Terry","Chunli","Mai","Ryu","Iori","K","Kula",
    "Moriya","Haohmaru","Ryo","Athena","Ash","Nameless","Kim","Andy","Oswald");

// lines 3374-3382 - move IDs that must be blocked, per character
mustDefendSkill.Kyo  = ["sk31","sk31_s"];
mustDefendSkill.Iori = ["sk_s_89b_s"];
mustDefendSkill.Kula = ["sk_s_xingchen","sk_s_jiejie"];

// lines 3383-3386 - keyboard bindings
var key_P1_proto = {u:87,d:83,b:65,f:68,p:74,k:75,p_l:85,k_l:73,s:79,s2:76,h:84,qq:80};

// lines 3363-3373 - built-in stage defaults (STALE - see section 8)
bgMappingDefault.stageBG = "moonbridge,factory,gym,palace,earth";
```

---

## 6. SWF load graph

Full graph and evidence: [`dependency_graph.md`](dependency_graph.md) ·
Edges: [`dependency_edges.csv`](dependency_edges.csv) · Mermaid: [`dependency_graph.mmd`](dependency_graph.mmd)

```
launcher (EXE)
  └─> kofwing/21256864.swf            MAIN, 125 MB, AS2
        ├─ LoadVars.load("stage/list.txt")        [CONFIRMED]
        │     └─ stageArray = bgInf.stageBG.split(",")  → _level0.bgArray
        ├─ LoadVars.load("sound/list.txt")        [CONFIRMED]
        │     └─ loadSound(key) → Sound.loadSound("sound/" + value)
        ├─ loadClip("stage/" + bgID + ".swf")     [83 stage SWFs]
        │     └─ stage SWF exports bgArray[] → Stage_control2.as:76
        ├─ loadClip("char/" + role + ".swf")      [MISSING]
        ├─ loadMovie("data/skillList.swf")         [MISSING]
        ├─ loadMovie("code.swf")                   [MISSING]
        ├─ loadMovie("stage/weather/" + tq + ".swf")[MISSING]
        └─ Sound.loadSound("sound/main.mp3", "sound/select.mp3")  [CONFIRMED]
```

### Confirmed vs missing

Only **4** edges could be confirmed against files on disk (both `list.txt` registries,
`sound/main.mp3`, `sound/select.mp3`). Everything else is a concatenated path proven by code but
unresolvable statically - exactly as expected for a game that builds names at runtime.

---

## 7. External resources and configuration files

Three registries, all Flash `loadVariables()` format (`&key=value&`):

| File | Pairs | Status |
| --- | ---: | --- |
| `stage/list.txt` | 31 | 20/20 `stageBG` items resolve to real `stage/*.swf`. 19 of 30 character→stage entries are stale. |
| `stage2/list.txt` | 39 | **All 76 entries resolve**, but this file is never read by the boot movie. |
| `sound/list.txt` | 42 | **41/41 resolve**, plus scalar `musicNum=50`. |

Naming rules recovered:

- **Stage module contract** - each stage SWF must export a global `bgArray` of layer records:
  `isBmd` (bitmap layer), `mc` (MovieClip), `v_rate` (parallax rate), `isBase` (anchor layer).
  Identical across all 83 files, including multi-layer stages (`stage2/CloneTeam.swf` uses three
  layers at `v_rate` 0.5 / 0.75 / 1).
- **Stage path rule** - hard-coded `stage/<name>.swf`. **No fallback directory search exists.**
- **BGM path rule** - registry value is appended to `sound/`. Extension case matters:
  `sound/list.txt` requires `ChunLi.MP3` and `Iori3.mp3` exactly as written.
- **Fallback behaviour** - a failed music load calls `attachSound("blank")`, so bad filenames
  degrade to silence instead of crashing.

---

## 8. Findings requiring the owner's input

1. **Is `char/` present in a working install?** The game requires it; it is absent here. If the
   game currently reaches a match, those files exist in another location.
2. **What is the schema of `data/skillList.swf`?** The boot movie calls
   `skList.currentName = <role>; skList.onLoadSkill()`. Whether move data lives there or inside
   the character modules is unconfirmed - and it blocks confident character-modding work.
3. **What is `code.swf`?** Loaded into `code_mc` at `frame_1629/DoAction.as:3541`; purpose unknown.
4. **Is `stage2/` meant to be copied into `stage/`?** The loader only ever reads `stage/`, yet
   `stage/list.txt` maps characters to files that exist *only* under `stage2/其他地图/静态|动态/`.
   Either those are copied manually or the mappings are simply broken.
5. **`musicNum=50` vs 43 MP3 files** - missing tracks, or does the counter mean something else?
6. **Are the four EXE-embedded character packs still live?** The boot movie carries a newer copy
   of the same engine; these may be legacy leftovers.
7. **`fscommand("exec","changedisplay1.exe"/"changedisplay2.exe")`** invokes external binaries
   that are not in this tree. Where do they come from?

---

## 9. Parse failures, gaps and caveats

- **4 files rejected** (false positives) - cause identified and proven; no action needed beyond
  not trusting them.
- **89 files carry a stale `FileLength`** - harmless for JPEXS, but any other tool that trusts
  the header will mis-parse them. Do not "repair" in place without keeping an original copy.
- **6 duplicate groups** - both copies kept, nothing overwritten. Only one needs editing.
- **JPEXS script export** completed with **0 errors** on the boot movie (27,122 files) and on
  every valid stage SWF. The only recorded errors belong to the four rejected files.
- **No FLA/XFL export was performed.** It was unnecessary for the questions asked, and per your
  instruction it would be an approximation, not a recovered project. If you later want one, it
  belongs in a separate `fla_export/` folder.
- **`_reverse/analysis/_test/`** is a leftover 4-file smoke-test folder from validating the
  pipeline. It is not part of the results. The deletion launcher was unavailable in this
  environment, so please remove it manually.

---

## 10. Recommended next steps

1. **Obtain the missing runtime directories** (`char/`, `data/skillList.swf`, `code.swf`,
   `stage/weather/`) before attempting any character-level work. Everything about character
   moves and hitboxes is gated on these.
2. **Back up the game tree**, then experiment only on copies.
3. **Start with `list.txt` edits** - adding a BGM track or a stage entry needs no tooling at all
   and validates the whole chain end to end.
4. **Then edit AS2 in JPEXS** - start with a low-risk constant such as the roster array at
   `frame_1629/DoAction.as:3348` or the key bindings at lines 3383-3386.
5. **When touching the shared engine**, remember the five copies: boot movie plus the Kim,
   Moriya, Nameless and Andy packs.
6. **Reuse this workspace** - every step is scripted in `_reverse/tools/` and re-runnable
   against a corrected or completed directory tree.

---

## Appendix - workspace layout

```
_reverse/
├── tools/                        re-runnable analysis scripts
│   ├── swf_struct.py             SWF header + tag-walk validator (no JPEXS needed)
│   ├── jpexs_batch.py            per-SWF JPEXS dumpSWF + script export
│   ├── parse_registries.py       list.txt parsing + on-disk resolution check
│   ├── classify.py               evidence-based role assignment
│   ├── build_graph.py            dependency edges + Mermaid graph
│   ├── build_inventory.py        file_inventory.csv / .md
│   ├── build_code_index.py       code_index.csv / .md
│   ├── find_boot_swf.py          EXE signature scan + SHA-256 correlation
│   └── inspect_out.py, stats.py, find_classes.py, _check_offsets.py
├── analysis/<id>/                one directory per SWF
│   ├── metadata.json  dumpSWF.txt  assets.json
│   ├── strings.txt    errors.txt
│   └── scripts/       JPEXS-exported ActionScript
└── reports/
    ├── file_inventory.csv / .md
    ├── dependency_edges.csv  dependency_graph.mmd  dependency_graph.md
    ├── code_index.csv / .md
    ├── registries.json  registry_entries.csv
    └── modding_assessment.md  final_report.md
```

Each `analysis/<id>` is named from its relative path (e.g. `stage2__其他地图__动态__007`), so
same-named files in different directories never collide and original paths are preserved in
`metadata.json`.