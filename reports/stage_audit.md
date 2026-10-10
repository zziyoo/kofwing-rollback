# Stage 配置审计 (Phase 2 - 静态侧)

> **本报告的范围限制（重要）**
> 当前磁盘上的 `stage/` 目录是**你手动修改的版本**，不是原版，且随时可能变动。
> 因此本报告**不做文件存在性校验**，只做代码语义审计。
> `stage_audit.csv` 中的 `file_check_now` 列一律为 `SKIPPED`。
> 文件侧校验（存在性、大小写、SWF 有效性）待你把原版内容补回后，
> 用 `python tools/parse_registries.py <game_root> reports` 一次跑完。

---

## 1. `stage/list.txt` 的真实语义

第一轮报告把 `stageBG=` 理解为"背景列表"，把其余键理解为"角色→舞台映射"。
读完消费代码后可以给出更精确的定义（`代码已确认`）：

消费代码：`scripts/DefineSprite_61566/frame_1/DoAction.as`

```actionscript
function init(bgInf)
{
   stageArray = bgInf.stageBG.split(",");        // ① 候选舞台池
   _level0.bgArray = stageArray.concat();
   for(bgName in bgInf)
   {
      _loc2_ = bgInf[bgName];
      if(bgName == "stageBG") { break; }         // 跳过池键本身
      if(typeof _loc2_ == "string")
      {
         _level0.bgMapping[bgName] = _loc2_;     // ② 角色 → 专属舞台
         // ③ 绑定后把该舞台从候选池中移除（独占）
         while(_loc1_ < stageArray.length) {
            if(stageArray[_loc1_] == _loc2_) { stageArray.splice(_loc1_,1); break; }
            _loc1_++;
         }
      }
      else { _level0.bgMapping[name] = getRandomBg(); }  // ④ 非字符串 → 随机
   }
}
bgInf.onLoad = function(success) {
   if(success) { init(this); }                   // 读 stage/list.txt
   else        { getDefault(); }                // 失败 → 用内置默认值
};
function getDefault() { bgInf = _root.bgMappingDefault; init(bgInf); }
```

### 三类条目的确切含义

| 条目 | 语义 | 数量 |
|---|---|---:|
| `&stageBG=A,B,C&` | **候选舞台池**。未被角色绑定的舞台在此随机抽取 | 19 |
| `&角色名=舞台名&` | **角色专属舞台绑定**。绑定后该舞台被 `splice` 出池，**不参与随机** | 30 |
| 其他非字符串值 | 触发 `getRandomBg()` 随机分配 | 0（当前配置中无） |

**注意 `_level0.bgArray` 的双重身份**（第一轮报告未点明）：
它**先**存放候选舞台名的字符串数组，**后**在 Stage 模块加载完成后被
`Stage_control2.as:76` 的图层对象数组覆盖（`this.bgObjArray = this.bgSource.bgArray`）。
同名不同义，改代码时极易混淆。

---

## 2. 内嵌 vs 外部：本作只支持外部

代码里有**两条**舞台加载路径（`代码已确认`）：

| 开关 | 代码 | 位置 |
|---|---|---|
| `isLoadStage == false` | `loader.attachMovie("stage_" + bgID, "stage_mc", depth)` | `DefineSprite_2659/frame_1:13`、`frame_1638:39` |
| `isLoadStage == true`（默认） | `loadClip("stage/" + bgID + ".swf", stage_mc)` | `DefineSprite_2659/frame_1:29`、`frame_1638:67` |

默认值 `var isLoadStage = true;`（`scripts/frame_1/DoAction.as:112`）。

**但是**：主程序 `ExportAssets` 中以 `stage` 开头的符号**只有 2 个**——
`Stage_shake` 和 `stageControl_mc`——**不存在任何 `stage_<地图名>` 形式的符号**。

**结论（`代码已确认`）：内嵌分支所需的符号在本版本中并不存在，`isLoadStage` 必须为 `true`，
本作版本只支持外部 stage 文件。** 这一点在修改 `isLoadStage` 之前必须知道：
把它改成 `false` 不会让舞台内嵌生效，只会让所有舞台加载失败。

---

## 3. 内置默认值与 `list.txt` 的冲突

主程序内置了一份兜底配置（`frame_1629/DoAction.as:3362-3373`，`代码已确认`）：

```actionscript
var bgMappingDefault = new LoadVars();
bgMappingDefault.stageBG = "moonbridge,factory,gym,palace,earth";
bgMappingDefault.Kyo = "factory";
bgMappingDefault.Iori = "moonbridge";
bgMappingDefault.K = "palace";
bgMappingDefault.Kula = "palace";
bgMappingDefault.Orochi = "earth";
bgMappingDefault.Mai = "gym";
bgMappingDefault.Terry = "factory";
bgMappingDefault.Ryo = "gym";
bgMappingDefault.Athena = "palace";
bgMappingDefault.Ash = "factory";
```

触发条件：`bgInf.onLoad` 的 `success == false`，即 `stage/list.txt` **加载失败**时。

