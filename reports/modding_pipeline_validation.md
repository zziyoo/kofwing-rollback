# JPEXS 改写-重编译流程 实测验证报告

**验证对象**：`kofwing\21256864.swf`（125,442,502 字节，ZWS/LZMA 压缩，SWF v15）
**工具**：JPEXS Free Flash Decompiler 26.3.0 nightly build 3573（`D:\swf解包\ffdec.jar`）
**运行时**：Java 17.0.14，全部命令使用 `-Xmx3g`
**日期**：2026-10-10
**沙箱**：所有操作均在 `_reverse\experiments\` 内的副本上进行

> **原始数据只读声明**：`D:\拳皇\拳皇WingEX1.2前瞻版` 下的游戏数据（含 `kofwing\*.swf` 与 `wingex1.2.exe`）**未被修改、未被删除**。
> 本次全部实验均在 `experiments\work\` 的副本上完成，且**全程未尝试任何删除操作**（本环境已封锁删除）。

---

## 结论速览

| # | 命题 | 判定 | 依据强度 |
|---|---|---|---|
| 1 | 脚本能修改 | **已证实（PROVEN）** | 27,122 个脚本中仅 1 个改变，重开 SWF 后改动仍在 |
| 2 | SWF 能重新保存 | **已证实（PROVEN）** | 两套独立校验均显示 tag 流逐字节一致、End 标签有效 |
| 3 | 游戏运行通过 | **无法验证（UNVERIFIED）** | 未启动游戏；必须由使用者手动完成 |

**三者是严格分离的**：第 1、2 条成立**不代表**第 3 条成立。

---

## 一、脚本能修改（PROVEN — 已证实）

### 1.1 结论

在 AS2 源码层面**确实可以做到"改一个字符串 → 重新编译回 SWF → 重新打开仍能读出改动"**。
JPEXS 的 AS2 源码重导入机制是**真实可用**的，不是猜测。

### 1.2 使用的真实机制（实测确认，非假设）

| 机制 | 结果 |
|---|---|
| `-importScript <infile> <outfile> <scriptsfolder>` | ✅ **可用，已端到端验证** |
| `-replace <infile> <outfile> <scriptName> <file.as>` | ❌ 对主时间轴脚本不可用（4 种命名均被拒绝） |

`-importScript` 的实测行为：第三个参数传**包含 `scripts\` 子目录的父目录**，JPEXS 会自动拼接 `\scripts`
（控制台输出：`Using the directory: ...\big_edit\scripts`）。只放**一个** `.as` 文件即可，
JPEXS 按路径定位并**只替换该脚本**，其余 27,121 个脚本不受影响。

`-replace` 失败的实测输出（4 次尝试全部如此）：

```
frame 1/DoAction is not recognized as a CharacterId or a script name.
frame_1/DoAction is not recognized as a CharacterId or a script name.
DoAction is not recognized as a CharacterId or a script name.
\frame 1 - DoAction is not recognized as a CharacterId or a script name.
```

→ **`<scriptName>` 的正确取值未能确定**，因此本报告不宣称 `-replace` 可用。

### 1.3 编辑目标（刻意选择零战斗影响的点）

| 项 | 值 |
|---|---|
| 脚本路径 | `scripts\__Packages\HitCounter.as` |
| 所属类 | `HitCounter extends MovieClip`（连击计数/喝彩文字覆盖层） |
| 行号 | 第 **55** 行 |
| 符号 | `this.hits_mc.praise_mc.hits_txt.text` |
| 原始字面量 | `"Perfect"` |
| 改为 | `"PerfectJPEXS"` |
| 性质 | **纯 UI 显示文本**。不涉及伤害、判定框、AI、角色表、碰撞或任何战斗规则 |

选择理由：`HitCounter` 是调试/训练用的连击计数器，其 praise 文本仅写入 `hits_txt.text`，
是整个 SWF 中"最容易验证 + 风险最低"的字符串常量之一。文件中 `"Perfect"` **仅出现 1 次**，无歧义。

### 1.4 编辑前后的 SHA-256 对照

| 阶段 | 文件 | 字节数 | SHA-256 |
|---|---|---|---|
| 编辑前 | `work\orig.swf`（= 原始 SWF 副本） | 125,442,502 | `847A0EC9FEBBD5826E2C056BC2A710B20E7468570876154B05BC07DC5C29E585` |
| 编辑后 | `work\edited.swf` | 125,449,801 | `8C8ED5F5C06E833974956A68F8760C504651FDD66A49F3970F7385AA2173E8B7` |
| 差值 | — | **+7,299** | 已改变 |

SWF 头内部声明长度同步变化：`FileLength` 150,847,814 → **150,848,396**（+582 字节，
即重编译后的 `DoAction` 变大了）。JPEXS 正确维护了该字段。

### 1.5 验证方式：**重新打开保存后的 SWF**（退出码 0 不作为证据）

对 `edited.swf` 再次用 JPEXS 执行 `-export script`，然后在**新导出的脚本树**中检索：

```
PerfectJPEXS occurrences = 1
  路径: edited_export\scripts\__Packages\HitCounter.as   行号: 55
  内容: this.hits_mc.praise_mc.hits_txt.text = "PerfectJPEXS";

