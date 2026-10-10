# 拳皇 Wing EX1.2 MOD 导航图（modding code map）

面向"要改某个文件达成某个效果"的开发者。本文所有路径、行号均为**实际读取反编译源码后核对**所得。

## 阅读约定

| 项 | 说明 |
| --- | --- |
| 基准目录 | 本文所有路径相对于 `analysis/kofwing__21256864/scripts/`。因此类文件写作 `scripts/__Packages/X.as`，时间轴脚本写作 `scripts/frame_1629/DoAction.as`。 |
| 四个 EXE 内嵌包 | 相对路径写作 `kofwing__11480055/scripts/scripts/__Packages/X.as` 等，基准同上。 |
| 未经运行验证 | 仅靠静态反编译**无法确认**、必须实机验证的结论，均显式标注。 |
| 行号 | 形如 `HitCheck.as:255` = 该文件的第 255 行。 |

### 角色与包归属（已核对）

| SWF | EXE 偏移 | 拥有角色 | `role_*` 剪辑 |
| --- | ---: | --- | --- |
| `21256864.swf` | 21,256,864 | **主程序**，含 21 个角色 | `role_Kyo / KyoW / Iori / Iori3? / K / Kula / Mai / Athena / Ryo / Ryu / Chunli / Haohmaru / Terry / Ash / Rugal / Orochi / Zero / Igniz / Goenitz / Krizalid / Kusanagi / Oswald` |
| `11480055.swf` | 11,480,055 | Kim（+`Type2_Kim`） | `role_Kim` |
| `16695748.swf` | 16,695,748 | Moriya | `role_Moriya` |
| `18464326.swf` | 18,464,326 | Nameless | `role_Nameless` |
| `8492959.swf` | 8,492,959 | Andy（+`Type2_Andy`） | `role_Andy` |

> **重要且高价值的发现**：主程序里已有 **21 个** `role_<Name>` 剪辑被 `attachMovie` 直接挂载（`frame_1629/DoAction.as:868`），**只有 4 个角色**（Kim / Nameless / Moriya / Andy）走 `char/<Name>.swf` 外部加载路径 —— 判断入口是 `frame_1629/DoAction.as:728-773` `checkOutRole()` 里硬编码的数组 `["Kim","Nameless","Moriya","Andy"]`。
> 因此 `char/` 目录**不是全部角色都需要**，只服务这 4 个。
> **未经运行验证**：这 4 个 EXE 内嵌包 SWF 在结构上就是 `char/<Name>.swf` 模块（各含 1 个 `role_*` 剪辑 + 各自的 `Role.as`/`HitCheck.as` 副本），但**没有任何加载调用按名字引用它们**，它们在磁盘上的确切投送方式无法从静态代码确定。

---

## 0. 共享引擎重复问题（改判定前必读）

共享引擎代码在主程序与 4 个包中各存一份。已用 MD5 + `git diff --no-index` 逐一核对：

| 文件 | 主程序 | 四个包 | 实际差异 | 风险 |
| --- | --- | --- | --- | --- |
| `role_corn/Role.as` | 198,416 B | 198,796 B | **+9 行**，全是 `trace(...)` 调试输出 | 低 |
| `HitCheck.as` | 20,018 B | 20,057 B | **+1 行**：`trace("HitCheck: " + HitCheck);` | 低 |
| `role_corn/KeyControl.as` | 12,278 B | 12,278 B | **完全一致** | 无 |
| `HitCheck_obj.as` | 21,127 B | 21,127 B | **完全一致** | 无 |
| `role_corn/Combo_listener.as` | 4,642 B | 4,642 B | **完全一致** | 无 |
| `skill/FlyingObj.as` | 7,951 B | 7,951 B | 三包一致；**`kofwing__11480055`（Kim）中没有此文件** | 中 |

**结论（与常见误解相反）**：这些副本之间**不是"差异巨大"，而是近乎逐字节相同**，差异仅 1–9 行、且都是调试 `trace`。因此：

- **实际风险低**：把主程序里的修复照抄进包即可，不需要"移植两套不同逻辑"。
- **但仍必须改 5 份**：它们是各自独立 SWF 里的独立类定义，改主程序**不会**影响 Kim/Nameless/Moriya/Andy 的判定行为。
- `skill/FlyingObj.as` 在 Kim 包中缺失 —— 给 Kim 加投射物时需留意。

---

## 1. 角色定义、角色注册与选择界面

### 1.1 主控制器：全局状态与内联数据表

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1629/DoAction.as`（3,542 行，主时间轴控制器） |
| **类/函数/变量** | `cpuNormal_list`(3348)、`char_list`(3343)、`name_list`(3346)、`name_list_cn`(3347)、`arcade_Bosslist`(3344)、`pvp_BossNamelist`(3345)、`mc_list`(3354)、`bgMappingDefault`(3362-3373)、`mustDefendSkill`(3374)、`key_P1_proto`(3383)、`key_P2_proto`(3384)、`settingArr`(3115) |
| **职责** | 承载全部**内联字面量表**：可选角色名、CPU 候选表、Boss 表、选择界面格子 ID 映射（`mc_list`）、角色→默认场景表、必须防御的招式表、默认按键表。它是"不改代码也想改内容"的第一站。 |
| **依赖/调用** | 被主时间轴各帧调用；`DefineSprite_2732_char_select_mc/frame_1/DoAction.as:1` 读 `_root.mc_list`；`Role.as:3835` 读 `_level0.pvp_BossNamelist`；`DefineSprite_61566/frame_1/DoAction.as:39` 读 `_root.bgMappingDefault`。 |
| **影响面** | `cpuNormal_list` 同时决定 1P vs CPU 的对手池；`mc_list` 改动会让选择界面格子错位；`key_*_proto` 改动会覆盖用户已保存的按键（`loadKey()` 见 488-501）。 |
| **最小验证** | 改 `cpuNormal_list` 加一个名字 → 进 1P vs CPU 模式，CPU 池里应出现该角色；若角色不存在，CPU 会在 `addPlayer()` 处 `attachMovie` 失败而黑屏/卡住。 |

> **在线模式会缩小 CPU 池**：`frame_1629/DoAction.as:3349-3352`，`if(onLine)` 时 `cpuNormal_list` 被整体替换为 9 人短表。`onLine` 在 `frame_1/DoAction.as:108` 默认为 `false`。

### 1.2 选择界面逻辑

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/CharSelect/CharSelect_icon.as`（31,348 B） |
| **类/函数/变量** | `nameList`(:36)、`nameListNormal`(:37)、`nonActive`(:35)、`init()`(:48)、`char_select()`(:106)、`getNext()`(:387)、`randomSelect()`(:410) |
| **职责** | 选择界面的光标移动/确认/随机选择。`nameList` 是 26 名角色的完整图标表；`nameListNormal` 是 19 名**默认可随机到的角色**（随机选择用，:579-581）。`nonActive` 是禁用列表，:367 参与判定。 |
| **依赖/调用** | 由 `DefineSprite_2732_char_select_mc` 驱动；写回 `_level0.charSelect_P1/P2`、`_level0.mode_role_P1/P2`。 |
| **影响面** | 只加到 `nameList` 会出现"有图标但随机选不到"；只加到 `nameListNormal` 会随机到一个没有图标的角色。**两者都要加**，且要同步 `frame_1629:3354 mc_list`（格子 ID）与 `frame_1629:3348 cpuNormal_list`。 |
| **最小验证** | 选择界面用随机键，确认新角色能被随机到且头像正常显示。 |

