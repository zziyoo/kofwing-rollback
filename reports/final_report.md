# 最终报告 - King of Fighters Wing EX1.2 逆向分析

工作目录：`_reverse/`（git 仓库，分支 `main`）
游戏数据根目录：`D:\拳皇\拳皇WingEX1.2前瞻版\`（全程只读）
工具：JPEXS Free Flash Decompiler 26.3.0 CLI + 自建 Python 管线（仅标准库）

---

## 0. 收尾复核状态（最新一轮）

| 项 | 值 |
|---|---|
| 分支 | `main` |
| 复核时 HEAD | 见 `git rev-parse HEAD`（本报告随每次提交更新） |
| 工作区 | 干净 |
| 自动化测试 | `python -m unittest discover -s tests -t .` → **67 tests, OK** |
| 审计复核 | `python tools/verify_audit_findings.py` → **14 FIXED_VERIFIED / 2 HISTORICAL / 0 OPEN** |

### 上一轮各问题的复核状态

| ID | 问题 | 状态 |
|---|---|---|
| B1 | 清单 SHA-256 与磁盘不符 | **HISTORICAL** — 有意保留 |
| B2 | 两工具抢写 `dependency_edges.csv` | FIXED_VERIFIED |
| B3 | `recover_from_exe.py` 静默改写游戏目录 | FIXED_VERIFIED |
| M1 | 被拒文件混入资源统计 | FIXED_VERIFIED（`with_sound` 6 → **5**） |
| M2 | `stage/` 与 `stage2/` 合并计数 | FIXED_VERIFIED |
| M3 | 角色计数与工具产出不符 | FIXED_VERIFIED（**独立角色 21**） |
| M4 | `stageBG` 数量不符 | FIXED_VERIFIED（19） |
| M5 | 被拒文件签名描述过时 | FIXED_VERIFIED（2 个是 `GFX`） |
| M6 | `classify.py` 注册表分支死代码 | HISTORICAL — 已降级为 legacy |
| m1–m6 | argv 守卫 / 排序稳定性 / 硬编码 id / id 碰撞 / 重跑幂等 / 逐边遍历 | 全部 FIXED_VERIFIED |
| CLS | 主程序无独立角色 | FIXED_VERIFIED（新增 `main_program`） |

详见 `reports/analysis_quality_audit.md` 第 0 节与 `reports/_audit_recheck.json`。

### 溯源：三个记录并存，互不覆盖

| 文件 | 描述 | 主程序字节数 |
|---|---|---:|
| `reports/_struct.json` | **原始提取物**（第一次 JPEXS 批量），历史记录 | 125,450,217 |
| `reports/_struct_current.json` | **当前磁盘状态**（从 EXE 重新切出后） | 125,442,502 |
| `reports/_struct_current_provenance.json` | 上述扫描的完整溯源（输入哈希、工具哈希、Python 版本、耗时、差异清单） | — |

差异原因：重新切出时按"偏移到文件末尾"截取，而非过期的 `FileLength` 声明值，
少 7,715 字节；**标签流仍然完整**。两份记录都保留，不做覆盖。

### 测试与实验边界（诚实声明）

| 已实际执行 | 未执行 / 无法执行 |
|---|---|
| `python -m unittest discover -s tests -t .` → **67 tests, OK** | ❌ 启动 Flash Projector 运行游戏 |
| `python tools/verify_audit_findings.py` → 全项复核 | ❌ 重建 125 MB 实验产物（按要求不做） |
| `python tools/rebaseline_struct.py` → 重新基线 + 溯源 | ❌ EXE 字节替换实验 |
| `python tools/recover_from_exe.py`（无 `--force`）→ 实测 ABORT | ❌ 从网络获取游戏资源 |
| JPEXS `-dumpSWF` / `-export` / `-importScript` 实跑 | ❌ 用破坏性分支测试真实游戏文件 |
| 全部测试使用**程序化合成**的小型 SWF 夹具，不含真实游戏文件 | |

---

## 1. 执行摘要

主程序是 **`kofwing/21256864.swf`**（125,442,502 字节，LZMA/SWF v15），三条独立证据互相印证：
位于 EXE 偏移 21,256,864 并**精确延伸至文件末尾**（21,256,864 + 125,442,502 = 146,699,366 = EXE 大小）；
全目录唯一的 `ZWS` 影片；含 71,378 个标签、427 个 AS2 类、27,122 个脚本。

游戏是**纯 AS1/AS2，零 `DoABC`**。全部 427 个类都在主影片里，没有 AVM2 字节码。

四个运行时缺失依赖中，**已找回一个**：`data/skillList.swf` 藏在
`data/data_old.tar` 里，含 **22 个角色、794 条完整出招表**。

**修改流程已被实验证明可行**（见第 6 节）：脚本能改、SWF 能重存且结构无损，
但**游戏能否正常跑通未经验证**，EXE 重新打包**未打通**。

> 本报告取代第一轮 `final_report.md`。下文标注 `[更正]` 的条目是复核后推翻了初版结论的。

---

## 2. 结论一：当前游戏目录是否完整

### 不完整

| 组成 | 状态 |
|---|---|
| `wingex1.2.exe` | ✅ 完好，146,699,366 字节 |
| `kofwing/` 10 个有效 SWF | ✅ 已从 EXE 重新切出并校验（9 个 SHA-256 完全一致，主程序因文件尾截断 7,715 字节但标签流完整） |
| `stage/` `stage2/` `sound/` 资源 | ⚠️ **已被移除**，当前内容是你手动修改的版本，原版待你补回 |
| `data/skillList.swf` | ✅ **已找回**，位于 `D:\kof_rescue\data_old_tar\skillList.swf` |
| `char/` `code.swf` `stage/weather/` | ❌ 仍未找到 |

### 已找回的依赖

**`data/skillList.swf`** —— 出招表查看器，1,402,229 字节，SWF v15，通过结构校验。

内部结构完全确定：22 个 `FrameLabel`（每角色一个），导出
`skillList_icon` / `BoundingBox` / `DataHeaderBackGnd` 等 7 个 UI 符号，
数据是**内联 XML 字面量**，运行期用 `_root[currentName + currentMode]` 取用：

```actionscript
var Kyo1 = new XML("<char><skillList skill=\"招式名\" normal=\"普通指令\" "
                 +"easy=\"简易指令\" describe=\"备注\"/></char>");
