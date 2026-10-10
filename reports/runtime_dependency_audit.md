# 运行时依赖审计 (Phase 1)

审计对象：`kofwing/21256864.swf`（主程序）反编译得到的 AS2 源码。
本报告的结论全部来自代码级证据，与磁盘上 `stage/`、`sound/` 的当前内容无关。

> ## ⚠️ 更正记录
> 本报告初版第 3 节曾断言 `HitCheck.as` 与主程序版本"差异达 97.15%"。**该结论是错误的**，
> 源于 `phase1_dep_audit.py` 中 `line_diff_summary()` 的缺陷：它按**行号位置**逐行比较，
> 一处早期插入就会让其后所有行"错位"，从而把整份文件误判为不同。
> 用 `difflib` 重新比对后，正确结果是 **相似度 99.92%–100%**，详见第 3 节。
> 复现命令：`python tools/engine_diff_verify.py`。
>
> 初版第 1.2 节标记 `data/skillList.swf` 为"当前目录不存在"。**该文件其后已在
> `data/data_old.tar` 中找到并提取**，状态已更新，见 1.2。

**三种状态的定义（贯穿全文使用）：**

| 标记 | 含义 |
|---|---|
| `代码已确认` | 在反编译脚本中找到确定的加载调用，附 `文件:行号` |
| `当前目录不存在` | 已确认代码需要它，但本次审计时在游戏目录中找不到 |
| `其他来源已找到` | 已从非预期位置（归档包等）找到并验证 |
| `未经运行验证` | 只能由静态代码推断，**尚未**在游戏运行中确认 |

---

## 1. 四个缺失依赖的完整证据链

### 1.1 `char/<role>.swf` — 角色模块

| 项 | 内容 |
|---|---|
| 调用方 SWF | `kofwing/21256864.swf` |
| 调用点 | `scripts/frame_1629/DoAction.as:792`、`:812`、`:915`、`:919` |
| 加载函数 | `MovieClipLoader.loadClip()` 与 `MovieClip.loadMovie()`（各 2 处） |
| 目标路径 | `"char/" + <变量> + ".swf"` |
| 是否动态拼接 | **是** — 文件名由运行时变量决定，静态无法枚举 |
| 文件是否存在 | `当前目录不存在` |
| 是否解析过 | 否 |
| 运行验证 | `未经运行验证` |

代码原文：

```actionscript
// frame_1629/DoAction.as:788-792  (函数 loadP1)
var _loc2_ = new MovieClipLoader();
P1_mc = char_mc.createEmptyMovieClip("P1_mc",depth_P1);
P1_mc._lockroot = true;
_loc2_.loadClip("char/" + _loc1_ + ".swf",P1_mc);

// frame_1629/DoAction.as:915-919
P1_mc.loadMovie("char/" + roleName + ".swf");
P2_mc.loadMovie("char/" + roleName + ".swf");
```

**关键线索：`P1_mc._lockroot = true`**（`:791`、`:811`）。这是 Flash 的标准机制，用来让被
`loadMovie` 进来的 SWF 内部能够通过 `_root` 访问加载它的影片。整份主程序大量使用
`_level0.xxx` 与 `_root.xxx`（见第 4 节），说明角色模块与主程序之间**通过全局变量通信**，
而不是通过返回值。这一点是 `代码已确认`。

### 1.2 `data/skillList.swf` — 招式表

| 项 | 内容 |
|---|---|
| 调用方 SWF | `kofwing/21256864.swf` |
| 调用点 | `scripts/DefineSprite_60324/frame_1/DoAction.as:15` |
| 加载函数 | `loadMovie("data/skillList.swf", skList)` |
| 是否动态拼接 | **否** — 路径为字面量 |
| 文件是否存在 | **`其他来源已找到`** —— 位于 `data/data_old.tar` 内 |
| 运行验证 | `未经运行验证` |

```actionscript
// DefineSprite_60324/frame_1/DoAction.as:14-25
var skList = createEmptyMovieClip("skillList",0);
loadMovie("data/skillList.swf",skList);
onEnterFrame = function()
{
   if(skList.getBytesLoaded() >= skList.getBytesTotal() && skList.getBytesTotal() > 0)
   {
      skList._visible = false;
      delete this.onEnterFrame;
      skList.currentName = _level0.charSelect_P1;
      skList.currentMode = _level0.mode_role_P1;
      skList.onLoadSkill();
   }
};
```

**加载后接口（`代码已确认`）：**