### 1.3 角色实例化 / AI 难度分发（关键枢纽）

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/DefineSprite_1321_loaderchar/frame_1/DoAction.as:1-102`；每个内嵌角色也有同名函数，如 `scripts/DefineSprite_29633_role_Kyo/frame_4/DoAction.as` |
| **类/函数/变量** | `addPlayer(type, roleMode)`；`Object.registerClass(_loc1_, _loc1_ + "_AI_Lv" + N)` |
| **职责** | **难度等级的唯一分发点**：读 `_level0.level`（1–5），用 `Object.registerClass` 把"角色剪辑"注册成对应的 `*_AI_Lv1..Lv5` 类或 `*_Player` 类，最后 `attachMovie(_loc1_,"role_mc",100)`。`roleMode` 为 2/3 时前缀成 `Type2_`/`Type3_`；`type == "demo"` 时不注册 AI。 |
| **依赖/调用** | 被 `frame_1629/DoAction.as:725-726 rerole()` 调用。`_level0.level` 来自 `setting.data.level`（`loadOption()` :408，默认值 5 见 `loadDefault()` :472）。 |
| **影响面** | 这是**新增角色必须接线的唯一入口**：光有 AI 类文件而没有在这里注册，角色永远以"无 AI 类"挂载，CPU 行为会是空的。 |
| **最小验证** | 把 `level` 设为 1，开 1P vs CPU，确认 CPU 使用 `*_AI_Lv1`（可用 `trace` 或观察 CPU 明显变弱）。 |

### 1.4 角色出场与外部模块加载

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1629/DoAction.as:728-773`（`checkOutRole`）、`774-793`（`loadP1`）、`794-813`（`loadP2`）、`814-980`（`role_mode`） |
| **类/函数/变量** | `checkOutRole()`、`loadP1()`、`loadP2()`、`role_mode()`；`roleNameP1/2`、`roleModeP1/2`、`P1_mc._lockroot` |
| **职责** | 决定每个位置用内嵌剪辑还是外部 SWF。`role_mode()` :868-869 对普通角色 `attachMovie("role_"+name)`；对 4 个特殊角色先 `checkOutRole()` → `loadP1()/loadP2()` → `loadClip("char/"+name+".swf", P1_mc)`（:792/:812），并设置 `_lockroot = true`（:791/:811）使被载入模块能通过 `_root`/`_level0` 回调主程序。 |
| **依赖/调用** | 目标文件 `char/<Name>.swf` **在本目录树中不存在**。`char_kwUnlock()`(:379) 与 `charGetObj`/`charPassObj`（`loadOption()` :425-432）控制解锁。 |
| **影响面** | `_lockroot` 是角色模块与主程序通信的机制基础；关掉会让角色模块失去 `_root` 访问导致崩溃。 |
| **最小验证** | 选 Kim/Moriya/Nameless/Andy 其中一个开局，若黑屏即 `char/` 缺失；选其他 21 个角色应能正常开局。 |

---

## 2. 普通攻击 / 必杀技 / 超必杀技

### 2.1 招式表数据（数据侧）

| 字段 | 值 |
| --- | --- |
| **路径** | `data/skillList.swf`（已从 `data/data_old.tar` 解出，1,402,229 B）；加载点在 `scripts/DefineSprite_60324/frame_1/DoAction.as:14-25` |
| **类/函数/变量** | 导出 `skillList_icon`、`BoundingBox`、`DataHeaderBackGnd`、`DataHeaderOverlay`、`DataHeaderSeperator`、`DataSortArrow`、`DataStretchBar`；22 个 FrameLabel（每角色一个）；内联 XML 字面量如 `var Kyo1 = new XML("<char><skillList skill=... normal=... easy=... describe=.../></char>")` |
| **职责** | **招式表 / 出招表查看器 + 招式元数据源**。运行期查表方式为 `_root[_root.currentName + _root.currentMode]`，`currentMode` 取 `"1"`/`"2"`。共 41 张表 / 794 招 / 22 名角色（已整理至 `reports/move_list.md` 与 `reports/move_list.json`）。 |
| **依赖/调用** | `DefineSprite_60324/frame_1/DoAction.as:15` `loadMovie("data/skillList.swf",skList)`；:22-24 设置 `skList.currentName = _level0.charSelect_P1`、`currentMode = _level0.mode_role_P1` 后调用 `skList.onLoadSkill()`。 |
| **影响面** | **这是"改招式数值"最直接的位置**，但它同时是查表 UI：改坏 XML 会让界面和游戏一起失效。 |
| **最小验证** | 解包后用 JPEXS 打开，定位目标角色的 FrameLabel，改一处 `normal=` 数值，回编译后进训练模式观察对应普通技伤害变化。 |

### 2.2 招式执行分发（逻辑侧）

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/role_corn/Role.as:5753-5891`（`toSkill`）、`:5904-5947`（`skill_start`）、`:6004-6048`（`toStatus`） |
| **类/函数/变量** | `toSkill(action, cancle)`、`skill_start(action)`、`toStatus(_action)`、`superCheck`/`burstCheck`/`skillSuperCheck`、`powerDecType`、`status_1`/`status_2`/`status_3` |
| **职责** | 招式分发的总闸。`toSkill()` 依次做：暂停检查 → 重复招检查(`skill_mc.allowNum`) → 受击/倒地状态拦截 → **拆投技**（:5772-5794）→ **超必杀**判定(`superCheck`, :5816) → **爆气**判定(`burstCheck`, :5838) → **连段/取消**判定(`comboClass.check_combo`, :5859) → `skill_start()`。`skill_start()` 调 `toStatus()`，后者若存在同名方法则调用它（:6030-6036），否则 `gotoAndStop(action)` 并写 `status_1`（:6039-6045）。 |
| **依赖/调用** | 上游 `KeyControl.as:134 toSkill()` 与各 `<Name>_AI.as`；下游各角色的 `<Name>_role.as` 里的 `skXX()` 方法。 |
| **影响面** | **改动风险最高**：这是所有角色共用的分发中枢，任何 `return undefined` 的插入都会让某个招在特定状态下整体失效。建议只改最内层分支。 |
| **最小验证** | 训练模式，用该招在**地面/空中/受击后/倒地**四种状态下各试一次，确认行为与改前一致（除目标改动外）。 |

### 2.3 单角色招式定义

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/<Name>_role.as`（如 `Kyo_role.as`，8,394 B；42 个此类类） |
| **类/函数/变量** | `sk31()`(`Kyo_role.as:149`)、`sk28()`(:167)、`kick1()`(:92)、`sk32/sk3/sk34`(:119-148)、`to_kick()`(:181)、`to_punch()`(:272)；写 `status_1`/`status_2`/`status_3` |
| **职责** | 角色专属招式定义。每个 `skXX()` 做**前置条件判定**（当前是否已在同一招、是否在空中、是否已处于某个连招），成立后设置 `status_1 = "skXX"`（空中则 `"skXX_air"`）、`status_3 = "attack"`，最后 `gotoAndStop(status_1)`。`to_kick/to_punch` 等则按当前状态分派到 `jumpSkill()` / `pitch()` 等通用动作。 |
| **依赖/调用** | 被 `Role.as:6030-6036 toStatus()` 以 `this[action]()` 动态调用；命中判定的数据 `hitValue` 由角色模块的剪辑脚本经 `catch_HitTest*()` 传入。 |
| **影响面** | 单角色改动只影响该角色，是**最安全的改动层级**。注意 `status_1` 的字符串必须与角色 SWF 内的剪辑标签一致，否则 `gotoAndStop` 静默失败。 |
| **最小验证** | 训练模式只选该角色，逐一触发改动过的招式，确认动画与 `status_1` 一致。 |