bare "Perfect" occurrences = 0
```

→ 改动**确实写入了 SWF**，且旧字面量已消失。

### 1.6 全量脚本树对比：只有 1 个文件被改动

对 27,122 个 `.as` 逐个计算 SHA-256 后对比（`tools\compare_scripts.ps1`）：

```
baselineFiles   27122
candidateFiles  27122
identical       27121
changed         1        <- scripts\__Packages\HitCounter.as
onlyInBaseline  0
onlyInCandidate 0
```

→ **没有任何脚本丢失或被意外覆盖**，改动是外科手术式的。

### 1.7 AS2 重编译保真度

对**被改的那个文件本身**做逐行 diff（原始 vs 重新反编译），全文件仅 2 行不同：

```
<=   this.hits = this.hits + 1;        （原始）
=>   this.hits += 1;                   （重编译后）
<=   ...hits_txt.text = "Perfect";
=>   ...hits_txt.text = "PerfectJPEXS";   ← 本次有意修改
```

第二处是 JPEXS 编译器把 `a = a + 1` 编译为 Increment 指令、反编译回 `+=` 所致的**等价变体**，
不是语义变化。这说明 **AS2 源码 → 字节码 → 源码 的往返在本例中近乎无损**。

### 1.8 精确定位：整个 SWF 里只有一个 tag 被改写

对 `orig` 与 `edited` 两份 `-dumpSWF` 输出做**逐行比对**（各 553,260 行），
首个差异行精确指向唯一被修改的 tag：

```
07ccbfdc: 61329. DoInitAction (sid: 61775) tagId= 59  len = 2320   ← 原始
07ccbfdc: 61329. DoInitAction (sid: 61775) tagId= 59  len = 2902   ← 编辑后
                                    ↑ +582 字节
