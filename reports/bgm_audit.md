# BGM 配置审计 (Phase 2 - 静态侧)

> **范围限制（同 stage_audit.md）**
> 当前 `sound/` 是你手动修改的版本，文件存在性校验一律跳过（CSV 中 `file_check_now` = `SKIPPED`）。
> 原始 `sound/list.txt` 内容保存在 `reports/registries.json`，采集于文件被移除之前。
> 文件侧校验待原版补回后跑 `python tools/parse_registries.py <game_root> reports`。

---

## 1. `sound/list.txt` 的完整结构

采集到的 42 对条目可分为三类：

| 类别 | 数量 | 键示例 | 值示例 |
|---|---:|---|---|
| 角色 BGM 映射 | 41 | `Kyo`、`Iori`、`Andy` … | `Kyo.mp3`、`Iori.mp3` |
| 菜单/系统音乐 | 0（**不在 list.txt 中**） | — | 见第 4 节 |
| 标量配置 | 1 | `musicNum` | `50` |

**菜单音乐（`main.mp3`、`select.mp3`、`select-13team.mp3`）并不在 `list.txt` 里**，
它们由主程序用**硬编码字面量**直接加载（见第 3 节）。
也就是说 `list.txt` 只管角色专属 BGM。

---

## 2. `musicNum` 的真实用途：**未被使用**

这是本阶段最明确的结论。

**在主程序全部 27,122 个脚本中检索 `musicNum`，引用次数为 0。**

音乐管理器 `scripts/DefineSprite_1847_bgmControl_mc/frame_1/DoAction.as` 只读三种键：

```actionscript
function init() {
   var _loc1_;
   while(true) {
      _loc1_ = soundInf["stage" + _loc2_];      // ← 只读 "stage0","stage1",...
      if(_loc1_ == undefined) { break; }        // 遇到第一个未定义就停
      soundArray[_loc2_] = _loc1_;
      _loc2_++;
   }
}
function loadSound(char, chars) {
   var _loc2_ = soundInf[char];                 // ← 按角色名取
   var _loc3_ = soundInf[chars];
   if(_loc2_ == undefined) { /* 回退到 soundArray 里第一个非空项 */ }
   stageSound.loadSound("sound/" + _loc2_, false);
}
```

即：主程序只读取**角色名**键与 **`stageN`** 键，**从不读取 `musicNum`**。

### 结论

| 问题 | 答案 |
|---|---|
| `musicNum` 表示音乐数量吗？ | **不是** —— 主程序从不读它 |
| 是循环范围吗？ | **不是** —— 没有任何循环以它为界 |
| 那它是什么？ | 未知。最可能是更早版本（正版 KOF Wing 使用网络播放列表）的遗留字段，或供外部工具读取 |

### 关于"50 首 vs 实际文件数不一致"

**不能据此判定为 Bug。** 因为：

1. 该字段没有任何代码消费者，**它的值不影响游戏运行**。
2. 第一轮统计的 43 个 MP3 属于**你当时那份目录**；你现在 `sound/` 里的文件数量与体积
   已经不同（我 22:22 观察到的是更大的一批），说明目录内容本身在变。
3. 真正驱动播放的是 `&角色名=&文件名&` 这 41 条映射，不是计数。

**影响评估：无运行时影响。** 修改或删除 `musicNum` 不会改变游戏行为。
若想彻底消除歧义，等原版资源补齐后再核对一次即可。

---

## 3. 音乐加载链路（`代码已确认`）

```
sound/list.txt  --LoadVars-->  soundInf
                                      |
        ┌─────────────────────────────┼──────────────────────────┐
        |                             |                          |
  bgmControl_mc.loadSound(角色名)  stageN 槽位            硬编码字面量
        |                             |                          |
Sound.loadSound("sound/" + 值)  Sound.loadSound("sound/select.mp3")
                                Sound.loadSound("sound/main.mp3")
```

各加载点：