### 2.4 超必杀 / 爆气判定与能量

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/role_corn/Role.as:4427-4512`（`superStart`/`superCheck`/`burstCheck`/`skillSuperCheckNew`）、`:4513-4600`（`powerDec`/`powerDec2`）；常量在 `:176-178` |
| **类/函数/变量** | `power_skillSuper = 60`、`power_skillBurst = 150`、`power_cancle = 30`、`superList`、`burstList`、`superMaxList`、`powerDecType` |
| **职责** | 决定某个招式是否升级为超必杀/爆气技、并扣减能量。`Role.as:1537/1552` 的 `sk_busrt_a/sk_busrt_d` 是爆气动作；`:4310 powerBurst()`、`:4316 burstEff()`。 |
| **依赖/调用** | 能量槽由 `Life_Power.as:376 powerControl()` 维护。 |
| **影响面** | 调低能量消耗会让超必杀更容易放出；`power_cancle` 影响取消时的扣能量。 |
| **最小验证** | 训练模式观察能量条消耗速度，并确认超必杀仍能正常触发与取消。 |

---

## 3. 伤害、硬直、击退、无敌、碰撞判定

> ⚠️ **本节所有改动点都受第 0 节的重复问题影响**：`HitCheck.as`、`HitCheck_obj.as`、`role_corn/Role.as` 在主程序与 4 个包中各有一份，必须同步修改。好消息是它们近乎一致，照抄即可（风险低）。

### 3.1 判定核心 `HitCheck`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/HitCheck.as`（595 行）+ `kofwing__<4 个包>/scripts/scripts/__Packages/HitCheck.as` |
| **类/函数/变量** | `start_hitCheck(obj, r)`(:20-245)、`do_hitCheck()`(:246-579)、`stop_hitCheck()`(:580)、`getPosY()`(:587)；`hitValue`、`hitID`、`d_rate2 = 0.1`、`hit_interval = 20` |
| **职责** | **攻击方**的判定循环。`start_hitCheck()` 启动前做一长串修正：按 `skillNum` 归一化伤害(`d_rate`, :61/:101)、连段计数 ≥10/≥20 时强制改受击动画为 `hurt6` 且 `Vx=Vy=25`(:70-87)、`att_mode` 伤害 ×0.8(:157)、`power_mode` 追加硬直(:165)、对拼(`hurt_crash`)处理(:167-199)、`nohit_status`/`nohit_skills` 免疫表(:205-231)。`do_hitCheck()` 每帧 `hitTest` 对手 `body`/`body2`，命中则 `checkTimes--`、调 `role.doHit()` 与 `opp.doHurt()`(:369-370)。 |
| **依赖/调用** | 被角色剪辑里的判定脚本以 `new HitCheck().start_hitCheck(hitValue, role)` 形式启动；调用 `Role.doHit`/`Role.doHurt`；被强制链接于 `frame_1629/DoAction.as:3535`。 |
| **影响面** | 改 `d_rate`/`Vx`/`Vy` 会同时影响普通攻击、必杀、超必杀的所有判定。改 `checkTimes` 影响多段命中次数。 |
| **最小验证** | 训练模式开 hitbox 显示，打同一招若干次确认；再验证连段内第 1 段与第 5 段的伤害差异（`skillNum` 归一化效果）。 |

### 3.2 投射物/独立对象判定 `HitCheck_obj`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/HitCheck_obj.as`（668 行，**5 处完全一致**） |
| **类/函数/变量** | `start_hitCheck`(:26)、`do_hitCheck`(:174)、`do_move`(:562-600)、`stop_hitCheck`(:601)、`do_hitOpp`(:621)、`do_hitObj`(:637)、`hitBack`(:653-667) |
| **职责** | 带自身位移的判定体。`do_move()` 按 `obj_Vx/obj_Vy` 移动，叠加 `accel`(加速度) 与 `slowdown`(:580-587)，越界 `>963 或 <-110` 则移除(:590-593)，落到 `land_Y` 则触发 `do_hitOpp()` 弹地(:594-598)。`hitBack()` 反转方向与 `_xscale`、交换 `role`/`opp` 并重新 `start_hitCheck`，实现**弹反**。 |
| **依赖/调用** | 与 `skill/FlyingObj.as` 配合；`HitCheck_obj` 在主程序 `frame_1629:3536` 被强制链接。 |
| **影响面** | `hitBack()` 里对 `Haohmaru` 的特判(:661-664)说明霸王丸的弹道行为与他人不同。 |
| **最小验证** | 选霸王丸与另一角色对投，验证弹反方向与弹道一致。 |

### 3.3 受击与伤害结算 `Role.checkHurt`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/role_corn/Role.as:3676-3921`（`checkHurt`）、`:3644-3675`（`doHurt`）、`:3922-4105`（`hurtStatus`） |
| **类/函数/变量** | `lifeObj.d_rate`、`hurtValue`、`status_3`、`nosh`、`noLifeDec`、`armor_mode`、`redBlood`、`bdCombo` |
| **职责** | **最终伤害与硬直的唯一结算点**。流程：防御分支(:3701-3815，按 `freezeTime+freezeTime2` 量化硬直、破防 `breakDefend`)→ 伤害基准赋值(:3819-3830，爆气 power 模式 ×1.15)→ **倍率修正链**：`armor_mode` ×0.7(:3833)、BOSS 战 ×0.8~×0.9(:3835-3861)、`bdCombo` ×0.6(:3864)、血气/ASH/草薙能量 ×0.5(:3868)、**Counter 反击 ×1.2**(:3882)→ `lifeControl()` 扣血(:3885)→ 双方回气(:3886-3894)→ `hurtStatus()` 切硬直动画。`doHurt()` 另处理 `freezeTime` 触发 `effect_mc.hitFreeze()` 与 KO 定格。 |
| **依赖/调用** | 由 `HitCheck.as:370` / `HitCheck_obj.as` / `FlyingObj.as:202` 调用；`lifeControl()` 转发到 `Life_Power.as:112`。 |
| **影响面** | **最高杠杆点**：此处一行倍率即可改变全局手感。改 `counterMode` 相关的 ×1.2 会影响反击机制。 |
| **最小验证** | 训练模式固定同一招，读取 `out()` 或直接对比血条下降量；分别测试"被普通技击中"与"反击成功"两种情形。 |

### 3.4 伤害递减（同一次连段内）

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/DefineSprite_<id>/frame_<n>/DoAction.as` 中的 `var sf = function(r)`；共 **10 处**：`DefineSprite_38273/38274/5219/5222/5360/5390/6698/6699/6841/6843`（例：`DefineSprite_38273/frame_1/DoAction.as:3-11`）；调用点在 `HitCheck.as:255,262` 与 `HitCheck_obj.as:183,190` |
| **类/函数/变量** | `sf(r)`、`isMc`、`hitCount` |
| **职责** | 连段伤害递减公式：`var _loc1_ = r / (hitCount + 1)`，再四舍五入到 1/8 精度返回。即同一招第 N 次命中伤害降为 1/(N+1)。 |
| **依赖/调用** | `HitCheck.as:250-266` 在 `hitCount >= 1` 时用 `sf()` 覆盖 `hitValue.d_rate`。 |
| **影响面** | 想"取消连段伤害递减"就把 `sf` 直接 `return r;`。这 10 个剪辑可能被多个角色共用，**改一个不一定对所有角色生效**。 |
| **最小验证** | 训练模式用多段技连续命中，观察第 2 段起伤害是否不再下降。 |

### 3.5 血量与能量槽 `Life_Power`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/Life_Power.as`（563 行） |
| **类/函数/变量** | `init_life()`(:42)、`lifeControl(Obj, hpadd)`(:112-246)、`life_dec()`(:247)、`do_KO(role)`(:268)、`redBlood()`(:287)、`powerControl(Obj)`(:376)、`powerBurst()`(:488)、`startBurst()`(:498) |
| **职责** | 血条/能量条的实际数值容器。`lifeControl()` :154-156 `life_now -= d_rate * d_p`；血量 ≥300.1 时回满一条血并 `lifeBar_num++`(:161-177)；≤0 时扣一条血、≤0 则 `do_KO()`(:178-200)。`powerControl()` 管理超必杀能量与爆气条。 |
| **依赖/调用** | 被 `Role.as:3784/3798/3885` 与主控制器 `frame_1629/DoAction.as:1175` 调用。 |
| **影响面** | `d_p` 是伤害到血条的换算系数，是**改全局伤害最省事的位置**。`lifeBar_num_max` 与 `life_max` 决定血条上限。 |
| **最小验证** | 训练模式观察血条下降幅度；连续被打到破血以确认多条血逻辑与 `redBlood()` 血气触发。 |