```

**数据自包含，不需要任何外部 XML 文件。** 已提取 41 份表、**794 条招式**，
见 `reports/move_list.md`。

### 仍缺失

`char/`、`code.swf`、`stage/weather/`。其中 `char/` 的影响范围现已明确（见第 4 节）。

---

## 3. 结论二：Stage 与 BGM 配置

### 确认存在的问题

| # | 问题 | 证据 | 影响 |
|---|---|---|---|
| S1 | 19 条角色→舞台绑定指向**不存在的文件** | `stage/list.txt` 中的 `iceLab`/`Factory`/`Moon bridge` 等，在 EX1.2 中无对应 `.swf` | 这些角色的专属舞台加载失败 |
| S2 | 7 条绑定指向 `stage2/其他地图/` 下的文件，而加载器**硬编码只查 `stage/`** | `DefineSprite_2659/frame_1:29`：`loadClip("stage/" + bgID + ".swf")`，无回退搜索 | 未复制则加载失败 |
| S3 | 内置默认舞台名与实际地图名**完全不重叠** | `frame_1629:3363` 的 `moonbridge/factory/gym/palace/earth` vs 19 张中文名地图 | `list.txt` 读失败时静默全灭 |
| S4 | `stage2/list.txt` **没有任何消费者** | 全文检索 `stage2` 在 27,122 个脚本中零命中 | 疑似 EX1.2 接入未完成 |
| B1 | `musicNum=50` 主程序**零引用** | 全文检索引用次数 = 0 | 无运行时影响，**不是 Bug** |
| B2 | 菜单音乐不在 `list.txt` 中，硬编码在代码里 | `frame_1629:3413`、`DefineSprite_2732:12` | 换菜单音乐需改代码 |
| B3 | 扩展名大小写混用（`ChunLi.MP3` / `Iori3.mp3`） | `sound/list.txt` | 仅影响区分大小写的系统 |

### 尚待你确认的

- **S1/S2 是否为设计意图。** 三种可能：(A) `其他地图` 是需要玩家手动拷进 `stage/` 的扩展；
  (B) `list.txt` 是原版遗留，EX1.2 换了地图名没同步；(C) 绑定失效被容忍。
  **在确认前不要把整个 `stage2/` 复制到 `stage/`** —— 那里不只有地图，还有 60+ 个角色同名文件。

### 一个有价值的机制发现

`stage/list.txt` 的 `stageBG=` 是**候选舞台池**，`&角色=舞台&` 是**独占绑定**
（绑定后被 `splice` 出池，不参与随机）。加载路径有两条：
`isLoadStage=true` 走外部文件，`false` 走 `attachMovie("stage_"+bgID)` 内嵌符号 ——
但主程序里**不存在任何 `stage_<地图名>` 符号**（`stage` 前缀导出只有 `Stage_shake`
和 `stageControl_mc`），所以内嵌分支实际不可用。

---

## 4. 结论三：游戏逻辑定位

### 四个外部加载角色（关键发现）

`frame_1629:728-773` 的 `checkOutRole()` 里有硬编码白名单：

```actionscript
var _loc3_ = ["Kim","Nameless","Moriya","Andy"];
...
if(roleNameP1 == _loc2_) { loadP1(); }   // → loadClip("char/" + name + ".swf")
```

**只有这 4 个角色走外部 `char/` 加载，其余 21 个走 `attachMovie("role_"+name)` 从主影片内联。**

而这 4 个恰好是主程序中唯一缺失 `_role.as`/`_AI*.as` 的角色，
且其类**只存在于 EXE 内嵌的 4 个包**里（11480055=Kim、16695748=Moriya、
18464326=Nameless、8492959=Andy）。

**结论：内嵌包与 `char/` 模块是同一批角色的两套实现，设计意图明确。**
未决的只有交付路径（AS2 无 API 能把内存影片写成磁盘文件）。
**若 `char/` 缺失，受影响的只有这 4 个角色，其余 21 个不受影响。**

### `[更正]` 引擎副本不是"高度分歧"

初版称 `HitCheck.as` 与主程序版本差异 97.15%。**该结论错误**，源于按行号位置比较的
差异算法缺陷（一处早期插入会让其后全部行错位）。用 `difflib` 重测：

| 类 | 相似度 | 实际差异 |
|---|---|---|
| `role_corn/Role.as` | 99.94% | 主程序少 9 行 |
| `HitCheck.as` | 99.92% | 主程序少 1 行 |
| `KeyControl` / `HitCheck_obj` / `Combo_listener` / `FlyingObj` | **100%** | 完全一致 |

差异方向一致且均为"主程序更少"，几乎确定是 `trace()` 调试语句。
**风险等级：低。**

### `[更正]` `mustDefendSkill` 是死代码

`frame_1629:3374-3382` 的必防招式表有 305 处出现，但**全部是赋值，无任何读取**。
改它不会有任何效果。真正生效的是每个 `<Name>_AI.as:1764+` 自己的
`checkMustDefendSkill()` 函数及其本地表。

### 准确定位的子系统

| 子系统 | 位置 |
|---|---|
| 主控制器 | `scripts/frame_1629/DoAction.as`（3,542 行） |
| 角色状态机 | `__Packages/role_corn/Role.as`（6,978 行） |
| 判定框 | `__Packages/HitCheck.as`（595 行）、`HitCheck_obj.as` |
| 输入处理 | `__Packages/role_corn/KeyControl.as`（446 行） |
| 角色 AI | `__Packages/<Name>_AI.as` + `_AI_Lv1..Lv5.as`，共 252 个类 |
| 伤害显示 | `__Packages/Life_Power.as` |
| 音乐管理 | `DefineSprite_1847_bgmControl_mc/frame_1/DoAction.as` |
| Stage 注册表消费 | `DefineSprite_61566/frame_1/DoAction.as` |
| Stage 图层控制 | `__Packages/Stage_control2.as` |
| 难度分派中枢 | `DefineSprite_1321_loaderchar/frame_1/DoAction.as:1-102` |
| 出招表 | `data/skillList.swf`（已找回） |

**最安全的调试插入点：`frame_1629:720` 的 `out(str)` 函数体是空的**，
全代码高频调用，插入打印零行为风险。

---

## 5. 结论四：统计口径（`[更正]`）

所有头条数字经 `tools/stats.py` 复算，`python -m unittest discover -s tests -t .` → **46 tests, OK**。

| 指标 | 值 | 口径 |
|---|---:|---|
| SWF 候选 | 97 | 全部 `.swf`（**历史全量扫描**，`_struct.json`） |
| 结构有效 | **93** | 签名+解压+标签流走到 `End` |
| 被拒（误识别） | **4** | 签名真但标签流是垃圾 |
| FileLength 过期 | 89 | 警告，非损坏 |
| 含 AS2 | 82 | 仅有效 SWF |
| 含 AS3 | **0** | 仅有效 SWF |
| 含声音标签 | **5** | `[更正]` 初版记 6 —— 统计包含了被拒文件 |
| AS2 类 | 427 | 主影片 `__Packages/` |
| AI 类 | 252 | 含变体 |
| **独立角色** | **21** | 折叠 `Type2_`/`Type3_`/`C` 前缀后的基础名 |
| 导出脚本 | 31,215 | 全部 SWF 合计 |

> **原始扫描 vs 当前重新生成**：`97/93/4/89/82/0/31,215` 来自**原始全量扫描**
> （当时含完整的 `stage/` `stage2/` `sound/`）。当前磁盘只剩 `kofwing/` 14 个文件，
> 重新基线得到 `14/10/4`（见 `_struct_current.json`）。
> 两组数字都对，只是**统计范围不同**，不是矛盾。

**4 个被拒文件**是主影片 LZMA 流里的偶然字节序列（签名 `GFX` 而非 `FWS`），
占总体积 60% 以上。它们在所有下游统计中均已排除。

**未修复的已知弱点：** ~~`classify.py` 无法输出 `main_program` 角色~~ —— **已修复**。
现在按实测规则分类：`__Packages` 类数 ≥ 100 判为 `main_program`
（实测主程序 427，其余最多 26，**16 倍余量**）。4 个角色包已正确降级为 `combat_engine_module`。
测试 `tests/test_safety_guards.py::BootMovieClassificationTest` 锁定该行为。

---

## 6. 结论五：能否修改并重新保存

实验报告：`reports/modding_pipeline_validation.md`

### 6.1 脚本能修改 —— **已证明**

在 125 MB 主影片副本上实测：
- 用 `-importScript` 重新编译 AS2 源码
- 重新打开保存后的 SWF，`HitCounter.as:55` 的 `"Perfect"` 已变为 `"PerfectJPEXS"`
- **27,122 个脚本中 27,121 个字节完全一致，仅 1 个改变，0 个丢失**
- 全量 553,260 行标签转储对比：**仅 1 个标签改变** ——
  `DoInitAction (sid: 61775)`，`len 2320 → 2902`（+582 字节，与 FileLength 增量精确吻合）

### 6.2 SWF 能重新保存 —— **已证明**

解压→重压缩往返后标签转储**字节完全一致**（SHA-256 `AEDBD7D3…`）；
独立解析器确认 71,378 个标签、`End` 有效、尾部 0 字节残留。
`FileLength` 声明值 150,847,814 精确保留（LZMA），存储大小 125,442,502 → 128,688,308（+2.59%）。

### 6.3 游戏运行通过 —— **未验证**

**本环境无法运行 Flash Projector，因此没有启动过游戏。**
需要你在本机执行验证，步骤见第 10 节。

### 6.4 EXE 重新打包 —— **未打通**

`kofwing/21256864.swf` 与 `EXE[21,256,864..EOF]` **字节完全一致**，
即主影片精确占据 EXE 末尾。但要替换它，需要同时满足（**7 项均未验证**）：

1. Projector 尾部定位结构的准确格式
2. 新的 LZMA 流能否被 Flash 运行时接受
3. `FileLength` 与存储长度的关系处理
4. 是否存在校验和
5. 替换后资源是否仍能按相对路径加载（`char/`、`stage/`、`sound/`）
6. Flash 运行时对 SWF v15 LZMA 的支持边界
7. Projector 是否校验主影片长度

**不要直接对 EXE 做字节替换。**

### 6.5 是否需要 Flash Professional CS6

| 操作 | 需要 CS6？ |
|---|---|
| 修改 AS1/AS2 脚本逻辑 | **不需要** —— JPEXS 已证明可行 |
| 改常量、开关、字符串 | **不需要** |
| 改 `list.txt`、替换 MP3/SWF 资源 | **不需要** |
| 编辑时间轴、图层、元件结构 | 需要，或接受 JPEXS 的 FLA/XFL **近似还原**（非原工程） |
| 重新打包 Projector EXE | 可能需要，且**未验证** |

---

## 7. 结论六：新增内容需要动哪些地方

### 新增角色

1. `data/skillList.swf` —— 加一个 `new XML("<char>…</char>")` 变量，命名 `<角色><模式>`
2. `char/<角色>.swf` —— 角色模块；若走内联路线则改为在主影片加 `<角色>_role.as` / `_AI*.as`
3. `frame_1629:3348` `cpuNormal_list` —— 加入名册
4. `frame_1629:730` `["Kim","Nameless","Moriya","Andy"]` —— **仅当走外部加载路径时需要加**
5. `sound/list.txt` + `stage/list.txt` —— BGM 与专属舞台

### 新增/修改招式

1. **出招表**（显示层）：`data/skillList.swf` 的内联 XML
2. **实际执行**：`<角色>_role.as` 的 `toSkill` 分派器
3. **判定/伤害**：`HitCheck.as` + `<角色>_AI.as:checkMustDefendSkill()`
4. **⚠️ 不要动** `frame_1629:3374-3382` 的 `mustDefendSkill` —— 死代码

### 新增 Stage

1. SWF 导出全局 `bgArray`（`{isBmd, mc, v_rate, isBase}`），83 个现有 Stage 全部遵循此契约
2. `stage/list.txt` 的 `stageBG=` 候选池加入文件名
3. 若为角色专属，同时加 `&角色=地图&` 绑定

---

## 8. 结论七：需要你手动验证的事项

| # | 验证内容 | 方法 |
|---|---|---|
| V1 | `char/` 是否存在 | 查游戏根目录 `char\Kim.swf` 等；比对 SHA-256 与 `file_inventory.csv` |
| V2 | Kim/Nameless/Moriya/Andy 能否正常对战 | 进游戏选这 4 人各打一局；若这 4 人坏了而其余 21 人正常，则确认内嵌包是死代码 |
| V3 | JPEXS 改后的 SWF 能否运行 | 拿 `experiments/` 里的 `edited.swf`，配合完整 `char/`、`stage/`、`sound/` 目录实测 |
| V4 | Stage 配置是否为设计意图 | 见第 3 节 S1/S2 的三种可能 |
| V5 | `stage2/` 是否应复制进 `stage/` | 同上，先只复制 1 个文件试 |
| V6 | `code.swf` 的作用 | 代码里加载后完全未使用；实机观察是否影响启动 |
| V7 | `musicNum=50` 与文件数不符是否正常 | 已知无代码消费者，实机验证即可确认 |
| V8 | `fscommand("exec","changedisplay1.exe")` 的外部程序 | 这两个 EXE 不在游戏目录中，需查明来源 |
| V9 | 原版 `stage/` `sound/` 资源补回 | 补回后跑 `python tools/parse_registries.py <root> reports` 补齐文件侧校验 |

---

## 9. JPEXS CLI 已知问题（实测发现的坑）

1. **`-compress` 参数顺序与自身 `-help` 矛盾** —— 实际是 `-compress <method> <infile> <outfile>`，
   method 在前。
2. **`-compress` 失败时仍返回退出码 0** —— 不能以退出码判断成功，必须验证产物。
3. **`-dumpSWF` 的行数不等于标签数** —— 它会递归进嵌套 Sprite 并复用索引，
   本例输出 553,260 行但真实标签数为 71,378。
4. **`-replace <scriptName>` 的命名规则未确定** —— 4 种候选写法均被拒，
   改用已验证的 `-importScript` 路径。
5. JPEXS 控制台输出**非 ASCII 路径会乱码**（`ȭ��`），但不影响文件读写。

---

## 10. 剩余问题清单（按优先级）

### 🔴 必须先解决

| 问题 | 说明 |
|---|---|
| 游戏目录不完整 | `stage/` `stage2/` `sound/` 资源缺失，`char/` `code.swf` `stage/weather/` 未找到 |
| 无法运行验证 | 本环境不能启动 Flash Projector，所有运行期结论均未证实 |
| 清单溯源已断 | `_struct.json` 记录的是最初提取物（主程序 125,450,217 B），磁盘上是重新切出的 125,442,502 B。**不要重跑 `swf_struct.py`**，否则会覆盖这条历史记录 |

### 🟡 可以安全实验

| 问题 | 说明 |
|---|---|
| JPEXS 脚本编辑 | 已在副本上证明可行，可继续在实验目录做低风险改动 |
| 出招表编辑 | `data/skillList.swf` 已找回并解析，结构完全已知，是最安全的改动目标 |
| `list.txt` 调整 | 纯文本，但**当前 `stage/` `sound/` 是你的修改版**，先确认基线 |
| `out()` 调试插桩 | `frame_1629:720` 函数体为空，零行为风险 |

### 🟢 仅影响特定资源

| 问题 | 说明 |
|---|---|
| Stage 绑定失效 | 只影响那 19+7 个绑定，不影响其余角色 |
| `musicNum` 不一致 | 无代码消费者，不影响运行 |
| 扩展名大小写 | 只在区分大小写的系统上暴露 |
| 内嵌包是否同步修改 | 引擎副本差异仅 1–9 行，实际影响极小 |

### 🔵 需要你提供额外文件

| 问题 | 需要什么 |
|---|---|
| `char/` 的真实形态 | `char\Kim.swf` 等 4 个文件 |
| `code.swf` 的功能 | 该文件本体 |
| Stage 天气覆盖 | `stage/weather/*.swf` |
| 原版资源基线 | 完整的 `stage/` `stage2/` `sound/` |
| `changedisplay*.exe` | 这两个被 `fscommand` 调用的外部程序 |

---

## 11. 仓库状态与复现

```
_reverse/
├── tools/          分析管线（Python 3.11，仅标准库）
├── tests/          46 个自动化测试
├── experiments/    JPEXS 流程实验（work/logs 已 gitignore，约 978 MB）
├── analysis/       每个 SWF 的元数据、脚本、资源索引
└── reports/        全部报告
```

- `experiments/work/` `experiments/logs/` 共 978 MB / 27,177 文件，**已 gitignore**，
  可由实验脚本重新生成；`experiments/tools/` `experiments/help/` 保留以便复现。
- 跑测试：`python -m unittest discover -s tests -t .`

**重要：本仓库不包含原始 EXE、游戏安装包或重复资源副本。**