```

- 该 tag 位于**主时间轴**的 `DoInitAction`（sid 61775），正是承载 `HitCounter` 类的那个脚本块。
- **+582 字节与 SWF 头 `FileLength` 的增量（150,847,814 → 150,848,396）完全吻合**，
  说明 JPEXS 精确地把膨胀量落在了这一个 tag 上，长度字段自洽。
- 逐行比对共报出 20,940 行"不同"，其中**只有这 1 行是内容差异**；
  其余 20,939 行全部是这 582 字节导致的后续 tag **偏移量平移**（如 `07ccc8f2` → `07cccb38`）。
- tag 类型计数（41 种）**完全不变**，`End` 标签仍在原位且有效。

→ 改动是**单 tag、字节自洽、无附带损伤**的。

---

## 二、SWF 能重新保存（PROVEN — 已证实）

### 2.1 结论

**JPEXS 能在不引入结构性破坏的前提下重新保存这个 125 MB 的 LZMA SWF。**
本次用**两套互相独立**的校验确认，避免单一工具自证。

### 2.2 纯往返（无任何语义修改）：解压 → 重新压缩

```powershell
java -Xmx3g -jar D:\swf解包\ffdec.jar -decompress orig.swf dec.swf
java -Xmx3g -jar D:\swf解包\ffdec.jar -compress  lzma dec.swf recomp_lzma.swf
```

| 文件 | 签名 | 版本 | 声明 FileLength | 实际字节 | SHA-256 |
|---|---|---|---|---|---|
| `orig.swf` | ZWS | 15 | 150,847,814 | 125,442,502 | `847A0EC9…C29E585` |
| `dec.swf` | FWS | 15 | 150,847,814 | 150,847,814 | `9D9F59E3…7C9F033` |
| `recomp_lzma.swf` | ZWS | 15 | **150,847,814（保持一致）** | 128,688,308 | `D244012D…7FDC3F680` |

- `FileLength` 声明值在往返后**分毫不变**。
- 压缩后体积 125,442,502 → 128,688,308（**+3,245,806 / +2.59%**）：
  JPEXS 的 LZMA 编码参数与原作者不同，**体积会变，但内容不变**。

### 2.3 校验方法一：JPEXS 自己的 tag dump

```
orig_dump_sha256   = AEDBD7D3F6486CCF74CB0B3136496651E53FEB7460F55C7D2621D08AC62E0C69
recomp_dump_sha256 = AEDBD7D3F6486CCF74CB0B3136496651E53FEB7460F55C7D2621D08AC62E0C69
tag dumps byte-identical = True
```

两份 dump 各 57,340,623 字节，**逐字节完全相同**。tag 直方图 diff 结果为
`IDENTICAL: tag count and per-tag histogram match exactly`（41 种 tag 类型计数全等）。

tag 类型直方图（`logs\hist_orig.csv`；**计数含嵌套 sprite 内部 tag，故 ShowFrame 等数值远大于主时间轴的 71,378**）：

| tagId | 类型 | 计数 | tagId | 类型 | 计数 |
|---|---|---|---|---|---|
| 0 | End | 1 | 32 | DefineShape3 | 73 |
| 1 | ShowFrame | 310,204 | 33 | DefineText2 | 3 |
| 2 | DefineShape | 26,907 | 34 | DefineButton2 | 84 |
| 6 | DefineBits | 20 | 35 | DefineBitsJPEG3 | 879 |
| 8 | JPEGTables | 8 | 36 | DefineBitsLossless2 | 24,391 |
| 9 | SetBackgroundColor | 1 | 37 | DefineEditText | 237 |
| 11 | DefineText | 468 | 39 | DefineSprite | 6,733 |
| 12 | DoAction | 13,225 | 43 | FrameLabel | 6,298 |
| 14 | DefineSound | 1,292 | 45 | SoundStreamHead2 | 6,220 |
| 15 | StartSound | 3,687 | 46 | DefineMorphShape | 19 |
| 17 | DefineButtonSound | 15 | 48 | DefineFont2 | 1 |
| 18 | SoundStreamHead | 6 | 56 | ExportAssets | 2,105 |
| 19 | SoundStreamBlock | 2,282 | 59 | DoInitAction | 733 |
| 20 | DefineBitsLossless | 171 | 60 | DefineVideoStream | 1 |
| 21 | DefineBitsJPEG2 | 171 | 61 | VideoFrame | 1,106 |
| 22 | DefineShape2 | 176 | 69 | FileAttributes | 1 |
| **24** | **Protect** | **1** | 70 | PlaceObject3 | 2,310 |
| 26 | PlaceObject2 | 116,342 | 73 | DefineFontAlignZones | 214 |
| 28 | RemoveObject2 | 26,365 | 74 | CSMSettings | 156 |
| | | | 75 | DefineFont3 | 77 |
| | | | 83 | DefineShape4 | 79 |
| | | | 88 | DefineFontName | 198 |

> 注：原 SWF 第 3 个 tag 是 **`Protect`（tagId 24）**，即带有"禁止编辑"标记。
> JPEXS 在往返与重保存后该标签**依然存在且计数为 1**，未被剥离。

### 2.4 校验方法二：自写 SWF tag 流解析器（不依赖 JPEXS）

`tools\swfwalk.ps1` 直接解析未压缩 tag 流，确认能走到合法 End 标签且不越界：

| 指标 | 原始（dec.swf） | 纯往返（dec2.swf） | 编辑后（edited_dec.swf） |
|---|---|---|---|
| 声明长度 | 150,847,814 | 150,847,814 | 150,848,396 |
| 实际长度 | 150,847,814 | 150,847,814 | 150,848,396 |
| 帧率 | 35 | 35 | 35 |
| 帧数 | 1664 | 1664 | 1664 |
| **走过的 tag 数** | **71,378** | **71,378** | **71,378** |
| **到达 End 标签** | **True** | **True** | **True** |
| 越过声明长度 | False | False | False |
| End 之后剩余字节 | **0** | **0** | **0** |
| tag 编码序列 MD5 | `4A9D8EB0…E7BEAD63` | `4A9D8EB0…E7BEAD63` | `4A9D8EB0…E7BEAD63` |

→ 三者的 **tag 数量、顺序、编码序列全部一致**，且都能干净地终止在 End 标签上。

### 2.5 ⚠️ 一个必须记录的 JPEXS 输出陷阱

`-dumpSWF` 的输出行数是 **553,260**，但**真实的主时间轴 tag 数是 71,378**。
原因是 JPEXS 的 dumper 会**递归进入 DefineSprite/DefineButton2 并重复打印嵌套 tag，且索引会被复用**
（实测 `minIdx=0`, `maxIdx=71377`, `distinct=0 1 2 3 4 5 6 7…`）。

→ **不要把 `-dumpSWF` 的行数当作 SWF 的 tag 数**。若要拿 tag 数，请用自写解析器或以索引上限为准。

---

## 三、游戏运行通过（UNVERIFIED — 无法验证）

### 3.1 结论

**本项完全没有验证，也无法在本次范围内验证。**
本环境未启动 `wingex1.2.exe`，未加载任何游戏资源，未进行任何一帧游戏画面的确认。

必须明确区分：

- 第二节证明的是"**产出的字节流在结构上仍然是一个合法 SWF**"。
- 这**不等于** Flash 播放器（更不等于这个魔改版 Projector）会**接受**它。
- 重新编译的字节码**从未被 AVM2/AVM1 实际执行过**，其运行时行为完全未知。
- 本次修改的 `HitCounter` 仅是显示文本，尚属低风险；**若改动涉及战斗逻辑，风险不可类比**。

### 3.2 使用者必须手动执行的验证步骤

> 下列步骤会**写入/覆盖 EXE**，请勿在原始 `wingex1.2.exe` 上操作，先做备份。

**步骤 0 — 备份**

1. 完整复制一份 `wingex1.2.exe` 与整个 `kofwing\` 目录，作为可回滚的基线。

**步骤 1 — 先单独验证改后的 SWF 能否被播放器直接加载（推荐先做这一步，成本最低）**

2. 用 `experiments\work\edited.swf` 替换（或改名覆盖）游戏 `kofwing\21256864.swf`。
3. 启动游戏，观察是否进入标题画面。
4. 进入训练/对战，让连击数达到 120，确认 praise 文本显示为 `PerfectJPEXS`。
   - 这是**唯一能证明"脚本改动生效"的运行时证据**。
   - 若显示仍是 `Perfect`，说明该 SWF 未被真正加载（可能是从 Projector 内嵌副本读取的，见第四节）。

**步骤 2 — 若步骤 1 无法生效（很可能的预期结果）**

5. 说明 Projector **不读取外部** `kofwing\*.swf`，而是直接运行**内嵌在 EXE 里的那份**。
6. 这时才进入 EXE 重建，参见第四节。**注意第四节所列前提尚未验证，重建前请先读完"未验证清单"。**

**步骤 3 — 回归检查（无论步骤 1 或 2 成功，都要做）**

7. 确认能正常选人、进入关卡、对战、结算、存读档。
8. 确认无异常报错（用 Projector 自带的调试输出或 Fiddler/进程监视观察是否有解码错误）。

---

## 四、EXE 重建问题（仅调查，未尝试任何字节级补丁）

### 4.1 已验证的事实（有实测证据）

| 事实 | 证据 |
|---|---|
| `wingex1.2.exe` 总长 | **146,699,366** 字节 |
| 内嵌启动 SWF 偏移 | **21,256,864** |
| 内嵌 SWF 存储长度 | 125,442,502 字节 |
| 21,256,864 + 125,442,502 | = 146,699,366 = EXE 总长 → **SWF 恰好延伸到文件末尾，其后没有任何尾部/trailer** |
| `kofwing\21256864.swf` 与 EXE 内嵌区域 | **SHA-256 完全相同**（实测哈希 `EXE[21256864..EOF]` = `847A0EC9…C29E585`），确认二者是同一份字节 |
| SWF 签名/版本 | `ZWS`（LZMA），version **15** |
| 头内 `FileLength` | **150,847,814**（未压缩长度） |
| 头内 `CompressedLength` 字段 | **125,442,477** |
| SWF 起始前 4 字节 | `79 00 00 00`（不像长度指针；更像 PE 段/填充，**未解读**） |

**关键矛盾（这是第四节的核心）**：声明长度 150,847,814 与存储长度 125,442,502 **相差 25,405,312 字节**。
因为是 LZMA 压缩，**存储长度 ≠ 声明长度**。因此"用重建的 SWF 覆盖原位置"在字节层面**不成立**。

### 4.2 若要替换内嵌 SWF，理论上必须改变的东西

1. **SWF 头 `FileLength`**：必须更新为新 SWF 的真实未压缩长度（JPEXS 会自动维护，本次已验证）。
2. **SWF 头 `CompressedLength`**：同理需与新的 LZMA 流长度一致。
3. **LZMA 流本身**：JPEXS 产出的 LZMA 流与原作者的编码器不同（体积 +2.59%），
   **是否被该 Projector 内核的解压器接受，未验证**。
4. **EXE 总长度 / 文件布局**：新旧 SWF 长度不同 ⇒ 覆盖式写入不可行。
   只能重建 EXE（前 21,256,864 字节 + 新 SWF），或调整文件末尾结构。
5. **Projector 定位启动 SWF 的方式**：是按固定偏移、按尾部魔数扫描、还是按某个长度字段？
   **完全未验证。**
6. **对齐/填充**：SWF 前那 3 个 `00` 字节的性质与新布局是否需要保持一致，未验证。

### 4.3 ❌ 明确未验证的前提条件（不要假设已具备）

- [ ] 该 Projector 用什么机制定位内嵌 SWF（偏移？魔数？长度字段？）
- [ ] EXE 前 21,256,864 字节内是否**存在**指向 SWF 的偏移/长度/校验字段（**未做完整 PE 结构扫描**）
- [ ] JPEXS 的 LZMA 输出能否被该播放器内核解压器正确解压
- [ ] 该播放器内核是否接受 SWF v15 + LZMA 的组合在**重新生成**后仍然有效
- [ ] Projector 尾部是否需要保留某些标记（本例中 SWF 已到 EOF，看似无尾部，但**未确认播放器是否依赖 EOF 偏移**）
- [ ] 重建后是否需要同步修改 EXE 中其他与 SWF 体积相关的字段
- [ ] 125 MB 级别 SWF 在该播放器中的内存/加载表现是否可接受

**因此：目前不存在一条已被验证可用的 EXE 重建流水线。**

---

## 五、可复现命令序列（逐字，可直接重跑）

前置：PowerShell 中 `$exp = 'D:\拳皇\拳皇WingEX1.2前瞻版\_reverse\experiments'`

```powershell
# 0) 准备副本（绝不碰原文件）
Copy-Item 'D:\拳皇\拳皇WingEX1.2前瞻版\kofwing\21256864.swf' "$exp\work\orig.swf"
Get-FileHash "$exp\work\orig.swf" -Algorithm SHA256      # 应为 847A0EC9…C29E585