### 3.6 无敌 / 不可防御判定

| 字段 | 值 |
| --- | --- |
| **路径** | `HitCheck.as:275-295`（`wanneng` 判定）、`:299-395`（wanneng 命中分支）、`:488`（普通分支） |
| **类/函数/变量** | `hitValue.wanneng`、`hitValue.nohit_status`、`hitValue.nohit_skills`、`hitValue.isGd`、`opp.nosh`、`opp.nobody`、`hitValue.checkTimes` |
| **职责** | `wanneng == true` 表示"必中/不可防御"：跳过 `noh` 检查(:285-291)，强制清空 `opp.nosh`(:301)，且**只对整个 `opp.mc` 判碰撞**(:302-304)而非只判 `body`——即空中/倒地状态也能被打中。普通攻击走 :488 分支，倒地且 `hitPos != "land"` 时不中。 |
| **依赖/调用** | `wanneng` 由招式数据（角色模块/skillList）设置，不在引擎里硬编码。 |
| **影响面** | 放宽 `nohit_status`/`nohit_skills` 会让某些招在原本免疫的招式后也能命中，可能造成连续命中异常。 |
| **最小验证** | 训练模式确认必中技对倒地、空中的对手都能命中；确认普通技对倒地对手不命中。 |

---

## 4. 角色状态机、输入处理、连招系统

### 4.1 状态机总控 `Role`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/role_corn/Role.as`（6,978 行 / 198,416 B；**5 份副本**） |
| **类/函数/变量** | `status_1`(:137) 动作名、`status_2`(:138) 站/空/落、`status_3`(:139) normal/attack/hurt/down、`status_4`(:140) hold、`status_6`(:142) nomove/all、`status_7`(:143) 命中特效；`normalList`(:146)、`normalPunchlKickList`(:147) |
| **职责** | 全部角色共用的状态机与物理。`status_1` 决定播放哪个剪辑，`status_2/3` 决定物理分支。物理常量集中在 `:128-198`：`airHits_max=4`、`frame_t=33`、`frame_t2=80`、`noCatchT2=12`、`farJumpT2=10`、`opp_hight=55`、`side_offset=15`、`hurtX/hurtY=10`、`dash_ex_enabled`/`roll_ex_enabled`/`charge_enabled`。 |
| **依赖/调用** | 上面所有章节都调用它。 |
| **影响面** | 改任一状态常量会影响**所有角色**（含 4 个包里的）。例如 `airHits_max` 是空中连段上限。 |
| **最小验证** | 至少用 3 个不同角色各测一遍基础移动/跳跃/受击。 |

### 4.2 输入处理 `KeyControl`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/role_corn/KeyControl.as`（446 行，**5 份完全一致**） |
| **类/函数/变量** | `init(key, skill1..4, char)`(:49)、`onKeyDown()`(:81-124)、`skillCheck(myKey)`(:150-211)、`actionCheck(myKey)`(:212-247)、`skill_normal(myKey)`(:248-361)、`keyChain_dir(key)`(:378-424)、`keyChain_act`/`sendKey`(:425-445)；常量 `time_interval=200`、`time_interval3=10`、`multi_interval=20`、`toAction_interval=10`(:40-43) |
| **职责** | 方向键与攻击键的采集与招式匹配。方向键先进 `input_array` 形成输入链(:396)，攻击键经 `multiKey` 累加后延迟 `multi_interval` 毫秒送入 `skillCheck()`(:427-429)；`skillCheck()` 用 `skill_mapping` 表把输入序列映射成招式名，调 `role.toSkill()`。同时 `p_l`/`k_l` 会被当作对应的 `p`/`k` 参与匹配(:163-170)。 |
| **依赖/调用** | 按键表来自 `frame_1629/DoAction.as:3383-3386 key_P1_proto/key_P2_proto`，经 `frame_1629:1-17 setKey()` 写入全局 `u/d/f/b/p/k_l...`，再由 `KeyControl.setKey()`(:61-80) 读入实例。 |
| **影响面** | `time_interval=200` 是**搓招宽容窗口**，改它直接影响手感与输入判定。`input_array.length > 6` 会 `shift()`(:420-423)，即最多保留 6 步输入。 |
| **最小验证** | 训练模式输入各种搓招；同时测双击方向（`doubleKey`）与 6 步以上的长输入。 |

> 注意：`frame_1629/DoAction.as:2850 coverSkill(role)` 会**整体替换** `newKeyControl` 的 `toAction`/`actionCheck`/`keyChain_dir` 等方法。改 `KeyControl.as` 的对应方法可能被此处覆盖。

### 4.3 连段/取消系统 `Combo_listener`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/role_corn/Combo_listener.as`（182 行，**5 份完全一致**）；角色数据在 `scripts/__Packages/<Name>_Combo.as`（24 个，如 `Kyo_Combo.as` 5,524 B） |
| **类/函数/变量** | `check_combo(status_1, skill)`(:19-46)、`check_combo1..4`(:47-103)、`start_combo(status_1, skill)`(:104-181)；表 `combo1`/`combo2`/`combo22`/`beCancled`/`s_cancle`/`noCancle`/`notTOcancle`/`skill_o`/`skill_o2` |
| **职责** | 判定"当前动作能否取消成下一招"，并在**指定帧窗口**内自动接招。`start_combo()` 取 `combo2[status_1]` 为起始帧、`skill_o[status_1]` 为结束帧，挂 `onEnterFrame` 轮询当前帧，命中窗口即调 `role_mc.skill_start(skill)`；超必杀取消时额外设 `powerDecType2 = "cancle"` 扣能量。 |
| **依赖/调用** | 由 `Role.as:5849-5855` 与 `:5859 comboClass.check_combo()` 调用；`comboClass` 在 `Role.as:35` 声明。 |
| **影响面** | 放宽取消窗口会让连段更容易、也更容易出现"打不出预期招式"。`beCancled`/`notTOcancle` 是白名单/黑名单。 |
| **最小验证** | 逐条测试受影响招式的取消链：起手 → 取消 → 目标招是否正确播放、能量是否正确扣除。 |