**冲突点：** 这 5 个内置默认舞台名（`moonbridge` / `factory` / `gym` / `palace` / `earth`）
与 `stage/list.txt` 中实际存在的 19 张中文名地图**完全不重叠**。

含义：
- 正常情况下 `stage/list.txt` 加载成功，内置默认值不会被使用，无害。
- 一旦 `list.txt` 读不到（例如路径错误、被改坏），游戏会**静默回退**到这 5 个英文名，
  然后 `loadClip("stage/moonbridge.swf")` 全部失败 → 舞台空白，但**不会报错**。

**这是排查"进游戏没背景"问题的第一条线索。**

---

## 4. 角色绑定指向不存在文件的情况

`sound`/`stage` 原始内容保存在 `reports/registries.json`（在文件被移除前采集）。
按第一轮记录，`stage/list.txt` 的 30 条角色绑定中：

| 情况 | 数量 | 说明 |
|---|---:|---|
| 值能在磁盘上找到对应 `.swf` | 11 | 其中 7 个位于 `stage2/其他地图/静态|动态/` |
| 值在磁盘上找不到任何对应文件 | **19** | `Railway` 找到，但 `iceLab`/`Factory`/`Moon bridge` 等找不到 |

**关键约束：** 加载路径硬编码为 `"stage/" + bgID + ".swf"`（见第 2 节），
**没有任何回退目录搜索**。因此：

- 那 7 条命中 `stage2/其他地图/` 的绑定，**只有在文件被复制到 `stage/` 下时才会成功加载**。
- 那 19 条指向原版 KOF Wing 英文名的绑定，在 EX1.2 中**无对应文件**，会加载失败。

### 设计意图未定 —— 需要你确认

这里有三种可能，本阶段无法从静态代码区分：

| 可能 | 判据 |
|---|---|
| A. `其他地图` 是需要玩家手动拷进 `stage/` 的可选扩展 | 官方发布说明里有"复制到 stage"步骤 |
| B. `stage/list.txt` 是原版遗留，EX1.2 换了地图名但没同步 | 换过地图文件名的证据 |
| C. 绑定失效是被容忍的：加载失败时回退到随机候选池 | 需要看 `loadClip` 的 `onLoad` 失败处理 |

**在确认之前，不建议把整个 `stage2/` 复制到 `stage/`。**
按第一轮记录，`stage2/` 里包含的**不是纯地图**，而是角色同名文件
（`Kyo.swf`、`Iori.swf` 等），它们同样导出 `bgArray`，作为 Stage 模块是合法的；
但整体复制会引入 60+ 个原本不该被当作地图的文件。

### 最小验证步骤（供你在本机执行）

1. 先备份 `stage/list.txt`。
2. 只复制**一个**确认为地图的文件，例如
   `stage2/其他地图/静态/Railway.swf` → `stage/Railway.swf`。
3. 进入游戏，选 Kyo 开一局，观察是否正确加载 `Railway`。
4. 若成功 → 假设 A 成立，再决定是否批量复制。
5. 若失败 → 说明绑定到 `其他地图` 的路径本就不通，回到假设 B/C。

---

## 5. `stage2/list.txt` 的作用

| 项 | 结论 |
|---|---|
| 内容完整性 | 39 对，全部 76 个条目在采集时都能在磁盘上找到对应文件 |
| 主程序消费者 | **0 个**。全文检索 `stage2` 在主程序的 27,122 个脚本中零命中 |
| 加载路径 | 无。加载器只拼接 `"stage/"` 前缀 |

**结论（`代码已确认`）：`stage2/list.txt` 没有任何已知的消费者。**

这与第一轮报告一致。最可能的解释是 EX1.2 新增了 `stage2/` 目录但**没有把它接入主程序**，
或者接入方式依赖某个我们尚不存在的文件（如 `char/` 或 `code.swf`）。

**不应假定"主程序会读 `stage2/list.txt`"** —— 证据不支持这一点。

---

## 6. 问题汇总

| # | 问题 | 状态 | 影响 |
|---|---|---|---|
| S1 | 19 条角色绑定指向不存在的舞台文件 | **已确认存在问题** | 这些角色的专属舞台加载失败 |
| S2 | 7 条绑定指向 `stage2/其他地图/` 下的文件，而加载器只查 `stage/` | **已确认存在路径不匹配** | 未复制则加载失败 |
| S3 | 内置默认舞台名与实际地图名完全不重叠 | **已确认存在冲突** | `list.txt` 加载失败时静默全灭 |
| S4 | `stage2/list.txt` 无消费者 | **已确认** | 疑似未完成接入 |
| S5 | 上述配置是否为设计意图 | **待你确认** | 决定修复方案 |

---

## 原始数据

- `reports/stage_audit.csv` — 全部 49+ 条配置条目（含类型标记）
- `reports/_stage_bgm_static.json` — 消费点、加载点、内嵌点的完整行号清单
- 复现：`python tools/phase2_stage_bgm_audit.py`