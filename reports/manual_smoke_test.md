# 本机实测方案 (Manual Smoke Test)

> **本 Agent 环境不具备 Flash Projector 运行条件，从未启动过游戏。**
> 本文件中的所有"预期结果"均来自**静态代码证据**，不是运行观测。
> 每一项都请你亲自执行并记录实际结果。

---

## 0. 前置：备份（**必做，不可跳过**）

当前 `D:\拳皇\拳皇WingEX1.2前瞻版\` **不是原版**——`stage/`、`sound/`、`data/` 是手动修改版本，
`stage2/` 已不存在。这是已知状态，不需要"修复"，但**在补回原版资源之前不要做破坏性测试**。

```powershell
$src = "D:\拳皇\拳皇WingEX1.2前瞻版"
$bak = "D:\kof_baseline_$(Get-Date -Format yyyyMMdd_HHmmss)"
robocopy $src $bak /E /R:1 /W:1
"备份完成: $bak"
```

同时确认 EXE 未被改动（本次分析全程只读）：

```powershell
Get-FileHash "$src\wingex1.2.exe" -Algorithm SHA256
(Get-Item "$src\wingex1.2.exe").Length     # 应为 146699366
```

---

## A. 原版基线测试

**目的**：建立"改动前"的行为基线。没有基线就无法判断改动是否引入回归。

### A1. 启动与基本流程

| 步骤 | 操作 | 记录 |
|---|---|---|
| A1.1 | 双击 `wingex1.2.exe` | 是否启动？报错信息原文 |
| A1.2 | 进入主菜单 | 菜单项是否齐全 |
| A1.3 | 进入角色选择 | 角色列表是否正常显示 |
| A1.4 | 选两名角色进入对战 | 是否能开始战斗 |
| A1.5 | 结束一局 | 结算界面是否正常 |

### A2. 四名外部角色专项验证 ⭐ **最关键**

代码证据（`frame_1629:728-773`）：

```actionscript
var _loc3_ = ["Kim","Nameless","Moriya","Andy"];   // 只有这 4 人走外部加载
...
_loc2_.loadClip("char/" + _loc1_ + ".swf", P1_mc);
```

**这 4 个角色是唯一走 `char/<名字>.swf` 外部加载路径的**；其余 21 个走
`attachMovie("role_"+name)` 从主影片内联。

对 Kim / Nameless / Moriya / Andy **各打一局**（让 CPU 接管）：

| 角色 | 能选中 | 选人动画 | 进战斗 | AI 行动 | 受击反馈 | 判定框 |
|---|---|---|---|---|---|---|
| Kim | | | | | | |
| Nameless | | | | | | |
| Moriya | | | | | | |
| Andy | | | | | | |

**同时对照一个内联角色**（如 Kyo）：

- 若 Kyo 正常而这 4 人异常 → 假设 B：**`char/` 缺失，这 4 人在本版本中确实是坏的**
- 若 4 人都正常 → 假设 A：**`char/` 存在且可用**

> 这条测试直接决定 `reports/runtime_dependency_audit.md` 第 2.3 节
> "内嵌包是角色模块还是死代码" 的最终答案。

### A3. `char/` 目录核查

```powershell
Test-Path "$src\char"
Get-ChildItem "$src\char" -ErrorAction SilentlyContinue |
  Select-Object Name, Length