### 4.4 连段计数（伤害递减的输入源）

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/role_corn/Role.as:5385-5410`（`skillToEqual`）、`:5382`（`clearLists` 里 `skillNum = []`）、`:4551-4554`（`powerDec` 中 `skillNum--`） |
| **类/函数/变量** | `skillName[]`、`skillNum[]` |
| **职责** | 按招名统计本回合内各招式的使用次数。命中且对手处于非 normal/attack 时累加 `skillNum`(:5399)。`HitCheck.as:61/101` 用它做伤害归一化，:70-87 用它决定是否强制改硬直。 |
| **影响面** | `skillNum >= 10` 触发强制 `hurt6` + 固定击退，是**防止无限连的关键节流阀**。改这个值会显著改变连段稳定性。 |
| **最小验证** | 训练模式连续使用同一招 10 次以上，确认对手硬直行为在第 10 次发生变化。 |

---

## 5. CPU AI 与难度等级

### 5.1 难度分发

见 §1.3：`scripts/DefineSprite_1321_loaderchar/frame_1/DoAction.as:1-102` + 每个 `DefineSprite_<id>_role_<Name>/frame_<n>/DoAction.as`。难度值来自 `_level0.level`（1–5，存于 `setting.data.level`，默认 5）。

### 5.2 难度参数类

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/<Name>_AI_Lv1.as` … `_Lv5.as`（如 `Kyo_AI_Lv1.as` 9,011 B / `Kyo_AI_Lv5.as` 8,965 B） |
| **类/函数/变量** | 构造函数(:10-21)、`skill_init()`(:22-41)、`combo_init()`(:42+)；`combo_rate0`、`attack_rate0`、`hold_rate0`、`attack_s0`、`wait_frame0`、`combo_risk0`、`dis_array[]`、`skill_dis[]` |
| **职责** | 每个难度一个类，继承 `<Name>_AI`。`skill_init()` 定义 `dis_array`（距离档位 100/200/250/300/350/450/550/1000）与 `skill_dis[]`（每个距离下**允许 AI 使用的招式白名单**）。难度差异体现为概率与等待帧： |
| **对比实测** | `Kyo_AI_Lv1.as:15-20`：`combo_rate0=20, attack_rate0=22, hold_rate0=20, attack_s0=8, wait_frame0=100, combo_risk0=100`（犹豫 100 帧、连段率仅 20%）；`Kyo_AI_Lv5.as:15-20`：`combo_rate0=100, attack_rate0=65, hold_rate0=100, attack_s0=50, wait_frame0=0, combo_risk0=20`（不犹豫、连段率 100%）。 |
| **依赖/调用** | 由 `addPlayer()` 注册；`<Name>_AI_Lv2..Lv5` 内部还会 `owner.checkMustDefendSkill(opp.status_1)`（如 `Athena_AI_Lv2.as:192`）。 |
| **影响面** | **改难度手感的最安全位置** —— 只影响 CPU，不影响玩家。`skill_dis` 白名单可直接增删 AI 会使用的招式。 |
| **最小验证** | `setting.data.level` 设为 1 与 5 各打一局，观察 CPU 的犹豫与连段差异。 |

### 5.3 主 AI 行为类

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/<Name>_AI.as`（~120 KB × 42 个，最大 `Oswald_AI.as` 123,455 B） |
| **类/函数/变量** | `checkMustDefendSkill(oppSkill)`(:1767-1787)、`_level0.level` 相关分支(:3453 等) |
| **职责** | 单角色 AI 主逻辑。难度相关的关键行为之一：防御触发概率形如 `_loc2_ % (8 - _level0.level) == 0`(:3453) —— **难度 1 时每 8 次触发一次，难度 5 时每 3 次一次**。 |
| **依赖/调用** | 被 `<Name>_AI_Lv1..Lv5` 继承。 |
| **影响面** | 252 个 AI 类，**改一个只影响一个角色**；但每个文件都极大（约 3500+ 行），定位靠 grep 函数名。 |
| **最小验证** | 单角色对战，观察其对特定招式的反应差异。 |

### 5.4 "必须防御招式"表（陷阱）

| 字段 | 值 |
| --- | --- |
| **路径（声明）** | `scripts/frame_1629/DoAction.as:3374-3382` `mustDefendSkill` |
| **路径（真正生效处）** | `scripts/__Packages/<Name>_AI.as:1767-1787` `checkMustDefendSkill()` **函数内部的局部变量 `_loc3_`** |
| **职责** | 列出"对手使出这些招式时 AI 必须防御"的招式名。 |
| **⚠️ 关键发现** | 对全部 5 个 SWF 的所有 `.as` 做穷举搜索：`_root.mustDefendSkill` 与 `_level0.mustDefendSkill` 的**带限定引用数为 0**。`frame_1629:3374` 的这张表**没有任何代码读取，属于死数据**。AI 实际使用的是每个 `*_AI.as` 内部那份**更完整**的局部表（例如 `Kyo_AI.as:1771-1787` 含 `Ash`、`Igniz`、`Goenitz`、`Ryo`、`Krizalid`、`Nameless`、`Ryu` 等，而 `frame_1629` 的表只有 8 条）。 |
| **影响面** | 在 `frame_1629` 改 `mustDefendSkill` **不会有任何效果**（此前 `reports/modding_assessment.md` 将其列为 High confidence，此处更正为 **无效**）。要改 AI 的必防招，必须改**每一个** `<Name>_AI.as` 的 `checkMustDefendSkill()`。 |
| **最小验证** | 改动后让 CPU 对手用对应招式，观察 CPU 是否改变为防御行为。 |

---

## 6. 投射物与独立对象

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/skill/FlyingObj.as`（317 行；主程序 + 3 个包有，**`kofwing__11480055`（Kim）缺失**） |
| **类/函数/变量** | `init_hit(hitV)`(:25)、`moveX(Vx,_dir)`(:34)、`moveXY(Vx,Vy,_dir)`(:64)、`moveAim_obj(V,fromMC,toMC)`(:101)、`moveAim_pos(V,obj_x,obj_y,target_x,target_y)`(:136)、`hitCheck()`(:169-245)、`hitBack()`(:252)、`do_hitOpp`/`do_hitObj`(:262/273)、`onMoveOut()`/`onLand()`(:284/295) |
| **职责** | **通用飞行物框架**（波 projectile 类）。四种运动模式：匀速横移、二维移动、**朝对手追踪**、**朝指定坐标发射**。`hitCheck()` :214-239 实现**投射物对投射物**的碰撞：遍历对手 `skill_loader` 下的所有判定体，按 `obj_level` 大小决定谁先消失（相等则同归于尽）。`hitBack()` 实现弹反并交换攻守。 |
| **依赖/调用** | 构造函数 :20-23 从 `_root.role_mc` / `opp._parent.skill_loader` 取得上下文；`moveAim_*` 用 `ExtMath.angleOfLine` + `cosD/sinD` 计算方向。 |
| **影响面** | 越界判定为 `_level0.stage_with + 100` 或 `-100`(:56/:87/:121/:154)。`onMoveOut`/`onLand` 是投射物 SWF 可覆盖的钩子。 |
| **最小验证** | 用追踪型招式（如某些飞行道具）验证其确实朝对手移动；用两个飞行物对撞验证 `obj_level` 优先级。 |

> Kim 包缺少此文件：**给 Kim 加投射物时需先在其包内补上该类**，否则 `registerClass` 会失败。**未经运行验证**（未实际启动游戏确认 Kim 的投射物如何工作）。

---

## 7. Stage 选择、背景层、天气效果

### 7.1 场景注册表读取

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/DefineSprite_61566/frame_4/DoAction.as:8`（`bgInf.load("stage/list.txt")`）；`scripts/DefineSprite_61566/frame_1/DoAction.as:1-69` |
| **类/函数/变量** | `init(bgInf)`(:1-36)、`getDefault()`(:37-41)、`getRandomBg()`(:42-53)、`bgInf.onLoad`(:59-69) |
| **职责** | 解析 `stage/list.txt`。:3 `stageArray = bgInf.stageBG.split(",")` 得到可选场景名列表；:4 `_level0.bgArray = stageArray.concat()`；随后把所有 `key=value` 键值对写进 `_level0.bgMapping[角色名]`(:16) 并把已占用的场景从候选池移除(:22)。**加载失败时回落到 `_root.bgMappingDefault`**(:67)。 |
| **依赖/调用** | 消费方 `scripts/DefineSprite_2659/frame_1/DoAction.as:56`。 |
| **影响面** | ⚠️ **同名覆盖**：`_level0.bgArray` 先是"场景名**字符串**数组"，随后会被场景 SWF 导出的"图层**对象**数组"覆盖（见 `Stage_control2.as:76`）。**改场景名不要动 `bgArray` 这个变量名。** |
| **最小验证** | 直接编辑 `stage/list.txt` 的 `stageBG=` 行（**GBK 编码**），进游戏确认场景列表变化。 |

### 7.2 场景 SWF 加载

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/DefineSprite_2659/frame_1/DoAction.as:1-66` |
| **类/函数/变量** | `gotoBG(_bgID)`(:1)、`loadStage()`(:6-32)、`nextStage()`(:33)、`prevStage()`(:43)、`stageNameArray`(:56-61)、`stagePonit`(:63) |
| **职责** | 选择并加载场景。:29 `_loc2_.loadClip("stage/" + bgID + ".swf", loader)` —— **路径硬编码为 `stage/`，无多目录搜索、无回退**。:13 另有 `isLoadStage == false` 时的内嵌 `attachMovie("stage_"+bgID)` 分支（演示/嵌入模式）。:64 进入时随机挑一个场景。 |
| **依赖/调用** | 被 `frame_1638/DoAction.as:67` 同类逻辑调用。 |
| **影响面** | `stage/list.txt` 中指向 `stage2/其他地图/*` 的条目（如 `Kyo=Railway`）在 `stage/` 下无对应文件，会加载失败。 |
| **最小验证** | 把某个 `stage/*.swf` 重命名后同步改 `list.txt`，确认新场景能被加载。 |