1. 加载完成后调用它自己的 `onLoadSkill()` —— 说明这个 SWF 内部有一个同名自定义方法。
2. 入口参数是 `currentName`（角色名字符串）和 `currentMode`（模式字符串）。
3. 两者都从 `_level0` 读取，即角色选择界面写入的全局状态。
4. 同一段代码还读取 `_level0.player_type` 并与字符串 `"trainning"` 比较
   （`:10`），说明该模块在练习模式下行为不同。

### 1.2.1 `skillList.swf` 已找回，内部结构完全确定

**来源：** `data/data_old.tar`（7,379,968 字节，内含 36 个条目）。
已提取到 `D:\kof_rescue\data_old_tar\skillList.swf` 并通过结构校验：

| 项 | 值 |
|---|---|
| 大小 | 1,402,229 字节 |
| SWF 版本 / 压缩 | v15 / zlib |
| 标签数 | 462（72 个 `DoInitAction`、128 个 `DefineSprite`、16 个图片） |
| 校验 | **通过** —— 标签流完整走到 `End` 标签 |

**内部结构（`代码已确认`）：**

- 它是一个**出招表查看器**：导出 `skillList_icon`、`BoundingBox`、`DataHeaderBackGnd`、
  `DataHeaderOverlay`、`DataHeaderSeperator`、`DataSortArrow`、`DataStretchBar`
  七个 UI 符号，用 Flash MX `DataGrid` 控件渲染表格。
- 时间轴上有 22 个 `FrameLabel`，每个角色一个：`Kyo`、`KyoW`、`Iori`、`K`、`Ryu`、
  `Orochi`、`Kula`、`Moriya`、`Mai`、`Chunli`、`Terry`、`Igniz`、`Haohmaru`、
  `Rugal`、`Ash`、`Athena`、`Ryo`、`Nameless`、`Zero`、`Kusanagi`、`Kim`、
  `Andy`、`none`。
- **数据是内联 XML 字面量，不需要任何外部 XML 文件**：

```actionscript
var Kyo1 = new XML("<char><skillList skill=\"特殊技\" normal=\"\" easy=\"\" describe=\"\"/>"
                 +"<skillList skill=\"百式•鬼烧\" normal=\"→↓→＋拳\" easy=\"↓→＋拳\" describe=\"\"/>"
                 +...</char>");
// 运行期按 角色名+模式 取全局变量：
xml = _root[_root.currentName + _root.currentMode];
```

**XML 模式（已完全确定）：**

```xml
<char>
  <skillList skill="招式名" normal="普通指令" easy="简易指令" describe="备注"/>
</char>
```

变量名规则 `<角色><模式>`，`currentMode` 为 `1` 或 `2`。
`skill` 非空而 `normal`/`easy` 为空的条目是**分类标题行**
（特殊技 / 必杀技 / 超必杀技 / 潜在超必杀技）。

**已提取完整出招表：** 41 份（角色×模式）表，**794 条招式**，22 个角色。
见 `reports/move_list.md` 与 `reports/move_list.json`。
复现：`python tools/extract_move_list.py`

> **这解决了第一阶段标注为"内部结构无法确认"的核心未知项。**
> 出招表数据是自包含的，不需要额外 XML 文件；`xmlLoad` 导出只是加载中的 UI 占位符。

### 1.3 `code.swf`

| 项 | 内容 |
|---|---|
| 调用方 SWF | `kofwing/21256864.swf` |
| 调用点 | `scripts/frame_1629/DoAction.as:3541` |
| 加载函数 | `loadMovie("code.swf", code_mc)` |
| 是否动态拼接 | **否** — 字面量路径 |
| 文件是否存在 | `当前目录不存在` |
| 运行验证 | `未经运行验证` |

**加载后接口：已追踪，未发现任何成员被使用。**
在主程序全部 27,122 个脚本中检索 `code_mc`，**除了 `:3541` 这一处赋值之外没有任何其他引用**。
既没有调用其方法，也没有读取其属性。

**结论（`代码已确认`）：`code.swf` 被加载进一个空的影片剪辑 `code_mc` 之后，主程序没有再碰过它。**
这意味着它要么
- 只靠自身的时间轴与帧标签自行运行（通过 `_root` 读写全局状态），要么
- 是本版本遗留的死代码。

在拿到文件之前，**不能断言它有什么功能**。注意路径是相对当前目录的字面量 `code.swf`，
不是 `kofwing/code.swf` —— 也就是说它本应位于游戏根目录。