```

若存在，比对哈希（判断是否就是 EXE 内嵌的那 4 个包）：

```powershell
$map = @{
  "Kim.swf"      = "kofwing\11480055.swf"
  "Moriya.swf"   = "kofwing\16695748.swf"
  "Nameless.swf" = "kofwing\18464326.swf"
  "Andy.swf"     = "kofwing\8492959.swf"
}
foreach ($k in $map.Keys) {
  $a = "$src\char\$k"; $b = "$src\$($map[$k])"
  if ((Test-Path $a) -and (Test-Path $b)) {
    "{0,-14} {1}" -f $k, ((Get-FileHash $a).Hash -eq (Get-FileHash $b).Hash)
  } else { "{0,-14} 缺失" -f $k }
}
```

### A4. Stage 加载

| 步骤 | 操作 | 预期（来自代码证据） | 实际 |
|---|---|---|---|
| A4.1 | 进入一局 | 背景正常显示 | |
| A4.2 | 选一张**专属绑定**地图（见 `stage/list.txt`） | 若该绑定指向的文件不存在，会加载失败——**且不报错，只是没背景** | |
| A4.3 | 选一张**候选池**里的随机地图 | 正常显示 | |

**排查"没背景"的第一条线索**：`frame_1629:3363` 的内置默认值
`moonbridge/factory/gym/palace/earth` 与实际中文名地图**完全不重叠**。
一旦 `stage/list.txt` 读不到，游戏会静默回退到这 5 个英文名然后全部加载失败。

```powershell
# 确认 stage/list.txt 可读且未被损坏
Get-Content "$src\stage\list.txt" -Encoding UTF8 | Select-Object -First 3
```

### A5. BGM

| 步骤 | 操作 | 预期 | 实际 |
|---|---|---|---|
| A5.1 | 主菜单 | 播放 `sound/main.mp3`（硬编码，非 list.txt） | |
| A5.2 | 角色选择 | 播放 `sound/select.mp3` | |
| A5.3 | 进入对战 | 播放对应角色 BGM | |
| A5.4 | 切换角色 / 换地图 | 音乐正确切换 | |
| A5.5 | 暂停 / 结束 | 音乐停止或恢复 | |

**注意**：BGM 加载失败**不会崩溃**，而是退化为 `attachSound("blank")` 静音
（`bgmControl_mc/frame_1`）。**静默是失败的安全表现，不是正常。**
若某个角色没 BGM，检查 `sound/list.txt` 里对应行的**扩展名大小写**
（该文件混用 `ChunLi.MP3` 与 `Iori3.mp3`）。

---

## B. 修改后 SWF 测试

### B1. 已验证可用的编辑流程

阶段四已在副本上证明（`reports/modding_pipeline_validation.md`）：

| 步骤 | 命令 |
|---|---|
| 1. 复制 | `Copy-Item kofwing\21256864.swf <实验目录>\orig.swf` |
| 2. 导出脚本 | `java -Xmx3g -jar D:\swf解包\ffdec.jar -export script <目录>\scripts <实验目录>\orig.swf` |
| 3. 编辑 | 编辑 `<脚本路径>` 中的 `.as`（**注意 JPEXS 导出的是 `\"` 转义字符串**） |
| 4. 重新导入 | `java -Xmg3g -jar D:\swf解包\ffdec.jar -importScript <实验目录>\orig.swf <实验目录>\edited.swf <目录>\scripts` |
| 5. **验证** | 重新导出脚本，确认改动在位——**不能只看退出码** |

### B2. 最安全的第一个改动：`out()` 调试插桩

`frame_1629:720` 的 `out(str)` **函数体是空的**：

```actionscript
function out(str)
{
}
```

全代码高频调用它。把它改成打印，**零战斗行为影响**：

```actionscript
function out(str)
{
   trace("[KOF-DEBUG] " + str);
}
```

### B3. 验收标准

```powershell
# 改前
Get-FileHash .\orig.swf  -Algorithm SHA256
(Get-Item .\orig.swf).Length

# 改后 —— 必须重新解析，不能只看退出码
java -Xmx3g -jar D:\swf解包\ffdec.jar -dumpSWF .\edited.swf > .\after_dump.txt
(Get-Content .\after_dump.txt | Measure-Object -Line).Lines    # 应与改前一致
java -Xmx3g -jar D:\swf解包\ffdec.jar -export script .\verify .\edited.swf
Select-String -Path .\verify\scripts\**\*.as -Pattern "KOF-DEBUG"
```

### B4. 前置条件（缺一不可）

修改后的 SWF 要能跑起来，**当前目录仍缺**：

| 缺失 | 影响 |
|---|---|
| `char/` | Kim / Nameless / Moriya / Andy 无法加载；**其余 21 个角色不受影响** |
| `stage/` 资源 | 无背景 |
| `sound/` 资源 | 无 BGM |
| `code.swf` | 未知影响（代码加载后完全未使用） |
| `stage/weather/` | 声明了天气的地图无天气效果 |

### B5. 最小回滚

```powershell
# 方法 1：直接换回（推荐，改动只在副本上）
Copy-Item <实验目录>\orig.swf "$src\kofwing\21256864.swf" -Force

# 方法 2：整目录回滚
robocopy D:\kof_baseline_<时间戳>\kofwing "$src\kofwing" /E /R:1 /W:1
```

验证回滚成功：

```powershell
(Get-FileHash "$src\kofwing\21256864.swf").Hash -eq (Get-FileHash <实验目录>\orig.swf).Hash
```

---

## C. EXE 重新打包测试

> **结论保持为「未打通」。** 本文件只列出前置条件与隔离实验方案。

### C1. 为什么不能直接替换