### 7.3 背景分层与视差 `Stage_control2`

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/Stage_control2.as`（348 行） |
| **类/函数/变量** | `init(_stageW,_stageH,_bg)`(:26)、`init2()`(:36)、`startControl(c_target,rate_x,rate_y)`(:43-69)、`initObj()`(:74-129)、`resetPosY()`(:130)、`camera_center()`(:152)、`camera_role()`(:203)、`camera_P1/P2`(:241/:262)、`do_scroll(_Vx,_Vy)`(:283) |
| **类/函数/变量** | `bgObjArray = this.bgSource.bgArray`(**:76**) |
| **职责** | 消费场景 SWF 导出的 `bgArray`。每个图层记录形如 `{isBmd, mc, v_rate, isBase}`：`isBmd=true` 走 `BitmapData.copyPixels` 位图滚动(:88-113)，否则直接操作 MovieClip 深度(:114-126)；`v_rate` 是垂直视差速率，`isBase` 标记基准层。摄像机按 `rate_x`/`rate_y` 平滑跟随角色。 |
| **依赖/调用** | 场景 SWF 必须导出全局 `bgArray` 变量才能工作（83 个场景 SWF 均实现）。 |
| **影响面** | 改 `v_rate` 改变视差速度；改 `camera_*` 的跟随系数改变镜头手感。`this._lockroot = true`(:24) 允许该类访问 `_level0`。 |
| **最小验证** | 修改某场景 SWF 的 `bgArray` 中 `v_rate`，进该场景观察层间滚动速度差。 |

### 7.4 天气效果

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/DefineSprite_3266/frame_1/DoAction.as:1` |
| **类/函数/变量** | `_root.tq`、`stage/weather/<tq>.swf` |
| **职责** | 单行：`this.loadMovie("stage/weather/" + _root.tq + ".swf");`。天气类型完全由场景模块通过写 `_root.tq` 决定。 |
| **依赖/调用** | `_root.tq = ""` 在 `scripts/DefineSprite_2732_char_select_mc/frame_1/DoAction.as:10`（进选择界面即清空）。全树仅 `stage2__Haohmaru/scripts/scripts/DefineSprite_126/frame_1/DoAction.as:9` 设置 `_root.tq = "raining"`，:13 清空。 |
| **影响面** | ⚠️ **本版本天气基本是死的**：`stage/weather/` 目录不存在，且唯一会设置 `tq` 的模块在 `stage2/`（该目录在本发行版中也不存在，代码中也无任何 `stage2` 引用）。 |
| **最小验证** | 若要启用：创建 `stage/weather/raining.swf` 并让某场景在加载时写 `_root.tq = "raining"`。**未经运行验证**（原版此路径不可达）。 |

### 7.5 打击特效与超必杀演出

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/Stage_effect.as`（16,647 B） |
| **类/函数/变量** | `hitFire(_hitType,x,y,dir)`(:36)、`downEff`(:58)、`bgEff_start`(:66)、`bgShineHit`(:106)、`fgEff_start`(:117)、`superStart(s_type,time_f,dx,dy,bgType,roleName,dir,fromMC,role,charmax)`(:138)、`superStart2`(:200)、`superFreeze(f)`(:242)、`timeStop()`(:284) |
| **职责** | 战斗视觉演出。`superStart` 按 `s_type + "_bg"` 挂背景层、并按 `"superface_" + roleName + bgType` 组合角色专属超必杀背景(:166)。`superFreeze` 处理超必杀定格。 |
| **影响面** | 被 `Role.as` 的 `superStart`(:4427)、`doHurt`(:3659/3663 `KO_Freeze`、:3668 `hitFreeze`) 调用。 |
| **最小验证** | 触发一次超必杀，确认背景层与定格时序正常。 |

---

## 8. BGM、音效、音量与音乐切换

### 8.1 场景 BGM 管理

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/DefineSprite_1847_bgmControl_mc/frame_1/DoAction.as`（70 行）；加载注册表在 `frame_4/DoAction.as:4` |
| **类/函数/变量** | `init()`(:1-15)、`loadSound(char, chars)`(:16-54)、`playSound()`(:55-59)、`soundInf`(LoadVars)、`soundArray[]`、`stageSound` |
| **职责** | BGM 播放。`init()` 把 `soundInf["stage0"]`…连续扫进 `soundArray`（每场景一个 BGM 槽）。`loadSound(char,chars)` 用角色名查 `soundInf`；查不到则在 `soundArray` 里取第一个可用项兜底(:20-38)。**加载失败不崩溃**：`stageSound.onLoad` 里 `attachSound("blank")` 静音兜底(:39-45)。`playSound()` 用 `_level0.BgmVolume` 设定音量并 `start(0,1000)` 循环。 |
| **依赖/调用** | 数据来自 `sound/list.txt`（`&musicNum=50&` + 各角色→mp3 映射，41 条全部命中磁盘文件，**区分大小写**：`ChunLi.MP3` 与 `Iori3.mp3`）。 |
| **影响面** | 音量来自 `_level0.BgmVolume`（`frame_1629:3111`），由 `saveBgmVolume()`(`frame_1629:271-276`) 持久化。 |
| **最小验证** | **最安全的改动点**：往 `sound/` 放一个 mp3，在 `sound/list.txt` 加一行 `&<角色名>=<文件名>&`，进该角色场景确认播放。 |