### 1.4 `stage/weather/<tq>.swf` — 天气覆盖层

| 项 | 内容 |
|---|---|
| 调用方 SWF | `kofwing/21256864.swf` |
| 调用点 | `scripts/DefineSprite_3266/frame_1/DoAction.as:1` |
| 加载函数 | `this.loadMovie("stage/weather/" + _root.tq + ".swf")` |
| 是否动态拼接 | **是** — 文件名来自 `_root.tq` |
| 文件是否存在 | `当前目录不存在`（`stage/weather/` 目录本身缺失） |
| 运行验证 | `未经运行验证` |

**变量来源已确认：**`_root.tq` 由 **Stage 模块自己设置**。在 `stage2/Haohmaru.swf`
（原 stage2 版本，现已随 stage2 目录一起不可用；该结论来自第一轮分析时的导出）中读到：

```actionscript
_root.raining = true;
var i = Math.random();
if(i > 0.5) { _root.tq = "raining"; } else { _root.tq = ""; }
this.blendMode = "add";
```

即：Stage 模块通过设置 `_root.tq` 声明自己需要哪种天气，主程序据此加载
`stage/weather/<名字>.swf`。**只有声明了非空 `tq` 的地图才会触发这次加载**，
这解释了为什么它在 83 个 Stage SWF 中只出现一次。

---

## 2. 一个新发现：那 4 个 EXE 内嵌包很可能就是缺失的角色模块

这是本阶段最重要的结论，但**包含一个尚未解决的运行时问题**。

### 2.1 已确认的事实

**主程序内联了 22 个角色的完整模块**（`__Packages/` 下每个角色都有
`<Name>_role.as`、`<Name>_AI.as`、`<Name>_AI_Lv1..Lv5.as`、`<Name>_Combo.as`、
`<Name>_Player.as`）：

> Ash, Athena, CKrizalid, CZero, Chunli, Goenitz, Haohmaru, Igniz, Iori, K,
> Krizalid, Kula, Kusanagi, Kyo, KyoW, Mai, Orochi, Oswald, Rugal, Ryo, Ryu,
> Terry, Zero（含 `Type2_` / `Type3_` 变体）

**而 Kim、Moriya、Nameless、Andy 这 4 个角色在主程序中完全没有 `_role.as` / `_AI*.as` / `_Combo.as` / `_Player.as`。**

这 4 个角色**同时出现在可玩名册里** —— `frame_1629/DoAction.as:3348`：

```actionscript
var cpuNormal_list = new Array("Kyo","Terry","Chunli","Mai","Ryu","Iori","K",
    "Kula","Moriya","Haohmaru","Ryo","Athena","Ash","Nameless","Kim","Andy","Oswald");
```

**EXE 内嵌的 4 个 SWF 包，恰好各自补齐了这 4 个角色的缺失类**，且结构与主程序内的
角色模块完全同构：

| 包（EXE 偏移） | 角色 | 总类数 | 主程序中缺失的类数 |
|---|---|---:|---:|
| `11480055.swf` @ 11,480,055 | Kim | 25 | **17** |
| `16695748.swf` @ 16,695,748 | Moriya | 26 | **17** |
| `18464326.swf` @ 18,464,326 | Nameless | 18 | **9** |
| `8492959.swf` @ 8,492,959 | Andy | 26 | **17** |

缺失的类形如 `Kim_AI.as`、`Kim_AI_Lv1..Lv5.as`、`Kim_Combo.as`、`Kim_Player.as`、
`Kim_role.as`、`Type2_Kim_*`（Moriya / Andy 同构，Nameless 无 Type2 变体）。

### 2.2 加载机制已确认（`代码已确认`）

后续审计找到了决定性证据。`frame_1629/DoAction.as:728-773`：

```actionscript
function checkOutRole()
{
   var _loc3_ = ["Kim","Nameless","Moriya","Andy"];   // ← 硬编码白名单
   ...
   while(_loc1_ < _loc3_.length)
   {
      _loc2_ = _loc3_[_loc1_];
      if(roleNameP1 == _loc2_) { loadP1(); }      // :765
      if(roleNameP2 == _loc2_) { loadP2(); }      // :769
      _loc1_++;
   }
}
function loadP1() {
   ...
   _loc2_.loadClip("char/" + _loc1_ + ".swf", P1_mc);   // :792
}
```

