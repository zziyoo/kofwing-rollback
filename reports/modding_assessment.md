# Modding Feasibility Assessment - King of Fighters Wing EX1.2

Scope: what can be changed with the tools at hand, where the change must be made, and what
still needs runtime verification. Everything below is grounded in decompiled AS2 from the
boot movie unless explicitly marked as inference.

---

## 1. Is the main program located? Yes - with independent confirmation

**`kofwing/21256864.swf`** is the main program. Three independent lines of evidence agree:

| Evidence | Detail |
| --- | --- |
| EXE layout | Found at EXE byte offset **21,256,864**, running to end-of-file (146,699,366). A Flash Projector appends its main movie last; this is the last SWF in the file. |
| Format | Signature `ZWS` (LZMA-compressed), SWF **v15** - the only LZMA movie in the set, consistent with a late, large build. |
| Content | 553,260 parsed tags, 27,122 ActionScript files, 427 classes, 1,678 named exports, 24,753 image tags, 1,308 sound tags, 733 `DoInitAction` blocks. |

The extracted filename equals the EXE offset for every file in `kofwing/` - JPEXS named them by
offset, so `21256864.swf` literally means "the SWF at EXE offset 21,256,864".

**Launcher / loader:** there is no separate launcher SWF. The projector EXE is the launcher.
The earliest SWF in the EXE (`6148152.swf`, offset 6,148,152) is pure AS2 runtime boilerplate
(`ASSetNative` prototype definitions) with **no game logic** - it must not be mistaken for a
bootstrap module.

---

## 2. Where the core logic lives

All in the boot movie, under `_reverse/analysis/kofwing__21256864/scripts/scripts/__Packages/`:

| Subsystem | Class | Size | Notes |
| --- | --- | ---: | --- |
| Character state machine | `role_corn/Role.as` | 198 KB | Shared core for every character: status machine, physics, hit reaction. |
| Hitbox / collision | `HitCheck.as`, `HitCheck_obj.as` | 20 KB / 21 KB | `hitValue.d_rate`, `powerNum`, `hitType`, `hitEff`, `flagHurt`, `flagHit`. |
| Input handling | `role_corn/KeyControl.as` | 12 KB | Reads the key tables in `frame_1629`. |
| Per-character AI | `<Name>_AI.as` | ~120 KB each | 252 AI classes total across 24 characters. |
| AI difficulty tiers | `<Name>_AI_Lv1..Lv5.as` | 8-20 KB each | Separate class per difficulty level. |
| Character definition | `<Name>_role.as` | 9-14 KB | Per-character parameters. |
| Combos | `*_Combo.as`, `Combo_listener.as` | 3-5 KB | Combo state tracking. |
| Projectiles | `skill/FlyingObj.as` | 8 KB | Flying-object behaviour. |
| Stage control | `Stage_control2.as` | - | Consumes `bgSource.bgArray`. |

**Four characters keep their AI outside the boot movie.** `Andy`, `Kim`, `Moriya` and `Nameless`
have their `_AI`, `_AI_Lv1..Lv5` and `Type2_` variants **only** in the EXE-embedded packs:

| Character | Pack SWF | EXE offset |
| --- | --- | ---: |
| Kim | `kofwing/11480055.swf` | 11,480,055 |
| Moriya | `kofwing/16695748.swf` | 16,695,748 |
| Nameless | `kofwing/18464326.swf` | 18,464,326 |
| Andy | `kofwing/8492959.swf` | 8,492,959 |

Each pack carries its **own full copy** of `Role.as`, `HitCheck.as`, `HitCheck_obj.as` and
`KeyControl.as`. So the shared engine is duplicated five times in this build - a mod that changes
hit detection only in `21256864.swf` will silently miss those four characters.

---

## 3. Where to change specific things

| Goal | Change here | Confidence |
| --- | --- | --- |
| Damage, hitbox geometry, hitstun | `__Packages/HitCheck.as`, `HitCheck_obj.as` | High - fields observed directly |
| Character state/AI behaviour | `__Packages/<Name>_AI.as` | High |
| AI difficulty | `__Packages/<Name>_AI_Lv1..Lv5.as` | High |
| Shared character physics/reactions | `__Packages/role_corn/Role.as` | High |
| Roster (who can be picked) | `frame_1629/DoAction.as:3348` `cpuNormal_list` | High |
| Boss roster | `getCPUList()` in `frame_1629/DoAction.as:513-713` | High |
| Default key bindings | `frame_1629/DoAction.as:3383-3386` `key_P1_proto` / `key_P2_proto` | High |
| Per-character must-block move IDs | ~~`frame_1629:3374-3382` `mustDefendSkill`~~ | **⚠️ 见下方更正 —— 该表是死代码** |
| Stage list shown to the player | `stage/list.txt` (`stageBG=` line) | High |
| Character→stage pairing | `stage/list.txt` | Medium - many entries broken, see graph report |
| BGM assignment | `sound/list.txt` | High |
| Stage visuals / parallax | The stage SWF's own `bgArray` script | High |
| Weather overlay | `stage/weather/<tq>.swf` + `_root.tq` | Medium - target files missing |
| Move/command list | `data/skillList.swf` (`onLoadSkill()`) | **Unresolved - file missing** |