### 8.2 系统音效与总音量

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1629/DoAction.as:3410-3524`（全部 Sound 对象）、`:57-103`（`setSound`/`soundStart`） |
| **类/函数/变量** | `allSound_snd`(:3410) 设总音量、`option_snd`(:3413 `loadSound("sound/main.mp3")`)、`soundControl`(:3523)；`volume = setting.data.volume`(:3406)；`soundOn`/`musicOn`(:3404-3405) |
| **职责** | 集中创建全部内嵌音效（`attachSound("round97")`、`attachSound("punch")` 等）与外部 mp3。`setSound()` 是静音开关（`setVolume(volume)` ↔ `setVolume(0)`）；`soundStart(obj)` 按需创建临时 `Sound` 并在 `fromMC.onUnload` 时停止。 |
| **依赖/调用** | 被各 UI 精灵与 `saveEffectVolume()`(:277-282) 调用。 |
| **影响面** | 注意 :3506-3508 **疑似原版 bug**：`pl_snd` 被连续两次赋值为 `"punch_l"`，`k_snd`（kick）赋值落在 `kl_snd` 对象上——即**踢击音效可能从未被正确挂载**。可顺手修正。 |
| **最小验证** | 触发对应音效确认；若修 :3507-3510 的赋值笔误，需确认 kick 音效恢复且不重复。 |

---

## 9. 配置文件、全局状态、资源管理

### 9.1 持久化设置（SharedObject）

| 字段 | 值 |
| --- | --- |
| **路径** | 创建于 `scripts/frame_1/DoAction.as:119`；读写于 `scripts/frame_1629/DoAction.as:171-512` |
| **类/函数/变量** | `setting = SharedObject.getLocal("kofwingEX1.2test")`；`saveFunc(name,value)`(:171)、`saveOption(...)`(:176)、`saveKey()`(:192)、`saveCombo()`(:197)、各 `saveXxx/getXxx` 对(:201-400)、`loadOption()`(:402)、`get_playedTimes()`(:456)、`loadDefault()`(:470)、`loadKey()`(:488)、`loadCombo()`(:502)；`settingArr`(:3115) |
| **职责** | **全部游戏设置与存档的落地点**，是一个 AS2 `SharedObject`（本地文件，非文本）。`settingArr`(:3115) 列出 19 个布尔/数值开关：`glowMode`、`glowType`、`XIIIeffOpen`、`XIIIeff`、`counterMode`、`BGM`、`defend`、`moreVs`、`moreVs3V3`、`flashing`、`glow2P`、`glow2Ptype`、`lan_set`、`loading`、`passKusanagi`、`BgmVolume`、`volume`、`showMoreMsg`、`SE_old`。此外还存 `level`、`cpu_op_mode`、`playTime`、`lifeBar_num`、`superPoint`、`key_P1/P2`、`comboRecord_array_*`、`passTimes`、`charGetObj`、`charPassObj` 等。 |
| **依赖/调用** | `setting.data[key]` 读写后必须 `setting.flush()` 才落盘（注意 `saveKey()`:192 与 `saveCombo()`:197 **没有**调用 `flush()`）。`loadDefault()`(:470-487) 定义首次运行默认值：`level=5`、`playTime=99`、`lifeBar_num=5`、`superPoint=0`。 |
| **影响面** | ⚠️ **不是文本文件，不能用编辑器改**。改默认值要改 `loadDefault()`。用户存档会让"改代码不生效"——验证前需清空该 SharedObject。 |
| **最小验证** | 删掉 SharedObject（或用 `flashwing.kilu.de` 的 Flash 存储面板）后重开游戏，确认回到默认值。 |

### 9.2 全局状态与网络开关

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1/DoAction.as:108-161`、`:1-33` |
| **类/函数/变量** | `onLine=false`(:108)、`testVer=false`(:109)、`isLoadRole/isLoadMusic/isLoadStage`(:110-112)、`netPlay`(:113)、`trialVer`(:115)、`wingUrl`(:116)、`game="kof_ex_v1.2"`(:145)、`quality1/quality2`(:147-148)；`saveLang()`(:1-14)、`getLan()`(:19-33) |
| **职责** | 全局开关与语言判定。`getLan()` 按 `System.capabilities.language` 判定 `cn`/`cn2`/`en`；`_quality` 决定画质（`game_setQuality`/`game_getQuality` 见 `frame_1629:122-161`）。`isLoadStage` 会切换 `DefineSprite_2659` 的加载分支。 |
| **依赖/调用** | `onLine` 影响 `frame_1629:3349-3352` 的 CPU 池。 |
| **影响面** | ⚠️ 多数开关在**顶层时间轴 frame_1 执行一次**，且这些变量随后被各帧当作全局变量使用。改动需放在 frame_1 或之后的帧才生效。 |
| **最小验证** | 改 `onLine`/`isLoadStage` 后重启游戏确认分支切换。 |

### 9.3 强制链接（改类的隐藏依赖）

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1629/DoAction.as:3535-3537` |
| **类/函数/变量** | `HitCheck;` / `HitCheck_obj;` / `role_corn.Role;` |
| **职责** | 三条**孤立表达式语句**，作用是强制链接器把三个类打进 SWF（否则 AS2 编译会当作无用代码剔除）。 |
| **影响面** | ⚠️ **删除或重命名这三个类会直接导致启动即崩**。同时这也说明：单独修改 `HitCheck.as` 而不在此处引用，类可能不会被打包。 |
| **最小验证** | 重编译后用 JPEXS 确认 SWF 中仍含这三个类定义。 |

### 9.4 可选调试输出

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1629/DoAction.as:720-722` |
| **类/函数/变量** | `function out(str) {}`（**空函数**） |
| **职责** | 全局调试输出入口。被 `Role.as`、`Life_Power.as` 等数百处调用（如 `Life_Power.as:185`）。函数体为空，所以**当前版本所有 `out()` 调用都是无操作**。 |
| **影响面** | **最佳调试切入点**：往里加一行 `trace(str)` 即可打开全游戏日志，不影响任何逻辑。 |
| **最小验证** | 填入 `trace(str)` 后跑一局，用 debug 版播放器看输出面板。 |

---

## 10. 运行时异常、远程请求、外部程序调用

### 10.1 外部程序调用（`fscommand exec`）

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1629/DoAction.as:104-121`（`fullScreen` / `exitFullScreen`） |
| **类/函数/变量** | `fscommand("exec","changedisplay1.exe")`(:114)、`fscommand("exec","changedisplay2.exe")`(:108、:119)、`fscommand("fullscreen", ...)` |
| **职责** | 切换全屏时调用外部 exe（推测为切换显示模式/分辨率），随后 `fscommand("fullscreen", bool)`。`fscommand("showmenu",true)` 另见 `frame_1/DoAction.as:150`。 |
| **依赖/调用** | **这两个 exe 不在本目录树中**。`fscommand("exec")` 在 projector 下会尝试执行同名文件。 |
| **影响面** | 外部 exe 缺失时通常静默失败，但属于**任意外部程序执行面**——若要清理联网/外联行为，这是首要下掉的地方。 |
| **最小验证** | 把 `fscommand("exec",...)` 注释掉后进游戏按全屏键，确认仅分辨率切换受影响、无报错。 |

### 10.2 广告框架（唯一的远程代码加载）

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/__Packages/FWAd_AS2.as`（162 行） |
| **类/函数/变量** | `swfDomain="gamecfg.flashwing.net"`(:7)、`swfFolder`(:8)、`frameworkSWFPath = ".../fwcfg/FrameworkAS2.swf"`(:9)、`showAd(_adValues)`(:16-62)、`loadFrameworkComplete`(:74)、`loadFrameworkError`(:78-101)、`close()`(:102) |
| **职责** | 广告 SDK。从 `http://gamecfg.flashwing.net/fwcfg/FrameworkAS2.swf` **远程加载并执行**一个 Flash 框架。⚠️ :19-20 同时调用 `System.security.allowDomain()` 与 **`System.security.allowInsecureDomain()`**，后者允许 HTTP 明文内容访问。加载失败时退化为轮询游戏是否加载完成(:82-101)。 |
| **依赖/调用** | 域名来源见 `frame_1/DoAction.as:91-107 getAdPath()`。 |
| **影响面** | **最高安全风险点**：远程 SWF + 不安全域放行。离线环境下 `loadFrameworkError` 会启动 `setInterval` 轮询(:80)。 |
| **最小验证** | 断网启动，确认不卡死（走 error 分支）；如需彻底移除，删除 `showAd()` 调用点即可。 |