**不要直接覆盖 `wingex1.2.exe` 末尾的字节。** 原因：

- 主影片位于 EXE 偏移 21,256,864 且**精确延伸至文件末尾**，
  但 Projector 如何定位这个偏移，**尚未验证**（需要解析 Flash Projector 的尾部结构）。
- 主影片是 **LZMA 压缩**的，替换后存储长度会变（阶段四实测：
  125,442,502 → 128,688,308，**+2.59%**），可能影响偏移计算。
- 是否存在校验和，**未知**。

### C2. 未验证的前置条件

| # | 前置条件 | 状态 |
|---|---|---|
| P1 | Flash Projector 尾部定位结构的准确格式 | ❌ 未验证 |
| P2 | 新的 LZMA 流能否被 Flash 运行时接受 | ❌ 未验证 |
| P3 | `FileLength` 与存储长度的正确关系 | 部分（声明值已在往返中保留） |
| P4 | 是否存在校验和 | ❌ 未验证 |
| P5 | 替换后相对路径资源是否仍能加载 | ❌ 未验证 |
| P6 | Flash 运行时对 SWF v15 LZMA 的支持边界 | ❌ 未验证 |
| P7 | Projector 是否校验主影片长度 | ❌ 未验证 |

### C3. 可接受的隔离实验方式

```powershell
$iso = "D:\kof_isolated"
New-Item -ItemType Directory -Force -Path $iso
Copy-Item "$src\wingex1.2.exe" "$iso\wingex1.2_mod.exe"
# 在 $iso 下进行一切实验，绝不碰 $src
```

**成功判据**（全部满足才算打通）：

1. `wingex1.2_mod.exe` 能启动
2. 能进入主菜单与角色选择
3. 能进入对战且**外部资源**（`char/`、`stage/`、`sound/`）正常加载
4. 出招表（`skillList.swf`）正常显示

### C4. 值不值得继续投入？

我的评估：**除非你有具体的 EXE 分发需求，否则不值得优先投入。**

理由：修改脚本 + 替换外部 `kofwing/*.swf` 这条路径**已经被证明结构无损**，
覆盖面也足够（所有 21 个内联角色 + 引擎 + 出招表 + 配置都在可控范围内）。
EXE 重打包解决的主要是"单文件分发"这一个需求，而风险是**可能产出无法启动的 EXE**。
若确实需要，建议先完成 C2 的 P1（解析尾部结构），再考虑其余。

---

## D. 补齐原版资源后的校验命令

补回原版 `stage/` `stage2/` `sound/` 后，**不需要重跑全量分析**，直接跑：

```powershell
cd D:\拳皇\拳皇WingEX1.2前瞻版\_reverse

# Stage / BGM 文件侧校验（存在性、大小写、SWF 有效性）
python tools\parse_registries.py "D:\拳皇\拳皇WingEX1.2前瞻版" reports

# 结构复核（写入新路径，不覆盖历史记录）
python tools\rebaseline_struct.py

# 完整回归
python -m unittest discover -s tests -t .
```

`parse_registries.py` 会逐条报告 `resolved` / `MISSING` / `CASE_DIFFERS`，
直接回答"Stage 和 BGM 配置到底还缺什么"。

---

## E. 结果记录表

请把实际结果填进这张表再反馈：

| 项 | 预期（静态推断） | 实际 | 一致？ |
|---|---|---|---|
| A1 游戏可启动 | 是 | | |
| A2 Kyo（内联角色）正常 | 正常 | | |
| A2 Kim/Nameless/Moriya/Andy | 取决于 `char/` | | |
| A3 `char/` 是否存在 | 未知 | | |
| A4 背景正常显示 | 是 | | |
| A5 BGM 正常播放 | 是 | | |
| B4 改后 SWF 可启动 | **未验证** | | |
| C EXE 可重打包 | **未打通** | | |

---

## 附：本次分析期间该目录发生过变化

记录在案以免误解——**不是本 Agent 删除的**：

| 时间 | 事件 |
|---|---|
| ~21:38 | 游戏根目录被移入回收站（当时已是空壳） |
| ~21:47–21:55 | `stage/` `stage2/` `sound/` `kofwing/` `data/` 陆续消失 |
| 22:16 起 | 部分内容以**另一版本**的形式重新出现（`stage/` 里是原 `stage2/` 的内容；`sound/` 的 MP3 体积与扩展名大小写均与原始记录不同） |

用户已确认：`stage/` `sound/` 是手动修改的版本，原版内容稍后补回。