# 1) 读取真实 CLI 帮助（不要凭记忆猜参数）
java -jar 'D:\swf解包\ffdec.jar' -help
java -jar 'D:\swf解包\ffdec.jar' -help importScript
java -jar 'D:\swf解包\ffdec.jar' -help compress

# ---------- 第二节：往返保真 ----------
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -dumpSWF    "$exp\work\orig.swf"
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -decompress "$exp\work\orig.swf" "$exp\work\dec.swf"
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -compress lzma "$exp\work\dec.swf" "$exp\work\recomp_lzma.swf"
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -dumpSWF    "$exp\work\recomp_lzma.swf"

# ---------- 第一节：脚本修改 ----------
# 构造编辑目录：只放要改的脚本，路径须与导出树一致
#   $exp\work\big_edit\scripts\__Packages\HitCounter.as
# 然后：
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -importScript "$exp\work\orig.swf" "$exp\work\edited.swf" "$exp\work\big_edit"

# 验证（必须重新打开，不能只看退出码）
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -export script "$exp\work\edited_export" "$exp\work\edited.swf"
Select-String -Path "$exp\work\edited_export\scripts\__Packages\HitCounter.as" -Pattern 'PerfectJPEXS'

# ---------- 独立结构校验（自写工具，不用 JPEXS）----------
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -decompress "$exp\work\edited.swf" "$exp\work\edited_dec.swf"
& "$exp\tools\swfwalk.ps1"        -Swf "$exp\work\edited_dec.swf" -OutCsv "$exp\logs\walk_edited.csv" -OutSummary "$exp\logs\walk_edited.txt"
& "$exp\tools\swfheader.ps1"      "$exp\work\orig.swf"
& "$exp\tools\compare_scripts.ps1" -A '<基线脚本树>' -B "$exp\work\edited_export" -OutReport "$exp\logs\script_diff.txt"