### 10.3 远程 URL 与浏览器跳转

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1/DoAction.as:34-90`；另有 `frame_1629/DoAction.as:3342` `url_cheat` |
| **类/函数/变量** | `linkToHelp(anchor)`(:34-59)、`showSkillTable()`(:60-70)、`gotoWeb()`(:71-74)、`gotoQQGroup()`(:75-78)、`gotoTBWeb()`(:79-82)、`gotoWeb_kof()`(:83-86)、`gotoWeb_en()`(:87-90)；`wingUrl="http://www.flashwing.xyz"`(:116)、`wingRankPort="57983"`(:117) |
| **职责** | 全部为 `getURL(..., "_blank")` 打开浏览器。**离线时走本地 `readme.pdf` / `data/*.html`**(:42-49)，在线时走 `http://flashwing.kilu.de/help*.html`(:53/:57)。右键菜单项在 `frame_1:151-161` 按语言构建。 |
| **依赖/调用** | `url_cheat`(frame_1629:3342) 指向 `http://kof.flashwing.net/cheat_kof1_5.htm`。 |
| **影响面** | 均为用户主动点击触发（非自动联网）。`data/gotoWeb.html` / `gotoQQGroup.html` / `gotoTBWeb.html` **存在于磁盘**。 |
| **最小验证** | 离线点击帮助，确认落到本地 `readme.pdf` 而非卡死。 |

### 10.4 安全与调试相关

| 字段 | 值 |
| --- | --- |
| **路径** | `scripts/frame_1/DoAction.as:146`；`scripts/frame_1629/DoAction.as:3538-3542` |
| **类/函数/变量** | `System.security.allowDomain("*.flashwing.net")`；`testVer`(:109)、`debugTest`(frame_1629:1730/2018/2195)、`code.swf` 加载(:3538-3542) |
| **职责** | 域放行与调试开关。`testVer=true` 时 `attachMovie("code_mc")` 并 `loadMovie("code.swf", code_mc)` —— **`code.swf` 不在目录树中，且 `testVer` 默认 `false`**，故默认不可达。 |
| **影响面** | 把 `testVer` 改 `true` 会触发一次必然失败的加载。`debugTest` 会在 `HitCheck_obj.as:29-34` 显示判定框着色。 |
| **最小验证** | 置 `debugTest=true` 进训练模式，确认判定框可见（便于验证 §3 的碰撞改动）。 |

---

## 高风险修改点

按"改错导致游戏无法启动或行为严重异常"的程度排序。

| # | 位置 | 风险 | 原因 |
| --- | --- | --- | --- |
| 1 | `scripts/frame_1629/DoAction.as:3535-3537`<br>`HitCheck; HitCheck_obj; role_corn.Role;` | **致命** | 强制链接语句。删除/重命名任一类 → SWF 启动即崩。 |
| 2 | `scripts/__Packages/role_corn/Role.as:5753-5891` `toSkill()` | **高** | 所有角色共用的招式分发中枢。任意提前 `return undefined` 会让某招在某状态下整体消失，且影响 5 份副本。 |
| 3 | `scripts/__Packages/role_corn/Role.as:6004-6048` `toStatus()` | **高** | 状态机入口。`status_1` 字符串必须与角色剪辑标签严格一致，错则 `gotoAndStop` 静默失败。 |
| 4 | `scripts/__Packages/role_corn/Role.as:3676-3921` `checkHurt()` | **高** | 伤害/硬直唯一结算点，倍率链层层相乘，一处改动会同时影响防御、Counter、爆气、BOSS 战等全部模式。 |
| 5 | `scripts/__Packages/HitCheck.as:20-245` `start_hitCheck()` | **高** | 判定启动前的十余项修正（连段归一化、对拼、免疫表）。改错会造成"打不出伤害"或"无限连"。 |
| 6 | `scripts/__Packages/FWAd_AS2.as:16-62` | **高（安全）** | 远程加载 SWF 且调用 `allowInsecureDomain()`。移除前需确认无其他依赖。 |
| 7 | `scripts/__Packages/role_corn/KeyControl.as:40` `time_interval=200` | **中** | 搓招宽容窗口。改动直接改变全游戏手感，且可能被 `frame_1629:2850 coverSkill()` 覆盖。 |
| 8 | `scripts/__Packages/role_corn/Role.as:5385-5410` `skillToEqual()` / `skillNum` | **中** | 连段节流阀（≥10 触发强制硬直）。放宽会导致连段系统崩坏。 |
| 9 | `scripts/__Packages/skill/FlyingObj.as` | **中** | 主程序 + 3 包有、**Kim 包无**。只改主程序会让 Kim 行为不一致。 |
| 10 | `scripts/frame_1/DoAction.as:119` `setting` | **中** | SharedObject 非文本。改"配置"改这里无效，需改 `loadDefault()`(:470)。 |
| 11 | `scripts/frame_1629/DoAction.as:108-121` `fscommand("exec", ...)` | **中（安全）** | 外部程序执行面。下掉前确认全屏切换可接受。 |
| 12 | `scripts/__Packages/role_corn/Role.as:153-198` 物理常量 | **中** | `airHits_max`、`frame_t`、`opp_hight` 等影响**所有角色**，且有 5 份副本。 |
| 13 | `data/skillList.swf` 内联 XML | **中** | 同时是 UI 与数据源，改坏会导致游戏与出招表一起失效。 |
| 14 | `scripts/__Packages/CharSelect/CharSelect_icon.as:36-37` | **低—中** | `nameList` 与 `nameListNormal` 需同步改；漏改一个会出现有图标但选不到、或随机到不存在的角色。 |
| 15 | `scripts/frame_1629/DoAction.as:3374-3382` `mustDefendSkill` | **低（无效）** | ⚠️ **实测为死数据**，带限定引用数为 0。改它没有任何效果——真正的表在每个 `<Name>_AI.as:1767+` 内部。 |
| 16 | `scripts/__Packages/<Name>_AI_Lv1..Lv5.as` | **低** | 只影响 CPU 行为，是调难度最安全的地方。 |
| 17 | `sound/list.txt` / `stage/list.txt` | **低** | 纯文本。`sound/list.txt` **区分大小写**；`stage/list.txt` 为 **GBK 编码**，用 UTF-8 编辑器保存会破坏全部中文场景名。 |

## 跨文件同步清单（改完记得逐项核对）

| 改动类型 | 必须同步的文件 |
| --- | --- |
| 碰撞/伤害/状态机 | 主程序 + 4 个包各 1 份，共 5 处。路径 `kofwing__<11480055\|16695748\|18464326\|8492959\|21256864>/scripts/scripts/__Packages/{HitCheck.as, HitCheck_obj.as, role_corn/Role.as}` |
| 输入 | `role_corn/KeyControl.as` 5 处（内容完全一致，直接复制覆盖） |
| 连段表 | `role_corn/Combo_listener.as` 5 处 + 各角色 `<Name>_Combo.as`（**只在主程序有**） |
| 投射物 | `skill/FlyingObj.as` 4 处（**Kim 包需新建**） |
| AI 难度 | `<Name>_AI.as` 与 `<Name>_AI_Lv1..Lv5.as`，**只在拥有该角色的那个 SWF 里** |
| 角色表 / 按键 | `scripts/frame_1629/DoAction.as` 单一文件即可 |

## 明确无法从静态代码确定的事项

| 事项 | 状态 |
| --- | --- |
| `char/<Name>.swf` 的运行时投送方式 | **未经运行验证**。四个 EXE 内嵌包在结构上就是 `char/` 模块（各含 1 个 `role_*` 剪辑 + 引擎副本），但没有任何加载调用按名字引用它们；`loadClip("char/"+name+".swf")` 只认磁盘路径，而 `char/` 目录在本发行版中不存在。 |
| `stage2/` 是否应被复制进 `stage/` | **未经运行验证**。代码中 `stage2` 零引用。 |
| `code.swf` 的用途 | **未经运行验证**。仅在 `testVer=true` 时加载，且该文件不存在。 |
| `musicNum=50` 与实际 44 个 mp3 的差异 | **未经运行验证**。可能是历史遗留计数。 |
| `skillList.swf` 的表结构是否与游戏判定完全一致 | **未经运行验证**。其 `normal/easy/skill` 字段语义需实机对照确认。 |
| Kim 角色缺少 `FlyingObj.as` 的实际影响 | **未经运行验证**。需实机确认 Kim 的投射物是否通过其他类实现。 |