Notable inline data already present in `frame_1629/DoAction.as`:

```actionscript
// line 3348 - playable roster
var cpuNormal_list = new Array("Kyo","Terry","Chunli","Mai","Ryu","Iori","K","Kula",
    "Moriya","Haohmaru","Ryo","Athena","Ash","Nameless","Kim","Andy","Oswald");

// lines 3374-3382 - ⚠️ DEAD CODE, do not edit (see correction below)
mustDefendSkill.Kyo  = ["sk31","sk31_s"];
mustDefendSkill.Iori = ["sk_s_89b_s"];
mustDefendSkill.Kula = ["sk_s_xingchen","sk_s_jiejie"];

// lines 3383-3386 - keyboard bindings
var key_P1_proto = {u:87,d:83,b:65,f:68,p:74,k:75,p_l:85,k_l:73,s:79,s2:76,h:84,qq:80};

// lines 3363-3373 - built-in stage defaults (STALE - see section 8)
bgMappingDefault.stageBG = "moonbridge,factory,gym,palace,earth";
bgMappingDefault.Kyo     = "factory";
```

### ⚠️ 更正：`mustDefendSkill` 是死代码

本文件初版把 `frame_1629:3374-3382` 的 `mustDefendSkill` 表列为"高可信度修改点"。
**该判断是错的。**

核查结果（`python` 跨 5 个 SWF 全量检索）：

- 该变量在主程序中有 **305 处**出现，但**全部是赋值或声明**：
  `var mustDefendSkill = new Object();` 与 `mustDefendSkill.<角色> = [...]`。
- **没有任何一处读取它** —— 不存在 `mustDefendSkill[x]` 形式的读取，
  也不存在 `_root.mustDefendSkill` / `_level0.mustDefendSkill` 的限定引用。

**修改这张表不会产生任何效果。**

**真正生效的是每个 AI 类自己的表：** 每个 `<Name>_AI.as` 在约 1764–1769 行定义了自己的
`checkMustDefendSkill(oppSkill)` 函数，内部持有一份更大的本地表，并在 `:1089`、`:1584`、
`:2579` 等处被调用。

**要改"必须防御的招式"，应修改对应角色 `<Name>_AI.as` 里的 `checkMustDefendSkill()`，
而不是 `frame_1629` 的全局表。**

（复现：`Select-String -Pattern "mustDefendSkill" -Recurse` 后过滤掉 `mustDefendSkill\.\w+\s*=`
的行；剩余为空即证明无读取。）

Note that `bgMappingDefault` names (`moonbridge`, `factory`, `gym`, `palace`, `earth`) **do not
exist** in `stage/` either, so the in-code defaults are stale; `stage/list.txt` is what actually
drives stage selection.

---

## 4. Adding a new character

Confirmed required touch points:

1. **`data/skillList.swf`** must expose the character's move table. The boot movie calls
   `skList.currentName = <role>; skList.currentMode = <mode>; skList.onLoadSkill();`
   so the data SWF is keyed by character name string. **This file is missing**, so the exact
   schema cannot be confirmed statically.
2. **`char/<Name>.swf`** is loaded via `loadClip("char/" + name + ".swf", P1_mc)`, with
   `P1_mc._lockroot = true`. The character module must therefore address the game through
   `_root`/`_level0` and define the move/skill identifiers that `skillList` maps to.
   **The `char/` directory is missing**, so its interface can only be inferred from the boot
   movie's expectations, not verified.
3. **Roster arrays** in `frame_1629/DoAction.as` (`cpuNormal_list`, boss lists).
4. **AI class** `<Name>_AI.as` + `_AI_Lv1..Lv5.as` under `__Packages/`.
5. **Stage + music entries** in `stage/list.txt` and `sound/list.txt`.

Adding a character is therefore **not yet feasible** with confidence: two of the five required
artefacts (`char/`, `skillList.swf`) are absent, so the contract they must satisfy is unverified.

---

## 5. Adding or replacing stages and BGM

**BGM is the easiest win.** `sound/list.txt` is a plain `&key=value&` text table (Flash
`loadVariables` format) and fully resolves against the files present. Adding a track means
dropping an MP3 into `sound/` and adding one line. The code reads it as:

```actionscript
function loadSound(char, chars) {
   var _loc2_ = soundInf[char];          // e.g. loadSound("Iori3","Iori")
   stageSound.loadSound("sound/" + _loc2_, false);
}
```

A failed load falls back to `attachSound("blank")`, so a bad filename degrades to silence rather
than crashing. Volume is `_level0.BgmVolume`.

**Stages** require a SWF that exports a global `bgArray` (array of
`{isBmd, mc, v_rate, isBase}`), plus an entry in the `stageBG=` line of `stage/list.txt`.
The contract is fully established - 83 stage SWFs implement it identically - so a new stage is
feasible. Multi-layer parallax is already demonstrated (`stage2/CloneTeam.swf` uses three
layers at `v_rate` 0.5 / 0.75 / 1).

**Caveat:** the loader path is hard-coded to `stage/`, with no fallback directory search.

---

## 6. What JPEXS alone can do

Directly achievable with JPEXS, no Flash IDE required:

- **Edit and recompile AS2 source.** All code is AS1/AS2 (`DoAction`/`DoInitAction`);
  **zero `DoABC` tags exist anywhere in the set**, so there is no AS3/AVM2 bytecode to fight.
  JPEXS can edit the `.as` files and write the SWF back.
- **Change `list.txt` registries** - plain text, no tooling at all.
- **Swap MP3 tracks** in `sound/` (including extension case, which matters:
  `sound/list.txt` requires `ChunLi.MP3` and `Iori3.mp3` exactly).
- **Replace embedded sounds** via JPEXS `DefineSound` replacement.
- **Patch constant tables** - rosters, key bindings, and `mustDefendSkill` are plain
  literals in `frame_1629/DoAction.as`.

Because the game is AS2 throughout, this is a markedly easier target than a modern AS3 project.

---

## 7. What needs FLA/XFL export or Flash Professional CS6

| Task | Why |
| --- | --- |
| Editing timelines / frame labels | Timeline data is not reconstructible from decompiled script. JPEXS `-export fla/xfl` gives an approximation, **not** the original project. |
| Re-authoring sprite animation | Same - layer structure and frame layout are lost in decompilation. |
| Rearranging UI layout | Symbol structure is not round-trippable. |
| Rebuilding the character module contract | `char/` is missing; JPEXS cannot reconstruct a file it does not have. |

**Critical caveat:** SWF→FLA conversion does **not** recover original layer names, timeline
structure, symbol organisation or project settings. A successful export is *not* a recovered
original project. Always keep the original SWFs and test any modification on a copy.

---

## 8. Still needs runtime verification

These cannot be settled by static analysis:

1. **Is `char/` present in a working install?** The game needs it and it is absent here.
   If the game currently starts and reaches a match, `char/` must exist elsewhere on disk.
2. **What exactly is `data/skillList.swf`?** Its schema, and whether move data lives there or
   inside the character modules, is unconfirmed.
3. **What is `code.swf`?** Loaded at `frame_1629/DoAction.as:3541` into `code_mc`; purpose unknown.
4. **Is `stage2/` supposed to be copied into `stage/`?** See the graph report.
5. **Why does `musicNum=50` while only 43 tracks exist?** Either tracks are missing or the
   counter drives something other than the file count.
6. **Do the four EXE-embedded character packs still get used**, given the boot movie contains a
   newer copy of the same engine? They may be legacy leftovers.
7. **What are the `changedisplay1.exe` / `changedisplay2.exe` calls?** `fscommand("exec", ...)`
   invokes external binaries that are not in this directory tree.

---

## 9. Recommended tooling chain

1. **Back up** `wingex1.2.exe`, `kofwing/`, `stage/`, `stage2/`, `sound/`, `data/` first.
   Everything below operates on copies only.
2. **JPEXS Free Flash Decompiler 26.3.0** (`D:\swf解包\ffdec.jar`) for all script editing.
   All analysis in this workspace was produced with it via CLI.
3. **Plain text editor** for `list.txt` registries.
4. **Flash Professional CS6** only if you need timeline or symbol-level edits - and treat any
   export as an approximation.
5. Re-test by running the patched EXE with the original folder contents restored.

## 10. Risks specific to this build

- **Stale `FileLength` headers.** 89 of 97 files declare a length larger than their actual size.
  JPEXS handles this, but any external tool that trusts the header will mis-parse these files.
  Do not "repair" them in place without keeping an original copy.
- **Duplicated engine code.** Patching hit detection in the boot movie alone leaves
  Andy/Kim/Moriya/Nameless on the old behaviour.
- **Stale built-in defaults.** `bgMappingDefault` names do not exist on disk; code defaults and
  `list.txt` disagree. Changing one without the other can be silently ineffective.