# ---------- 第三节：能力探测（在 40 KB 小 SWF 上做，代价低）----------
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -export fla "$exp\work\probe_fla" "$exp\work\small_6148152.swf"
java -Xmx3g -jar 'D:\swf解包\ffdec.jar' -export xfl "$exp\work\probe_xfl" "$exp\work\small_6148152.swf"
```

---

## 六、JPEXS 工具本身的坑（实测踩到，务必记录）

### 6.1 ⚠️ `-compress` 的参数顺序与帮助文档不符，且失败时返回 0

帮助文档写的是：`-compress <infile> <outfile> [(zlib|lzma)]`
**实测这是错的**。真实可用的顺序是**压缩方式在前**：

```powershell
# 文档写法 → 失败，且退出码是 0（假成功）
java -jar ffdec.jar -compress <in> <out> lzma
#   实际输出: Unsupported compression method: <in> 的路径
#   实际结果: 未生成输出文件，退出码 0   ← 极易误判为成功

# 正确写法
java -jar ffdec.jar -compress lzma <in> <out>
#   实际输出: OK
```

> **教训：`-compress` 的退出码 0 不代表成功，必须检查输出文件是否真的生成。**
> 本报告全程遵守"退出码 0 不作为证据"这一原则。

### 6.2 `-replace` 的 `<scriptName>` 未能确定

主时间轴脚本的 4 种常见命名均被拒绝（详见 1.2）。本次改用 `-importScript`，不依赖 `-replace`。

### 6.3 控制台对非 ASCII 路径显示为乱码

JPEXS 控制台把中文路径输出成 `D:\ȭ��\ȭ��WingEX1.2ǰհ��\...`。
**这只是显示层字符集问题，落盘文件名与内容均正确**。但任何依赖解析控制台路径的自动化脚本都会被误导。

### 6.4 `-dumpSWF` 行数 ≠ tag 数

详见 2.5。

---

## 七、产物清单（本次新增，均在本人负责范围内）

```
_reverse\experiments\
├── help\                      各命令 -help 原文存档（compress/decompress/replace/
│                              importScript/export/dumpSWF/header/xml2swf/…）
├── logs\
│   ├── dumpSWF_orig.txt       原始 SWF tag dump（57,340,623 字节）
│   ├── dumpSWF_recomp.txt     纯往返后 tag dump（与上者逐字节相同）
│   ├── dumpSWF_edited.txt     编辑后 tag dump
│   ├── hist_orig.csv          tag 直方图
│   ├── hist_recomp.csv        tag 直方图（与上者一致）
│   ├── hist_edited.csv        编辑后 tag 直方图（类型计数同样一致）
│   ├── walk_dec.txt           自写解析器结果（原始结构）
│   ├── walk_dec2.txt          自写解析器结果（纯往返后）
│   ├── walk_edited.txt        自写解析器结果（编辑后）
│   ├── script_diff.txt        27,122 个脚本的逐文件对比结果
│   └── export_edited.log      重导出日志
├── tools\
│   ├── swfheader.ps1          独立 SWF 头解析器（处理 FWS/CWS/ZWS 三种容器）
│   ├── swfwalk.ps1            独立 tag 流解析器（验证 End 标签与边界）
│   ├── tagstats.ps1           JPEXS dump 的 tag 直方图/序列指纹
│   └── compare_scripts.ps1    两棵脚本树的逐文件 SHA-256 对比
└── work\                      全部实验副本（orig/dec/recomp/edited 等）
```

> ⚠️ **需要维护者处理**：`experiments\` 当前共 **27,177 个文件 / 约 0.95 GB**
> （其中 `work\` 848 MB、`logs\` 177 MB），且**未被 `.gitignore` 覆盖**，当前处于 untracked 状态。
> `git status` 会把它们全部列为待添加项。
> 本环境的删除操作已被封锁，因此**我无法自行清理**。
> 建议由维护者决定：将 `experiments\` 加入 `.gitignore`，或择机删除其中体积最大的中间产物
> （`work\dec.swf`、`work\dec2.swf`、`work\edited_dec.swf` 三个各约 150 MB 的解压文件，
> 以及 `work\edited_export\` 的 27,122 个重导出脚本）。

---

## 八、明确未验证清单（汇总）

1. **游戏是否真的能正常启动、选人、对战、结算** —— 完全未验证（第三节）。
2. **改后的 `PerfectJPEXS` 是否真的在游戏里显示出来** —— 未验证。
3. **Projector 是否读取外部 `kofwing\*.swf`，还是只跑 EXE 内嵌副本** —— 未验证，且这直接决定后续路线。
4. **EXE 重建的任何一环** —— 未验证（第四节 4.3 的 7 项）。
5. **`-export fla` / `-export xfl` 在 125 MB 这个 SWF 上是否可用** —— 仅在 40 KB 的
   `kofwing\6148152.swf` 上验证成功；大文件（150 MB 解压、27,122 个脚本）**未测试**，
   预计耗时长且内存/磁盘开销大。
6. **修改战斗逻辑（伤害、判定、AI、角色表）后能否正常运行** —— 本次只改了纯显示文本，
   更敏感的改动**风险不可类比**，需要单独评估与实测。
7. **重新编译的字节码在真实 AVM 运行时中的行为** —— 从未执行过。
8. **`-replace` 机制**在本 SWF 上的可用性 —— 未确立。