| 位置 | 调用 | 用途 |
|---|---|---|
| `DefineSprite_1847_bgmControl_mc/frame_1:48` | `stageSound.loadSound("sound/" + _loc2_, false)` | 对局 BGM（主路径） |
| `DefineSprite_1847_bgmControl_mc/frame_1:52` | 同上，回退分支 | 主键缺失时用备用键 |
| `DefineSprite_2732_char_select_mc/frame_2:12` | `selectChar.loadSound("sound/select.mp3", false)` | 选人界面音乐（硬编码） |
| `frame_1629/DoAction.as:3413` | `option_snd.loadSound("sound/main.mp3")` | 标题/设置音乐（硬编码） |

调用方示例（`frame_1638/DoAction.as:16`）：
```actionscript
bgmControl_mc.loadSound(_loc2_, charSelect_P1);
```
即传入**两个角色名**：第一个作为主键，第二个作为回退键。

### 音量与失败回退

```actionscript
function playSound() {
   stageSound.setVolume(_level0.BgmVolume);
   stageSound.start(0, 1000);
}
stageSound.onLoad = function(success) {
   if(success != true) { this.attachSound("blank"); }
};
```

**音乐加载失败不会崩溃**，而是退化为 `attachSound("blank")` 静音。
这是排查"BGM 不响"时的重要事实：**静默是失败的安全表现，不是崩溃**。

---

## 4. 菜单音乐的归属问题

`sound/` 目录下还存在 `main.mp3`、`select.mp3`、`select-13team.mp3`
（这些是原始目录中存在过的文件，代码引用来自第一轮分析）。

**但它们没有被 `list.txt` 管理，而是硬编码在代码里。**

含义：
- 想换标题音乐 → 替换 `sound/main.mp3` 文件本身，**不需要改 `list.txt`**
- 想加新的菜单音乐 → **必须改代码**，`list.txt` 做不到

这与角色 BGM 的处理方式不同，是两个独立机制。

---

## 5. 扩展名大小写

`sound/list.txt` 中写的是 `ChunLi.MP3`（大写）、`Iori3.mp3`（小写）——**同一文件内混用大小写**。

- **Windows**：不敏感，正常工作。
- **Linux / macOS（区分大小写）**：必须严格匹配，否则加载失败。

由于失败会静默退化成静音，**移植到区分大小写的系统时会出现"某些角色没 BGM"且不报错**。
这是已知风险，非当前系统的 Bug。

---

## 6. 问题汇总

| # | 问题 | 状态 | 影响 |
|---|---|---|---|
| B1 | `musicNum=50` 主程序零引用 | **已确认：死配置** | 无运行时影响 |
| B2 | 菜单音乐不在 `list.txt` 中，需改代码 | **已确认** | 换菜单音乐需动代码 |
| B3 | 扩展名大小写混用 | **已确认** | 仅影响区分大小写的系统 |
| B4 | 41 条角色映射的文件当前是否存在 | **未验证** | 待原版 `sound/` 补齐 |
| B5 | `stage0`/`stage1` 音乐槽位在 `list.txt` 中不存在 | **待确认** | 见下 |

### 关于 B5

`init()` 会循环读取 `soundInf["stage0"]`、`["stage1"]`……
遇到第一个 `undefined` 立即停止。**采集到的 `sound/list.txt` 中没有任何 `stageN` 键**，
因此 `soundArray` 实际为空，`getRandomBg()` 那条回退路径会立刻耗尽并退回
`_level0.bgArray[0]`。

**含义：本版本的 BGM 完全依赖角色名映射，不存在按地图切换的 BGM 槽位。**
这与 `list.txt` 里那 30+ 条角色绑定是配套的 —— 每张地图可能本来就有专属音乐，
但 EX1.2 的配置没有把 `stageN` 填上。

是否属于遗漏，需要你确认原版设计意图。

---

## 原始数据

- `reports/bgm_audit.csv` — 全部 42 条条目
- `reports/_stage_bgm_static.json` — 加载点行号清单
- 复现：`python tools/phase2_stage_bgm_audit.py`