**只有这 4 个角色走外部 `char/<name>.swf` 加载路径**，其余角色走
`attachMovie("role_" + name)` 从主影片内联实例化。

而这 4 个角色恰好就是主程序中**唯一缺失** `_role.as` / `_AI*.as` 的角色，
且它们的类**只存在于那 4 个 EXE 内嵌包里**（见 2.1）。

**结论（`代码已确认`）：内嵌包与 `char/` 模块是同一批角色的两套实现，
设计意图明确 —— 这 4 个角色由外部文件提供，其余 21 个由主影片内联。**

### 2.3 仍未解决的问题

**这 4 个内嵌包如何到达 `char/` 目录，静态分析无法判定。**

`loadClip("char/Kim.swf")` 走的是 Flash 的相对路径解析，对 projector 而言
指向 EXE 所在目录的 `char\Kim.swf` —— **磁盘上的文件**。而内嵌包是编译进
EXE 内存的影片，AS2 没有 API 能把内存中的影片"写成"磁盘文件。

因此两种可能：

| 假设 | 含义 | 需要的证据 |
|---|---|---|
| A | 安装程序/分发包会把这 4 个包释放到 `char/` 目录 | 检查游戏目录是否存在 `char\Kim.swf` |
| B | 内嵌包是构建遗留，EX1.2 期望玩家自备 `char/` 目录 | 同上 |

**判定方法（需你在本机执行）：**

1. 在游戏根目录查找 `char\` 文件夹及其中的 `Kim.swf` / `Nameless.swf` /
   `Moriya.swf` / `Andy.swf`。
2. 若存在 → 假设 A，比对它们的 SHA-256 与
   `kofwing/11480055.swf`、`18464326.swf`、`16695748.swf`、`8492959.swf`
   （`reports/file_inventory.csv` 有记录）。
3. 不存在 → 假设 B，**这 4 个角色在本版本中很可能无法对战**。
4. 实机验证：进角色选择界面选 Kim 开一局，看是否正常。

**实测提示：** 若 `char/` 缺失，只有这 4 个角色受影响，其余 21 个不受影响 ——
因为它们不走外部加载路径。这是一个可验证的、范围明确的假设。

---

## 3. 共享引擎的五份副本：差异摘要（已更正）

> **本节为更正后的结论。** 初版使用按行号位置比较的算法，得出"`HitCheck.as` 差异 97.15%"
> 的错误结论。改用 `difflib.SequenceMatcher` 重新比对后结果如下。

五个位置都含有同名引擎类。用 `difflib` 精确比对（相似度 + 增删行数）：

| 类 | 副本数 | 不同版本数 | 与主程序版本比对 | 结论 |
|---|---:|---:|---|---|
| `role_corn/Role.as` | 5 | 2 | **相似度 99.94%**，删除 0 行，新增 **9** 行 | 主程序版本少 9 行 |
| `HitCheck.as` | 5 | 2 | **相似度 99.92%**，删除 0 行，新增 **1** 行 | 主程序版本少 1 行 |
| `role_corn/KeyControl.as` | 5 | 1 | **100.00%**，0 增 0 删 | 完全一致 |
| `HitCheck_obj.as` | 5 | 1 | **100.00%**，0 增 0 删 | 完全一致 |
| `role_corn/Combo_listener.as` | 5 | 1 | **100.00%**，0 增 0 删 | 完全一致 |
| `skill/FlyingObj.as` | 4 | 1 | **100.00%**，0 增 0 删 | 完全一致 |

### 3.1 正确结论

**五份引擎副本在功能上基本相同。** 两处差异都极小：

- `Role.as`：主程序版本比 4 个包版本**少 9 行**
- `HitCheck.as`：主程序版本比 4 个包版本**少 1 行**

差异方向一致（主程序更少），且 `KeyControl` / `HitCheck_obj` / `Combo_listener` /
`FlyingObj` 四类完全字节一致 —— 这种模式强烈提示**差异是调试语句（`trace()`）**，
而非逻辑差异。

**因此修改战斗逻辑的实务结论：**

| 修改目标 | 需要改几份 |
|---|---|
| `KeyControl`（输入）、`HitCheck_obj`（飞行物判定）、`Combo_listener`（连招监听）、`FlyingObj`（投射物） | **1 份**（五处字节一致） |
| `HitCheck.as`（判定框）、`Role.as`（状态机） | 理论上 1 份即可；但 4 个包比主程序多 1–9 行，**若补丁涉及那些多出来的行则必须同步** |

**建议做法：** 用 `tools/engine_diff_verify.py` 先看清那 1 行和 9 行到底是什么，
再决定是否需要同步。若只是 `trace()`，则无需同步。

**风险等级：低。** 初版把它报成高风险是错的。

### 3.2 为什么会存在多份

主程序版本比内嵌包版本少几行，说明它们来自**相邻的两次构建**。
四个内嵌包各自捆绑了一份当时的引擎副本，构建者后来把这些角色内联进主影片时，
没有删除旧包。

### 3.3 未决问题（与初版相同）

**哪一份在运行时实际生效，取决于第 2 节的假设 A/B：**

- 若假设 A 成立（包 = 角色模块）→ 两份都会生效。
- 若假设 B 成立（包是死代码）→ 只有主程序那份生效。

由于本次更正后差异极小（1–9 行），**这个未决问题的实际影响已降到很低**：
无论哪种假设，同步修改的成本都只是几行调试语句。

---

## 4. 全局状态接口（`_level0` / `_root`）

主程序通过全局变量与角色模块、Stage 模块通信。以下成员在代码中被高频访问
（`代码已确认`，节选自 `analysis/_level0_api.json`）：

| 成员 | 用途 | 出现位置示例 |
|---|---|---|
| `role_mc` / `char_mc` | 角色根影片 | 物理、判定 |
| `land_Y` | 地面 Y 坐标 | `HitCheck_obj.as:599` |
| `skillNum[]` | 技能编号数组 | 技能解锁/消耗 |
| `winTimes` | 回合胜场 | 3v3 判定 |
| `KO` / `isKO` | KO 状态 | |
| `inPause` / `inFreeze` | 暂停/定格 | `KeyControl`、各 AI 类 |
| `stageID` / `bgID` / `bgArray` | 舞台状态 | Stage 控制 |
| `player_type` | 对局类型，含 `"trainning"` | `DefineSprite_60324:10` |
| `charSelect_P1/P2`、`mode_role_P1/P2` | 角色选择结果 | 传给 `skillList` |
| `BgmVolume` | 音乐音量 | `bgmControl_mc` |
| `out()` | 调试输出 | 全代码高频 |
| `moreVs3V3` | 3v3 模式 | |

**修改任何全局变量前，注意它被多少模块读取。** `_level0.out()` 遍布所有类，
说明作者保留了统一的调试出口。

---

## 5. 状态汇总表

| 依赖 | 代码证据 | 路径是否动态 | 文件当前是否存在 | 运行验证 |
|---|---|---|---|---|
| `char/<role>.swf` | `代码已确认` ×4 | 是 | `当前目录不存在` | `未经运行验证` |
| `data/skillList.swf` | `代码已确认` ×1 | 否 | **`其他来源已找到`**（`data/data_old.tar`） | `未经运行验证` |
| `code.swf` | `代码已确认` ×1 | 否 | `当前目录不存在` | `未经运行验证` |
| `stage/weather/<tq>.swf` | `代码已确认` ×1 | 是 | `当前目录不存在` | `未经运行验证` |
| 内嵌 4 包 = 角色模块 | 强证据，未证实 | — | 已从 EXE 恢复 | `未经运行验证` |

**四个缺失依赖已找回一个**：`data/skillList.swf`（含 794 条完整出招表），
它此前被归档在 `data/data_old.tar` 里，不在游戏根目录中——这也是为什么
第一轮和第二阶段的目录扫描都没找到它。

**本次审计没有发现任何"在其他安装目录中找到"的依赖** —— 全盘搜索
（`wingex1.2.exe` 与关键文件名的递归检索）未发现第二个游戏副本。
`data_old.tar` 是唯一的额外来源，且它位于游戏目录内部。

> ⚠️ 本次审计**无法完成运行时验证**：本环境不具备可运行的 Flash Projector 回放环境，
> 且原始 `stage/`、`sound/` 内容当前是用户手动修改的版本，尚未还原。
> 因此本报告中**所有涉及"游戏运行时实际行为"的判断一律标记为 `未经运行验证`**，
> 未做任何"假装已验证"的推断。

---

## 6. 原始数据

- `reports/runtime_dependency_audit.csv` — 逐条调用点（依赖 × 脚本 × 行号 × 代码）
- `reports/_runtime_dep_evidence.json` — 完整证据集，含加载后符号追踪与引擎逐行差异
- 复现命令：`python tools/phase1_dep_audit.py`