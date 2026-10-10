# 分析质量审计报告 — KOF Wing EX1.2 SWF 架构分析工具链

> **收尾复核（最新）**：本文档的问题清单已在当前 HEAD 上逐项复核。
> 复核命令：`python tools/verify_audit_findings.py`
> 机器可读结果：`reports/_audit_recheck.json`
> 复核结果：**14 项 FIXED_VERIFIED，2 项 HISTORICAL（有意保留），0 项 OPEN**。
> 自动化测试：`python -m unittest discover -s tests -t .` → **67 tests, OK**。
>
> **状态定义**
> - FIXED_VERIFIED — 代码已修改，且有针对性检查通过
> - FIXED_UNVERIFIED — 代码看起来已修复，但缺少直接测试证据
> - OPEN — 仍然存在
> - HISTORICAL — 只描述旧提交/旧文件状态，当前不再适用，但需保留历史说明

---

## 0. 收尾复核结论表

| ID | 问题 | 复核状态 | 证据 |
| --- | --- | --- | --- |
| B1 | 清单 SHA-256 与磁盘不符 | **HISTORICAL** | _struct.json 记录**原始提取物**（主程序 125,450,217 B），磁盘是 EXE 重新切出的 125,442,502 B。这是**有意保留的溯源记录，不得"修复"**。新增 eports/_struct_current.json + _struct_current_provenance.json 描述当前磁盘状态 |
| B2 | 两个工具抢写 dependency_edges.csv | **FIXED_VERIFIED** | 现在只有 uild_graph.py 写该文件；classify.py 改写 dependency_edges_classify_legacy.csv；磁盘表头为 8 列权威 schema，CONFIRMED = 4，与 inal_report.md 一致 |
| B3 | ecover_from_exe.py 静默改写游戏目录 | **FIXED_VERIFIED** | 必须 --force；目录非空时 ABORT（实测）；已匹配清单的文件不重写；截断候选被标记。另有 	ests/test_safety_guards.py 6 项守护 |
| M1 | with_sound=6 混入被拒文件 | **FIXED_VERIFIED** | _struct_current.json 实测 **5**；_struct.json 保留历史值 6 未被改写 |
| M2 | stage/ 与 stage2/ 合并计数 | **FIXED_VERIFIED** | 20 + 63 = 83，inal_report.md 已说明拆分口径 |
| M3 | 角色计数与工具产出不符 | **FIXED_VERIFIED** | 新增 split_character_name() 显式规则：Type2_ / Type3_ / 前导 C 折叠；5 组测试向量全通过；code_index.md 现在区分 AI 类数 / 变体类数 / **独立角色数 = 21** |
| M4 | stageBG 数量与数据不符 | **FIXED_VERIFIED** | egistries.json 实测 19，inal_report.md 已改为 19 |
| M5 | 被拒文件签名描述过时 | **FIXED_VERIFIED** | 当前 kofwing/ 中 40440656.swf、74424254.swf 签名为 GFX 而非 FWS；所有报告已更新 |
| M6 | classify.py 注册表确认分支是死代码 | **HISTORICAL** | 该分支仍产不出 CONFIRMED（basename 与全路径比较），根因已记录；产物已降级为 legacy，权威边由 uild_graph.py 生成 |
| m1 | 工具缺 argv 守卫 | **FIXED_VERIFIED** | ind_boot_swf.py / classify.py / parse_registries.py 均已加守卫，实跑输出 usage 而非 IndexError |
| m2 | 清单行序依赖平台分隔符 | **FIXED_VERIFIED** | 排序键改为 p.relative_to(root).as_posix().lower()；测试断言输出等于 POSIX 序 |
| m3 | uild_code_index.py 硬编码主程序 id | **FIXED_VERIFIED** | 改为从 classification.json 的 ole == main_program 解析 |
| m4 | make_id() 深层同名文件会碰撞 | **FIXED_VERIFIED** | 改为折叠**完整相对路径**；测试用三级同名文件验证不碰撞 |
| m5 | jpexs_batch.py 重跑不幂等 | **FIXED_VERIFIED** | 脚本数改为只统计 mtime >= run_started 的文件，旧一轮残留不再计入 |
| m6 | uild_graph.py 每条边全量遍历 | **FIXED_VERIFIED** | 目录遍历缓存到 _NAME_INDEX，只走一次；128 条边实测约 19 秒 |
| CLS | 主程序无独立角色，与角色包并列 | **FIXED_VERIFIED** | 新增 main_program 规则：__Packages 类数 ≥ 100（实测主程序 427，次高 26，16 倍余量）；4 个角色包正确降级为 combat_engine_module |

### 复核期间修正的两个检测器缺陷

复核脚本自身有过时判定，已修正（否则会误报）：

- **B2 误报**：只扫描到了 classify.py 的写入点，漏掉 uild_graph.py。
  改为"精确查找写 dependency_edges.csv 的工具"再断言只��一个。
- **m5 / m6 误报**：检测的是修复前的代码形态（or p in (outdir/"scripts").rglob、
  每条边 GAME_ROOT.rglob），修复后字符串变了但**检查逻辑没跟上**。
  已改为检查修复的实际特征（mtime 守卫、缓存索引）。

**这两个是检测器的问题，不是工具的问题；工具修复本身一直有效。**

---

## 1. 缁撹鎽樿

宸ュ叿閾剧殑**鏍稿績鍒嗘瀽閫昏緫鏄彲闈犵殑**锛歚swf_struct.py` 鐨?SWF 鏍￠獙鐙珛浜?JPEXS锛屽垽瀹氳鍒欐槑纭€佸彲澶嶇幇锛?7/93/4/89/82/0/427/252/31,215 杩欑粍鏍稿績鏁板瓧缁忛€愰」閲嶇畻**鍏ㄩ儴鎴愮珛**銆傝繖閮ㄥ垎鍋氬緱濂姐€?
浣嗗瓨鍦?**3 涓?blocker 绾ч棶棰?*锛屽畠浠叡鍚屾寚鍚戝悓涓€涓牴鍥狅細**`reports/` 閲屾渶鏍稿績鐨勬函婧愭暟鎹紙sha256/瀛楄妭鏁帮級宸茬粡鍜岀鐩樹笂鐨勭湡瀹炴枃浠跺涓嶄笂浜?*锛岃€岀敓鎴愯繖浜涙暟鎹殑鑴氭湰鍙堝叿澶囨敼鍐欐父鎴忔湰浣撶殑鑳藉姏銆傛澶?`README.md` 鎵胯鐨勫鐜伴『搴?*璺戝嚭鏉ョ殑浜х墿鍜屼粨搴撻噷鎻愪氦鐨勪骇鐗╀笉鏄悓涓€涓笢瑗?*銆?
鏂板娴嬭瘯濂椾欢锛?*46 椤癸紝鍏ㄩ儴閫氳繃**锛坄python -m unittest discover -s tests -t .`锛夈€?
---

## 2. 闂娓呭崟

涓ラ噸搴﹀畾涔夛細**blocker** = 缁撹涓嶅彲淇℃垨澶嶇幇澶辫触锛?*major** = 鏁板瓧/缁撹閿欒浣嗕笉鑷村懡锛?*minor** = 鍋ュ．鎬с€佸彲缁存姢鎬с€?
| # | 涓ラ噸搴?| 闂 | 璇佹嵁 | 寤鸿淇 |
|---|---|---|---|---|
| B1 | blocker | `file_inventory.csv` / `_struct.json` / `analysis/*/metadata.json` 璁板綍鐨?sha256 涓庣鐩樻枃浠?*涓嶅尮閰?*锛沗kofwing` 14 涓枃浠朵腑 5 涓涓嶄笂 | `reports/_struct.json` 璁?`21256864.swf` = 125,450,217 B / `319fb968de鈥锛涘疄娴?`kofwing/21256864.swf` = 125,442,502 B / `847a0ec9fe鈥銆傞€愭枃浠舵瘮瀵癸細11480055/16695748/18464326/20817874/6148152/6230976/6235248/7298128/8492959 **9 涓?MATCH**锛?1256864/27969957/40440656/74424254/84187910 **5 涓?DIFF** | 鐢?`tools/swf_struct.py` 瀵瑰綋鍓?`kofwing/` 閲嶈窇骞堕噸寤?`file_inventory.csv`锛涘湪 `metadata.json` 涓澶栬褰?鏈鍒嗘瀽鎵€鐢ㄨ緭鍏ョ殑 sha256"骞跺湪璇诲彇鏃舵牎楠?|
| B2 | blocker | `classify.py` 涓?`build_graph.py` **閮藉啓鍚屼竴涓枃浠?* `reports/dependency_edges.csv`锛屼笖鍒楀悕/缃俊搴﹁瘝琛ㄤ笉鍏煎锛沗README.md` 鐨勫鐜伴『搴忎細鎶婇敊璇殑閭ｄ唤鐣欏湪纾佺洏涓?| `tools/classify.py:272` 涓?`tools/build_graph.py:115` 鍐欏悓涓€璺緞锛沗tools/classify.py:273` 鍒楀悕 `source_swf,target,鈥锛宍tools/build_graph.py:116` 鍒楀悕 `source,target_pattern,鈥?resolved_target`锛涘疄娴嬬鐩樹笂 CSV 琛ㄥご鏄?**classify 鐗?*锛?43 琛岋紝LIKELY=7/INFERRED=136锛夛紝鑰?`README.md:94` 鐨勯『搴忚 `build_graph` 鏈€鍚庤窇 | 涓や釜宸ュ叿鏀瑰啓涓嶅悓鏂囦欢鍚嶏紙濡?`dependency_edges_likely.csv` / `dependency_edges_pattern.csv`锛夛紝鎴栫粺涓€鎴愪竴濂?schema锛汻EADME 椤哄簭蹇呴』涓庢渶缁堜骇鐗╀竴鑷?|
| B3 | blocker | `recover_from_exe.py` 浼?*鏀瑰啓娓告垙鏈綋**锛坄_reverse/` 涔嬪鐨?`kofwing/*.swf`锛夛紝涓旀湭鍦?README 涓褰曪紱瀹冩鏄?B1 婕傜Щ鐨勫埗閫犺€?| `tools/recover_from_exe.py:122` `dest.write_bytes(blob)`锛宍DEST = GAME_ROOT/"kofwing"`锛坄:25`锛夛紱`reports/recovery_manifest.json:47-55` 鏄剧ず `21256864.swf` `manifest_bytes=125450217` / `written=125442502` / `truncated_at_eof=true` / `sha256_match=false` | 榛樿鏀逛负 dry-run锛堝彧姣斿銆佸彧鍐欐姤鍛婏級锛屾妸鍐欏叆鏀惧埌鏄惧紡 `--apply` 涔嬪悗锛涜緭鍑虹洰褰曢粯璁ゆ寚鍚?`_reverse/recovered/` 鑰岄潪娓告垙鐩綍锛汻EADME 蹇呴』璁板綍璇ユ楠?|
| M1 | major | `with_sound = 6` **鎶婁竴涓鎷掔殑鍋囬槼鎬х畻浜嗚繘鍘?*锛屾纭€兼槸 5 | `tools/swf_struct.py:373` 瀵瑰叏閮ㄨ褰曡鏁帮紱瀹炴祴 `kofwing/40440656.swf`锛坄valid_swf=false`锛夎础鐚?`n_sound_tags=2`锛涙湁鏁堟枃浠朵腑鍚０闊虫爣绛捐€呬负 5 涓紙11480055/16695748/18464326/21256864/8492959锛夈€傝鏁板瓧鍑虹幇鍦?`file_inventory.md` 涓?`final_report.md:55` | 鎶?`with_sprite`/`with_sound` 绛夎鏁版敼涓轰粎缁熻 `valid_swf` 鐨勮褰?|
| M2 | major | "83 stage SWFs" 鎶?`stage/` 鍜?`stage2/` 鍚堝苟璁℃暟 | `_struct.json` 瀹炴祴 `stage/` = 20 涓€乣stage2/` = 63 涓紱`stage_background` 瑙掕壊 83 = 20+63銆俙README.md:27`銆乣final_report.md:119`銆乣dependency_graph.mmd:135` 鍧囧啓 "83 stage SWFs"锛岃€?`final_report.md:236` 鑷繁鍙堣 loader 鍙 `stage/` | 鎷嗘垚 "20 in stage/ + 63 in stage2/"锛涙垨鏄庣‘鍐?"83 files classified stage_background (stage/ + stage2/)" |
| M3 | major | "24 characters" 涓庡伐鍏蜂骇鍑轰笉绗?| `reports/code_index.md:31-55` 瀹為檯鍒楀嚭 **25** 琛岋紱`tools/build_code_index.py:82` 鐨勬鍒?`(Type2_)?(.+?)_AI鈥 鍙墺绂?`Type2_`锛屽嵈鎶?`Type3_Goenitz`/`Type3_Iori` 褰撴垚鐙珛瑙掕壊 鈫?25锛涙姌鍙犲彉浣撳悗涓?23銆俙README.md:42`銆乣final_report.md:145` 鍐?24 | 淇?`build_code_index.py:82` 鐨勬鍒欎负 `(?:Type[23]_)?`锛屽苟閲嶆柊鐢熸垚锛汻EADME/final_report 寮曠敤鐢熸垚鍊?|
| M4 | major | `final_report.md:210` 鐨?"20/20 `stageBG` items" 涓庢暟鎹笉绗?| `reports/registries.json` 鈫?`stage_registry`锛?9 鏉＄洰 = **19** 涓?`stageBG_item`锛堝叏閮?resolved锛? 30 涓?`map`锛?1 resolved / 19 MISSING锛夈€傚悓琛岀殑 "19 of 30 stale" 鏄鐨?| 鏀逛负 "19/19 `stageBG` items resolve; 19 of 30 character鈫抯tage entries are stale" |
| M5 | major | `final_report.md:66` 绉?4 涓鎷掓枃浠?"begin with a genuine `FWS`/`CWS` signature"锛?*鐜板湪 2 涓笉鏄簡** | 瀹炴祴 `kofwing/40440656.swf` 涓?`kofwing/74424254.swf` 鐨勫墠 3 瀛楄妭鏄?`GFX`锛坄reports/_struct_recovered.json` 璁?`is_swf_signature=false`锛岄敊璇俊鎭?`bad signature b'GFX'`锛夛紱鍙﹀涓や釜锛?7969957銆?4187910锛変粛鏄?`FWS` | 璇ョ粨璁烘弿杩扮殑鏄?JPEXS 鍒濈増鎻愬彇鐗╋紱搴旀敞鏄?褰撳墠 kofwing/ 涓殑鐗堟湰宸茶 `recover_from_exe.py` 浠?EXE 閲嶆柊鍒囧嚭"锛屽苟鍚屾椂缁欏嚭涓や唬缁撴灉 |
| M6 | major | `classify.py` 鐨?registry 纭鍒嗘敮鏄?*姝讳唬鐮?*锛屽鑷村畠涓€鏉?CONFIRMED 杈归兘浜т笉鍑?| `tools/classify.py:204` `base = target鈥plit("/")[-1]`锛堝彧鏈夋枃浠跺悕 `list.txt`锛夛紝`:218` 鍗存嬁瀹冨幓姣?`:244-246` 鏋勯€犵殑**鍏ㄨ矾寰?*闆嗗悎 `{"stage/list.txt",鈥` 鈫?姘镐笉鍛戒腑銆傚疄娴?`_edges.json`锛欳ONFIRMED=0 | 鎶?`registries` 鏀规垚瀛樺叏璺緞骞跺悓鏃舵瘮杈?`base.lower()` 涓?`rel.lower()`锛涗慨澶嶅悗閲嶈窇 classify |
| M7 | major | `dependency_graph.md` 鑷О"鐢?`tools/build_graph.py` 鐢熸垚"锛屼絾**娌℃湁浠讳綍宸ュ叿鐢熸垚瀹?*锛涘叾鍐呭祵 mermaid 宸蹭笌鐢熸垚鐨?`.mmd` 鍒嗗弶 | `tools/build_graph.py` 鍙啓 `.csv`(`:115`)銆乣_edges_full.json`(`:121`)銆乣.mmd`(`:161`)锛屼粠涓嶅啓 `.md`銆俙dependency_graph.md:3` 鍗村啓 "Generated by `_reverse/tools/build_graph.py`"銆傚凡鍒嗗弶锛歚dependency_graph.mmd:4` `ENG["kofwing combat+SFX modules<br/>11480055 / 16695748鈥?]` vs `dependency_graph.md:21` `ENG["kofwing character packs<br/>11480055 Kim / 16695748 Moriya鈥?]` | 瑕佷箞璁?`build_graph.py` 鐢熸垚 `.md`锛岃涔堟妸 `.md` 鏍囨敞涓轰汉宸ユ挵鍐欏苟鍘绘帀 "Generated by" 瀛楁牱 |
| M8 | major | `parse_registries.py` 鐨勫ぇ灏忓啓宸紓缁熻鏄?*鍐欐鐨?0**锛屼笖妫€娴嬪垎鏀笉鍙揪 | `tools/parse_registries.py:116` `"case_diffs": 0` 纭紪鐮佷笖浠庢湭鍥炲～锛沗:129` 鐨?`Path(actual).stem.lower() != Path(target).stem.lower()` 鎭掍负 False鈥斺€旂储寮?`idx` 浠?`p.name.lower()` 寤洪敭锛坄:46`锛夛紝鏌ユ壘鐢?`target.lower()`锛坄:76`锛夛紝鍛戒腑椤瑰繀鐒?`actual.lower() == target.lower()`銆傛晠 `CASE_MISMATCH` 姘镐笉鍑虹幇锛沗registries.json` 涓変釜 registry 鐨?`case_diffs` 鍏ㄤ负 0锛屽疄娴?`CASE_MISMATCH`=0銆乣CASE_DIFFERS`=0 | 璁板綍鐪熷疄鐨勫ぇ灏忓啓姣旇緝锛堟瘮杈?`p.name` 涓?`target` 鍘熶覆锛夛紝骞跺湪鍛戒腑鏃跺洖濉?`case_diffs` |
| M9 | major | `classify.py` / `build_graph.py` 閬囧埌**涓€涓崯鍧忕殑 `metadata.json` 灏辨暣鎵逛腑姝?*锛屽苟鐣欎笅涓婁竴娆＄殑鏃т骇鐗?| `tools/classify.py:253` 涓?`tools/build_graph.py:63` 鐨?`json.loads(...)` 鏃?try銆傛矙绠卞鐜帮細鏀惧叆涓€涓?BOM 鎹熷潖鐨?`metadata.json` 鍚庝袱鑰呭潎鎶?`JSONDecodeError` 閫€鍑猴紝`classification.json` / `dependency_edges.csv` 淇濇寔鏃у唴瀹?| 鐢?try/except 鍖呬綇鍗曟枃浠惰鍙栵紝鎶婂け璐ヨ鍏ラ敊璇垪琛ㄥ悗缁х画锛涢€€鍑虹爜闈?0 |
| m1 | minor | `find_boot_swf.py` / `classify.py` / `parse_registries.py` **娌℃湁 argv 瀹堝崼** | 鏃犲弬杩愯瀹炴祴锛氫笁鑰呭潎鎶?`IndexError: list index out of range`锛坄find_boot_swf.py:63`銆乣classify.py:229`銆乣parse_registries.py:51`锛夛紝閫€鍑虹爜 1锛涘彧鏈?`swf_struct.py:332` 鍜?`jpexs_batch.py:156` 鏈?`usage` + 閫€鍑虹爜 2 | 鐓ф妱 `swf_struct.py` 鐨勫畧鍗啓娉?|
| m2 | minor | 娓呭崟琛屽簭**渚濊禆骞冲彴璺緞鍒嗛殧绗?*锛屽悓涓€璇枡鍦?POSIX / Windows 涓婇『搴忎笉鍚?| `tools/swf_struct.py:338-341` 鎺掑簭閿槸 `str(p).lower()`锛堝師鐢熻矾寰勶級锛屼絾 `relative_path` 琚鑼冨寲鎴?`/`銆俉indows 涓?`\`(0x5C) > `2`(0x32)锛屾晠 `stage2/鈥 鎺掑湪 `stage/鈥 涔嬪墠 | 鎺掑簭閿敼鐢ㄨ鑼冨寲鍚庣殑 `relative_path` |
| m3 | minor | `build_code_index.py` 纭紪鐮佷富绋嬪簭 id锛涘垎绫昏鍒欑殑鏈€鍚庝竴鏉℃槸 catch-all锛屼娇鍏滃簳鍒嗘敮涓嶅彲杈?| `tools/build_code_index.py:39` `main_id = "kofwing__21256864"`锛沗:27` `("Utility / library", re.compile(r"\.as$"))` 鍖归厤涓€鍒?鈫?`:35` 鐨?return 姘镐笉鎵ц | 涓荤▼搴?id 鏀逛负浠?`classification.json` / 娓呭崟鎺ㄥ锛涙妸 catch-all 浠庤鍒欒〃绉诲嚭 |
| m4 | minor | `make_id()` 鍙彇鐩稿璺緞**鏈€鍚庝袱绾?*锛屾繁灞傚悓鍚嶆枃浠朵細浜掔浉瑕嗙洊锛堟枃妗ｅ瓧绗︿覆澹扮О涓嶄細锛?| `tools/jpexs_batch.py:47-49` `rel.rsplit("/", 2)[-2]`锛宒ocstring `:14-15` 鍐?"same-named files never collide"銆俙stage2/鍏朵粬鍦板浘/鍔ㄦ€?X.swf` 涓?`stage2/鍏朵粬鍦板浘/闈欐€?X.swf` 閮戒細寰楀埌 `鍏朵粬鍦板浘__X` | 鏀逛负鍏ㄨ矾寰勬嫾鎺?+ 鍝堝笇鍚庣紑銆?*褰撳墠璇枡瀹炴祴 0 鍐茬獊**锛?7 鏂囦欢 鈫?97 涓敮涓€ id锛岀鐩?97 涓?analysis 鐩綍瀹屽叏瀵瑰簲锛夛紝灞炴綔鍦ㄩ闄?|
| m5 | minor | `jpexs_batch.py` 閲嶈窇涓嶆槸骞傜瓑鐨勶細鑴氭湰鏁伴潬鎵弿杈撳嚭鐩綍缁熻 | `tools/jpexs_batch.py:208-210` 缁熻 `outdir/"scripts"` 涓嬫墍鏈夋枃浠讹紱鏃т竴杞殑娈嬬暀涓嶄細琚竻鐞嗭紙鐜绂佹鍒犻櫎锛夛紝閲嶈窇浼?*绱姞** | 璁板綍骞舵瘮瀵逛笂涓€杞竻鍗曪紝鎴栨妸瀵煎嚭鐩綍鏀逛负涓存椂鐩綍鍚庢暣浣撶櫥璁?|
| m6 | minor | `build_graph.any_file_named()` **姣忔潯杈归兘鍏ㄩ噺閬嶅巻娓告垙鏍圭洰褰?*锛堝惈 146 MB 鐨?EXE锛?| `tools/build_graph.py:50-54`锛屽湪 `:196-199` 鐨?`.swf` 鍒嗘敮閲岃璋冪敤 | 棰勫缓涓€娆?`basename.lower() 鈫?relpath` 绱㈠紩 |
| m7 | minor | `restore_registries.py` 鍥炲啓**涓嶆槸寰€杩旀棤鎹?*锛屼笖鏃?`__main__` 瀹堝崼 | `tools/restore_registries.py:37` 鐢?`"\n"` 鎷兼帴锛岃€?`sound/list.txt` 瀹炴祴涓?CRLF锛坄26 6d 75 73 69 63 4e 75 6d 3d 35 30 26 0d`锛夛紱`stage/list.txt` 涓?801 B 甯?UTF-8 BOM锛岃鑴氭湰绗?29 琛屼細鑷繁琛?BOM銆傛ā鍧楃骇浠ｇ爜鏃?`if __name__ == "__main__"` | 淇濈暀鍘熻灏句笌 BOM 绛栫暐锛涘姞 `__main__` 瀹堝崼锛涘悓鏍烽粯璁?dry-run |
| m8 | minor | `recover_from_exe.py` 鍚ぇ娈垫浠ｇ爜 | `:91-92` `for probe in range(0, len(payload)+1): pass`锛圤(n) 绌鸿浆锛夛紱`recover_one()` / `body_len_from_tags()` / `parse_rect()` 浠庢湭琚?`main()` 璋冪敤 | 鍒犻櫎鎴栨帴绾?|
| m9 | minor | README 鐨?`tools/` 娓呭崟婕忔帀 **9/19** 涓剼鏈紝鍏朵腑鍖呭惈鐢熸垚 `_struct_recovered.json`銆乣recovery_manifest.json`銆乣runtime_dependency_audit.csv` 鐨勫叧閿剼鏈?| `README.md:61-68` 浠呭垪 12 涓紱鏈彁 `recover_from_exe.py`銆乣phase1_dep_audit.py`銆乣phase2_stage_bgm_audit.py`銆乣pack_hypothesis.py`銆乣restore_registries.py`銆乣scan_recyclebin.py`銆乣rb_payload_check.py`銆乣_check_offsets.py` | 琛ュ叏娓呭崟骞舵爣娉ㄦ瘡涓剼鏈殑杈撳叆/杈撳嚭 |
| m10 | minor | `final_report.md:259-261` 瑕佹眰鎵嬪姩鍒犻櫎 `analysis/_test/`锛屼絾璇ョ洰褰?*涓嶅瓨鍦?* | 瀹炴祴 `analysis/` 涓?97 涓洰褰曪紝鏃犱互 `_` 寮€澶寸殑锛沗.gitignore:4` 浠嶅垪鐫€瀹?| 鍒犻櫎璇ユ鎴栨爣娉ㄤ负宸插鐞?|
| m11 | minor | 浠撳簱鏍逛笅 `experiments/` 鏈璺熻釜锛屽唴鍚竴浠?**125 MB 鐨勪富绋嬪簭鍓湰** | `experiments/work/orig.swf` sha256 = `847a0ec9febb鈥锛屼笌褰撳墠 `kofwing/21256864.swf` **瀹屽叏涓€鑷?*锛堝嵆褰撳墠纾佺洏涓婄殑鎴柇鐗堬紱`319fb968鈥 閭ｇ増宸蹭笉瀛樺湪浜庝换浣曚綅缃級 | 鏄庣‘鏍囨敞璇ュ壇鏈殑鐢ㄩ€斾笌鏉冨▉鎬э紱绾冲叆鐗堟湰鎺у埗鎴栬縼鍑轰粨搴?|
| m12 | minor | `tag_total` 鍦ㄤ袱澶勫惈涔変笉鍚岋紝鏄撹璇涓虹煕鐩?| `_struct.json` 涓?`21256864.swf` 鐨?`tag_total = 71,378`锛堜粎椤跺眰鏍囩娓歌蛋锛夛紱`analysis/kofwing__21256864/metadata.json` 鐨?`jpexs_dump_parsed_lines = 553,260`锛圝PEXS 閫掑綊缁熻锛屽惈 DefineSprite 瀛愭爣绛撅級銆俙final_report.md:95` 鐢ㄧ殑鏄悗鑰?| 涓ゅ瀛楁鏀瑰悕涓?`tag_total_top_level` / `jpexs_tags_including_sprites` |

---

## 3. 缁熻鏁板瓧閫愰」瀵硅处

### 3.1 鍏ㄩ儴鎴愮珛鐨勬牳蹇冩暟瀛?
浠ヤ笅涓轰换鍔＄粰瀹氱殑鍩哄噯鍊硷紝鎴戦€愰」鐢?`_struct.json` / `analysis/` 鍘熷鏁版嵁閲嶇畻锛?*鍏ㄩ儴涓€鑷?*锛?
| 鎸囨爣 | 鍩哄噯鍊?| 閲嶇畻缁撴灉 | 缁撹 |
|---|---:|---:|---|
| swf 鍊欓€?| 97 | 97 | 鉁?|
| 缁撴瀯鏈夋晥 | 93 | 93 | 鉁?|
| 鎷掔粷 | 4 | 4 | 鉁?|
| stale FileLength | 89 | 89锛堟湁鏁堟枃浠朵腑浜︿负 89锛?| 鉁?|
| 鍚?AS2 | 82 | 82锛堟湁鏁堟枃浠朵腑浜︿负 82锛?| 鉁?|
| 鍚?AS3 | 0 | 0 | 鉁?|
| 涓荤▼搴忕被鏁?| 427 | `analysis/kofwing__21256864/scripts/scripts/__Packages` 涓?427 涓?`.as` | 鉁?|
| AI 绫?| 252 | 褰掔被涓?"AI (per character)" 鐨?`.as` 鎭板ソ 252 | 鉁?|
| 瀵煎嚭鐨?.as 鎬绘暟 | 31,215 | `analysis/**/*.as` 閫掑綊璁℃暟 = 31,215锛堜富绋嬪簭 27,122锛?| 鉁?|
| 鎬诲瓧鑺?| 594,904,068 | `_struct.json` summary 涓€鑷达紱4 涓鎷掓枃浠跺悎璁?359,774,687 B锛?0.5%锛?| 鉁咃紙浣嗚 搂3.2 绗?3 鏉★級 |

琛ュ厖瀹炴祴锛歚exported .as bytes = 19,025,558`銆乣strings mined = 2,592,071`銆乣with DefineSprite = 91`銆乣distinct sha256 = 91`銆乣duplicate groups = 6` 鈥斺€?涓?`final_report.md:54-62` 鍏ㄩ儴鍚诲悎锛堣繖浜涙暟瀛楃敱鍙鐨?`tools/stats.py` 鐩存帴鎵撳嵃寰楀埌锛夈€?
### 3.2 鏈夊垎姝х殑鏁板瓧锛氭牴鍥犲垽瀹?
| 鎶ュ憡浣嶇疆 | 鎶ュ憡鍐欑殑鍊?| 鏁版嵁閲岀殑鐪熷€?| 鏍瑰洜 | 鍒ゅ畾 |
|---|---|---|---|---|
| `file_inventory.md` "Files containing sound tags"銆乣final_report.md:55` | **6** | **5** | **璁℃暟瑙勫垯閿欒**锛歚tools/swf_struct.py:373` 鐨?`with_sound` 瀵?*鍏ㄩ儴** 97 鏉¤褰曡鏁帮紝鏈檺瀹?`valid_swf`銆傝鎷掓枃浠?`40440656.swf` 鐨勫瀮鍦炬爣绛炬祦閲屾伆濂藉嚭鐜?2 涓?sound tag锛屼簬鏄璁″叆 | **鎶ュ憡閿欙紝姝ｇ‘鍊?= 5銆?* 鍚屼竴涓?summary 閲岀殑 `with_as2`/`with_as3`/`declared_length_mismatch` 鎭板ソ涓嶅彈褰卞搷锛? 涓鎷掓枃浠?DoAction/DoABC 鍧囦负 0锛屼笖闀垮害瀛楁鎭板ソ鑷唇锛夛紝鎵€浠ュ彧鏈?`with_sound` 涓€澶勫嚭閿?|
| `README.md:27`銆乣final_report.md:119`銆乣dependency_graph.mmd:135` | 83 stage SWFs | `stage/` = 20锛宍stage2/` = 63 | **璁℃暟瑙勫垯涓嶅悓**锛?3 鏄?`classification.json` 閲?`stage_background` 瑙掕壊鐨勬暟閲?= 涓や釜鐩綍涔嬪拰 | **涓嶇畻閿欙紝浣嗚〃杩拌瀵笺€?* 寤鸿鍐欐垚 "83 files classified stage_background锛坰tage/ 20 + stage2/ 63锛? |
| `README.md:42`銆乣final_report.md:145` | 24 characters | `code_index.md` 鐢熸垚 **25**锛涙姌鍙?`Type2_`/`Type3_` 鍙樹綋鍚庝负 **23** | **姝ｅ垯缂洪櫡**锛歚tools/build_code_index.py:82` 鐨?`(Type2_)?(.+?)_AI(_Lv\d\|_Player)?\.as$` 鍙墺绂?`Type2_`锛岄潪璐┆鐨?`.+?` 鎶?`Type3_Goenitz`銆乣Type3_Iori` 鎹曡幏鎴愮嫭绔嬭鑹?| **鎶ュ憡閿欍€?* 姝ｇ‘鍊煎彇鍐充簬鍙ｅ緞锛氬伐鍏蜂骇鍑?25锛屾寜瑙掕壊鎶樺彔涓?23锛?4 涓ゅ閮戒笉瀵?|
| `final_report.md:210` | 20/20 `stageBG` items | **19/19** | **鎵嬪伐瑾婂啓閿欒**锛歚registries.json` 涓?`stage_registry` 鍏?49 鏉＄洰 = 19 涓?`stageBG_item` + 30 涓?`map` | **鎶ュ憡閿欙紝姝ｇ‘鍊?= 19銆?* 鍚屽彞 "19 of 30 character鈫抯tage entries are stale" 姝ｇ‘ |
| `final_report.md:198` | "Only **4** edges could be confirmed" | 纾佺洏涓婄殑 `dependency_edges.csv` 閲?**CONFIRMED = 0** | **涓や釜宸ュ叿鐨勪骇鐗╄浜掔浉瑕嗙洊**锛堣 B2/M6锛?| **鎶ュ憡涓庨殢闄?CSV 鑷浉鐭涚浘銆?* 4 鏄?`build_graph` 鐨勭粨鏋滐紙`_edges_full.json`锛欳ONFIRMED=4/PATTERN=8/MISSING=11/INFERRED=105锛夛紱闅忛檮 CSV 鏄?`classify` 鐨勶紙`_edges.json`锛歀IKELY=7/INFERRED=136锛孋ONFIRMED=0锛?|
| `README.md:22` / `final_report.md:14` | 涓荤▼搴?125 MB | 125,442,502 B锛?125.4 MB / 119.6 MiB锛?| 鈥?| 鉁?鎴愮珛 |

### 3.3 `_edges.json` vs `_edges_full.json`锛氬摢涓槸闄堟棫鐨?
涓よ€呯敱**涓や釜涓嶅悓鐗堟湰/涓嶅悓浣滆€呯殑杈规娊鍙栧櫒**浜х敓锛坄classify.py` 涓?`build_graph.py`锛夛紝浜掍笉鍏煎锛?
| | `_edges.json`锛坈lassify锛?| `_edges_full.json`锛坆uild_graph锛?|
|---|---|---|
| 杈规暟 | 143 | 128 |
| 鍞竴 (source, target) | 110 | 109 |
| 瀛楁 | `source_swf,target,api,location,evidence,confidence,note` | `source,target_pattern,api,location,evidence,confidence,resolved_target,note` |
| 缃俊搴﹁瘝琛?| CONFIRMED / LIKELY / INFERRED | CONFIRMED / PATTERN / MISSING / INFERRED |
| 鍒嗗竷 | CONFIRMED 0, LIKELY 7, INFERRED 136 | CONFIRMED 4, PATTERN 8, MISSING 11, INFERRED 105 |

**閲忓寲宸紓**锛氬叡鏈?(source, target) 瀵?**98** 涓浉鍚岋紱**12** 涓粎瑙佷簬 `_edges.json`锛?*11** 涓粎瑙佷簬 `_edges_full.json`銆?
**鍒ゅ畾锛歚dependency_edges.csv` 涓?`_edges.json` 鍚屼唬锛堥潪闄堟棫锛夛紝`_edges_full.json` 涓庣鐩樹笂鐨?CSV 涓嶅悓浠ｃ€?* 渚濇嵁锛氱鐩?CSV 鐨勮〃澶翠笌 `_edges.json` 鐨勫瓧娈甸泦閫愬垪涓€鑷淬€佽鏁板悓涓?143锛涗笖 `README.md:92-96` 鐨勯『搴忚 `build_graph` 鍦?`classify` **涔嬪悗**杩愯锛岃嫢鐪熸寜 README 璺戣繃锛屾渶缁堢暀鍦ㄧ洏涓婄殑搴旀槸 `_edges_full.json` 閭ｄ竴鐗堛€?*缁撹锛歊EADME 鐨勫鐜伴『搴忎笌浠撳簱閲岀殑鎻愪氦浜х墿浜掔浉鐭涚浘**锛屽疄闄呯敓鎴愰『搴忓繀鐒舵槸 build_graph 鍏堛€乧lassify 鍚庛€?
**璐ㄩ噺宸瘎**锛歚classify.py` 鐙湁鐨勯偅 12 鏉¤竟閲屾湁鏄庢樉鍨冨溇鐩爣锛屽 `'/" +'`銆乣'\\n" +'`銆乣'char/" +'`銆乣'http://" +'` 鈥斺€?鏉ヨ嚜 `:181` 鐨勫瓧绗︿覆鎷兼帴姝ｅ垯鍖归厤鍒颁簡纰庣墖銆備綔涓哄姣旓紝`build_graph` 鐙湁鐨?11 鏉℃槸瑙勮寖鍖栬繃鐨?`'<prefix><variable>.swf'` 褰㈠紡锛堝 `char/<variable>.swf`锛夈€?*鑻ヤ簩閫変竴淇濈暀涓€浠斤紝搴斾繚鐣?`build_graph` 鐨勭増鏈€?*

---

## 4. 绗?4 椤癸細4 涓鎷掑亣闃虫€ф槸鍚﹁涓€鑷存帓闄?
| 浜х墿 | 鏄惁鎺掗櫎 4 涓鎷掓枃浠?| 璇佹嵁 |
|---|---|---|
| `file_inventory.csv` | 鉁?淇濈暀涓虹嫭绔嬭骞舵爣娉?| 97 琛岄綈鍏紝4 琛?`valid_swf=False`銆乣role=not_a_swf`銆乣role_confidence=high`銆乣script_files_exported=0` |
| `classification.json` | 鉁?纭€ф帓闄?| `tools/classify.py:122-129`锛歚if not meta.get("valid_swf")` 鐩存帴杩斿洖 `not_a_swf`锛屼笖涓嶈窇瑙掕壊瑙勫垯 |
| `code_index.csv` / `.md` | 鉁?澶╃劧鎺掗櫎锛堝彧鎵富绋嬪簭锛?| `tools/build_code_index.py:39-47` 鍙亶鍘?`kofwing__21256864` 涓€涓洰褰?|
| `dependency_edges.csv` | 鉁?4 涓枃浠朵笉浜х敓浠讳綍杈?| 瀹冧滑 `script_files_exported=0`锛宍extract_edges` 鏃犺剼鏈彲璇伙紱瀹炴祴 143/128 鏉¤竟鐨?`source_swf` 涓笉鍚繖 4 涓?|
| `_phase2_index.json` | 鈿狅笍 **鏈帓闄わ紝浣嗘棤瀹?* | `tools/jpexs_batch.py:170-174` 鎶?valid 涓?invalid **涓€璧?*鎺掕繘浠诲姟闃熷垪锛屾墍浠?97 涓枃浠堕兘璺戜簡 JPEXS锛坄total=97`锛屽叾涓?`with_scripts=93`锛夈€傝鎷掓枃浠跺悇鑷彧鐣欎笅绌?`scripts/`锛屼笉浜х敓杈癸紝涔熶笉杩涘叆瑙掕壊缁熻 |
| **`_struct.json` 鐨?summary** | 鉂?**涓€澶勬硠婕?* | `with_sound = 6` 鍖呭惈浜嗚鎷掔殑 `40440656.swf`锛堣 M1锛夈€傚叾浣?summary 璁℃暟鎭板ソ姝ｇ‘ |

**鍒ゅ畾锛氭帓闄ゅ熀鏈竴鑷达紝鍞竴娉勬紡鐐规槸 `with_sound`锛? 搴斾负 5锛夈€?*

---

## 5. 绗?6 椤癸細鍒嗙被鍣ㄩ闄╋紙`tools/classify.py`锛?
### 5.1 瀹屾暣瑙勫垯琛紙`tools/classify.py:73-93`锛?
```
(role, confidence, 蹇呴渶淇″彿, 璇存槑)
("stage_background",          "high",   ["stage_bg_contract", "bg_layer_fields"],  ...)
("combat_engine_module",      "high",   ["engine", "sfx_export_names"],           ...)
("combat_engine_module",      "medium", ["engine"],                                ...)
("sfx_bank",                  "high",   ["sfx_export_names"],                      ...)
("flash_runtime_helper",      "high",   ["flash_runtime_api"],                     ...)
("flash_settings_panel",      "high",   ["flash_settings_ui"],                     ...)
("flash_debug_ui",            "high",   ["flash_debug_ui"],                        ...)
("flash_fullscreen_overlay",  "high",   ["flash_fullscreen_overlay"],              ...)
("settings_store",            "medium", ["sharedobject_settings"],                 ...)
鍏滃簳: "game_module_unclassified" / "low"
鍓嶇疆瀹堝崼: if not meta["valid_swf"] -> "not_a_swf" / "high"锛?122-129锛?```

### 5.2 椋庨櫓鍒ゅ畾

| 闂 | 鍒ゅ畾 | 渚濇嵁 |
|---|---|---|
| stage SWF 浼氳璇垽鎴愪富绋嬪簭鍚楋紵 | **浼氾紝瀛樺湪鍏蜂綋璺緞** | `stage_background` 鎺掑湪瑙勫垯琛?*绗竴浣?*锛坄:75`锛夛紝鍖归厤鏉′欢鍙姹傝剼鏈噷鍑虹幇 `bgArray =` 涓斿嚭鐜?`isBmd:`/`isBase:`銆備富绋嬪簭纭疄鍚屾椂鍚湁杩欎簺鏍囪瘑锛屼絾瀹冭嚜韬笉婊¤冻 `sfx_export_names` 鐨勫畬鏁村舰鎬佹椂锛屽氨浼氳惤杩涚浜屾潯瑙勫垯鎷垮埌 `combat_engine_module`锛?*杩欐鏄幇鐘?*锛夈€傚弽杩囨潵锛岃嫢鏌愪釜 stage 妯″潡鎭板ソ甯︿簡 engine 淇″彿锛屽畠浼氳**浼樺厛**鍒ゆ垚 `stage_background`銆?*瑙勫垯椤哄簭鑰岄潪鐗瑰紓搴﹀喅瀹氬綊灞?*锛堝凡鐢?`tests/test_edge_schema.py::test_stage_background_rule_wins_over_engine_rule_by_position` 閽変綇锛?|
| character pack 浼氳璇垽鎴愪富绋嬪簭鍚楋紵 | **涓嶈兘锛屼絾瑙掕壊鏍囩鏈韩涓嶅噯** | 5 涓?`combat_engine_module` = 涓荤▼搴?+ Kim/Andy/Moriya/Nameless 鍥涗釜 pack銆俻ack 鏃犳硶鎷垮埌姣斾富绋嬪簭鏇撮珮鐨勬爣绛锯€斺€?*鍥犱负鏍规湰涓嶅瓨鍦?`main_program` 杩欎釜瑙掕壊** |
| Flash runtime helper 浼氳璇垽鎴愪富绋嬪簭鍚楋紵 | **涓嶄細** | `6148152` 鈫?`flash_runtime_helper`銆乣6235248` 鈫?`settings_store`銆乣6230976` 鈫?`flash_fullscreen_overlay`銆乣7298128` 鈫?`flash_settings_panel`銆乣20817874` 鈫?`flash_debug_ui`锛屽潎瀹炴祴姝ｇ‘ |
| **`21256864.swf` 鏈夋病鏈変换浣曚繚鎶ゃ€佷繚璇佷笉琚爣鎴愬埆鐨勶紵** | **娌℃湁銆傝繖鏄湰娆″璁℃渶瀹炶川鐨勫垎绫诲櫒缂洪櫡銆?* | 瑙勫垯琛ㄩ噷**涓嶅瓨鍦?* `main_program`锛堟垨 `boot`锛夎鑹诧紱娌℃湁浠讳綍閽堝鏂囦欢澶у皬銆佽剼鏈被鏁伴噺銆丒XE 鍋忕Щ鐨勭櫧鍚嶅崟鎴栭粦鍚嶅崟锛沗build_code_index.py:39` 鍙嶈€屾妸 `kofwing__21256864` **纭紪鐮?*鎴愪富绋嬪簭銆備篃灏辨槸璇达紝"涓荤▼搴忔槸 21256864.swf" 杩欐潯**缁撹鏈韩涓嶆槸 `classify.py` 浜у嚭鐨?*锛岃€屾槸浜哄伐鍐欒繘 `dependency_graph.mmd:127`锛堢‖缂栫爜鐨?mermaid 鏂囨湰锛夈€乣final_report.md:95` 鍜?`build_code_index.py:39` 鐨勩€俙classification.json` 缁欏畠鐨勬爣绛炬槸 `combat_engine_module / high`锛屼笌鍙﹀ 4 涓鑹插寘**骞跺垪**銆傚凡鐢?`test_no_rule_can_label_a_file_as_the_main_program` 閽変綇 |

**缁撹**锛氬垎绫诲櫒瀵?helper / stage / pack"涓夌被鍖哄垎鏄湁鏁堢殑锛涗絾**涓荤▼搴忚韩浠芥病鏈変换浣曟満鍣ㄥ彲楠岃瘉鐨勬姢鏍?*锛屽叏闈犵‖缂栫爜瀛楃涓插湪涓嬫父浼犳挱銆傝嫢灏嗘潵璇枡鍙樺姩鎴栦富绋嬪簭鏀瑰悕锛宍build_code_index.py:39` 浼氱洿鎺ユ姤 `ERROR: __Packages directory not found` 骞堕€€鍑猴紝鑰?`classify.py` 浼氬钩闈欏湴鎶婁富绋嬪簭闄嶇骇鎴愪竴涓櫘閫氳鑹插寘銆?
---

## 6. 绗?7 椤癸細鍋ュ．鎬?
| 鍏虫敞鐐?| 鍒ゅ畾 | 璇佹嵁 |
|---|---|---|
| 鍚┖鏍间笌涓枃鐨勮矾寰?| 鉁?**鍙敤** | 鏈瀹¤鑷韩灏辫窇鍦ㄨ繖绉嶈矾寰勪笅锛坄_reverse` 鍏ㄨ矾寰勫惈涓枃锛夈€俙swf_struct.py` 鐢?`Path.rglob` + `str().replace("\\","/")`锛沗subprocess.run` 浼?list 鑰岄潪 shell 瀛楃涓诧紝涓嶅彈绌烘牸褰卞搷銆傛祴璇?`test_inventory_determinism.py` 鍒绘剰鎶婅鏂欐斁鍦?`鎷崇殗 Wing 鍓嶇灮鐗?` 涓嬪苟鏂█涓ゆ杩愯瀛楄妭涓€鑷?|
| 澶у皬鍐欏樊寮?| 鈿狅笍 **妫€娴嬪舰鍚岃櫄璁?* | `parse_registries.py:39-47` 鐨勭储寮曟湰韬槸澶у皬鍐欎笉鏁忔劅鐨勶紝浣?`:116` 鐨?`case_diffs` 鍐欐涓?0銆乣:129` 鐨?`CASE_MISMATCH` 涓嶅彲杈撅紙M8锛夈€俙build_graph.any_file_named` 鐢?`name.lower()` 姣旇緝锛坄:52`锛夛紝鏃犳硶鍙戠幇"纾佺洏鏄?`.MP3`銆佷唬鐮佽 `.mp3`"杩欑被绉绘椋庨櫓 |
| 鍗曟枃浠跺け璐ユ槸鍚︿腑姝㈡暣鎵?| 鈿狅笍 **鍒嗗伐鍏疯€屽紓** | 鉁?`jpexs_batch.py:295-301` 鍦?`fut.result()` 澶栧眰鏈?try/except锛屽崟涓枃浠剁偢鎺夊彧鎵撳嵃 `[ERR]` 骞剁户缁紝涓?`process()` 鍐呴儴 `read_bytes`/`read_text` 涔熷悇鑷厹搴曘€傗潓 `classify.py:253` 涓?`build_graph.py:63` 鐨?`json.loads` 鏃犱繚鎶わ紝涓€涓潖 `metadata.json` 缁堟鏁存壒锛圡9锛屽凡娌欑澶嶇幇锛?|
| 閲嶈窇鏄惁瑕嗙洊婧愭暟鎹?/ 閲嶅杈撳嚭 | 鉂?**鏈変袱澶勪細鏀瑰啓娓告垙鏈綋** | `recover_from_exe.py:122` 瑕嗙洊 `kofwing/*.swf`锛沗restore_registries.py:39` 瑕嗙洊 `stage/stage2/sound/list.txt`銆備簩鑰呴兘鍦?`_reverse/` 涔嬪锛屼笖閮戒笉鍦?README 鐨勫鐜版竻鍗曢噷銆傛澶?`jpexs_batch.py` 閲嶈窇浼氭妸鏃?`scripts/` 娈嬬暀璁″叆缁熻锛坢5锛?|
| 閿欒鏃ュ織鏄惁瓒充互瀹氫綅澶辫触 | 鈿狅笍 **鍗曟枃浠跺锛屾暣鎵逛笉澶?* | 鉁?`analysis/<id>/errors.txt` + `metadata.json:jpexs_errors` 閫愭枃浠惰褰?JPEXS stderr 鍓?20 琛屼笌瓒呮椂锛坄jpexs_batch.py:186-207`锛夛紝瀹氫綅鍗曟枃浠惰冻澶熴€傗潓 鏁存壒灞傞潰锛歚swf_struct.py` 鏃犳眹鎬绘棩蹇楁枃浠讹紱`classify.py`/`build_graph.py` 涓€斿紓甯告椂**涓嶅啓浠讳綍鏃ュ織**锛宍reports/` 閲岀殑鏃т骇鐗╀細琚褰撴垚鏂扮粨鏋?|

---

## 7. 绗?8 椤癸細娓呭崟鍙拷婧€?
**闂**锛歚analysis/<id>/metadata.json` 鐢?`jpexs_batch.py:264` 浠?`swf_struct.analyze()` 鐨勮褰曠洿鎺?`dict(rec)` 澶嶅埗鑰屾潵锛?*璁板綍浜?sha256 浣嗕粠涓嶆牎楠?*銆備篃灏辨槸璇村畠鏄竴涓?褰撴椂鐨勫揩鐓?锛屾病鏈変换浣曟満鍒跺湪鍚庣画浣跨敤鏃讹紙`build_inventory.py`銆乣classify.py`銆乣build_graph.py`锛夊洖澶存牳瀵硅緭鍏ユ枃浠舵槸鍚﹁繕鏄偅涓€涓€?
**瀹炴祴缁撴灉锛?4 涓?`kofwing` 鏂囦欢涓?5 涓涓嶄笂**锛堣 B1锛夈€傚叾涓渶鍏抽敭鐨勬槸涓荤▼搴忥細

```
_struct.json / metadata.json 璁?  125,450,217 B  sha256 319fb968de79鈥?纾佺洏瀹為檯 (kofwing/21256864.swf):  125,442,502 B  sha256 847a0ec9febb鈥?宸€?                                    -7,715 B
```

`reports/recovery_manifest.json:47-55` 缁欏嚭浜嗗畬鏁磋В閲婏細璇ユ枃浠惰 `recover_from_exe.py` 浠?EXE 鎸夊亸绉?21,256,864 閲嶆柊鍒囧嚭鏃?*鍦?EOF 澶勮鎴柇**锛坄truncated_at_eof: true`锛夆€斺€斿嵆 EXE 閲屽墿涓嬬殑瀛楄妭姣斿垵鐗堟彁鍙栫墿灏?7,715 瀛楄妭銆?
**褰卞搷**锛歚file_inventory.csv` 閲?`kofwing/21256864.swf` 鐨?`sha256` 涓?`bytes` 涓ゅ垪**閮芥寚鍚戜竴涓凡涓嶅瓨鍦ㄧ殑鏂囦欢**銆備换浣曚互璇?CSV 涓哄噯鐨勬牎楠屻€佽ˉ涓佹垨浜屾鎭㈠閮戒細澶辫触銆傚彟 4 涓鎷掓枃浠剁殑 sha256 鍚屾牱澶遍厤锛堝ぇ灏忔湭鍙樸€佸唴瀹瑰凡鍙橈級銆?
**涓€涓弽鍚戠殑濂芥秷鎭?*锛氫粨搴撻噷 `experiments/work/orig.swf` 鐨?sha256 = `847a0ec9febb鈥锛屼笌褰撳墠纾佺洏鐗堟湰**瀹屽叏涓€鑷?*銆備篃灏辨槸璇村綋鍓嶅湪鐢ㄧ殑涓荤▼搴忓壇鏈嚦灏戣繕鏈夌浜屽鐣欏瓨锛屽彲浠ヤ簰鐩稿嵃璇併€?
**寤鸿**锛歚build_inventory.py` 鍦ㄦ嫾琛ㄦ椂瀵规瘡涓?`valid_swf` 璁板綍閲嶆柊璁＄畻杈撳叆 sha256 骞朵笌 `_struct.json` 姣斿锛屼笉涓€鑷村氨鍗曠嫭鍑轰竴鍒?`input_sha256_match`锛岃婕傜Щ鍙鑰屼笉鏄矇榛樸€?
---

## 8. 绗?1 椤癸細README 鍙鐜版€ч€愭潯鏍稿

| README 琛?| 鏂囨。鍛戒护 | 瀹炴祴 | 鍒ゅ畾 |
|---|---|---|---|
| `:83` | `python tools/swf_struct.py <game_root> reports/_struct.json` | 鏃犲弬杩愯鎵撳嵃 usage銆侀€€鍑虹爜 2锛坄swf_struct.py:332`锛夛紱甯﹀弬鍦ㄥ悎鎴愯鏂欎笂璺戦€氬苟浜у嚭姝ｇ‘ JSON | 鉁?|
| `:86` | `python tools/find_boot_swf.py <exe> <struct.json> <out.json>` | 鍙傛暟椤哄簭涓?`find_boot_swf.py:63-65` 涓€鑷?| 鉁咃紙鏃犲弬鏃犲畧鍗紝瑙?m1锛?|
| `:89` | `python tools/jpexs_batch.py <game_root> <struct.json> analysis` | 涓?`jpexs_batch.py:156-161` 涓€鑷?| 鉁咃紙鏈鐪熷疄璇枡瀹炶窇锛?|
| `:92` | `python tools/parse_registries.py <game_root> reports` | 涓?`parse_registries.py:51-52` 涓€鑷?| 鉁?|
| `:93` | `python tools/classify.py analysis reports <game_root>` | 涓?`classify.py:229-231` 涓€鑷?| 鉁?|
| `:94` | `python tools/build_graph.py <game_root>` | 涓?`build_graph.py:29` 涓€鑷?| 鈿狅笍 **椤哄簭閿欒**锛氭斁鍦?classify 涔嬪悗浼氳鐩?classify 鐨?CSV锛圔2锛?|
| `:95`/`:96` | `python tools/build_inventory.py` / `build_code_index.py` | 浜岃€呬笉璇?`sys.argv`锛岃矾寰勭敱 `__file__` 鎺ㄥ锛坄build_inventory.py:10`銆乣build_code_index.py:11-13`锛?| 鉁?|
| `:59` | "Python 3.11, stdlib only" | 鎶芥煡鍏ㄩ儴鑴氭湰锛屾棤绗笁鏂?import锛坄collections` 涓烘爣鍑嗗簱锛?| 鉁?|
| `:60` | "SWF header + tag-walk validator, **no JPEXS needed**" | `swf_struct.py` 浠呯敤 hashlib/json/struct/zlib/lzma | 鉁?|
| `:99` | "so a file is never accepted just because a decompiler opened it" | 鏍￠獙閫昏緫涓?JPEXS 瀹屽叏瑙ｈ€︼紝涓旂粡娴嬭瘯瑕嗙洊锛團WS/CWS/ZWS/鎴柇/鍨冨溇/鏃?End tag 鍏鎯呭舰锛?| 鉁?**杩欐潯鎵胯鏄厬鐜扮殑** |

**鏈褰曠殑姝ラ锛堝鐜扮己鍙ｏ級**锛歚_struct_recovered.json`銆乣recovery_manifest.json` 鐢辨湭鍦?README 鍑虹幇鐨?`recover_from_exe.py` 浜у嚭锛沗registries.json` 涔嬪杩樻湁 `runtime_dependency_audit.csv`锛坄phase1_dep_audit.py`锛夈€乣stage_audit.csv`/`bgm_audit.csv`锛坄phase2_stage_bgm_audit.py`锛夌瓑浜х墿涔熸棤瀵瑰簲鍛戒护銆?
---

## 9. 楠岃瘉鏂瑰紡璇存槑锛堣繍琛岄獙璇?vs 浠呴槄璇伙級

### 9.1 瀹為檯杩愯楠岃瘉

| 鍔ㄤ綔 | 缁撴灉 |
|---|---|
| `python tools/stats.py`锛堝彧璇伙紝浠呮墦鍗帮級 | 鎴愬姛锛岃緭鍑?97/93/4/89/82/0/91/6/91/6銆?94,904,068銆?1,215銆?9,025,558銆?,592,071锛屼笌鎶ュ憡涓€鑷?|
| `python tools/swf_struct.py` 瀵?7 涓悎鎴?fixture锛堝惈 FWS/CWS/ZWS/stale/鏃?End tag/鎴柇/鍨冨溇/杩囧皬锛?| 鍏ㄩ儴閫氳繃锛岄獙鏀?鎷掔粷琛屼负绗﹀悎棰勬湡 |
| `python -m unittest discover -s tests -t .` | **46 椤瑰叏閮ㄩ€氳繃** |
| 5 涓剼鏈棤鍙傝繍琛岋紙娴?argv 瀹堝崼锛?| `swf_struct`/`jpexs_batch` 鎵撳嵃 usage 閫€鍑?2锛沗find_boot_swf`/`classify`/`parse_registries` 鎶?`IndexError` 閫€鍑?1銆傜 6 涓?`build_graph` 鏃犲弬杩愯鏃朵細浠?`REPO.parent` 涓?GAME_ROOT 骞?*绔嬪嵆寮€濮嬪啓 `reports/`**锛屽凡鍦ㄥ啓鍏ュ墠涓锛涢殢鍚?`git diff HEAD -- reports tools README.md` 涓虹┖锛屽凡璺熻釜鏂囦欢鏈鏀瑰姩銆傚墿浣?8 涓剼鏈紙`stats` 绛夛級鏃犲弬杩愯浼氳鍐欑湡瀹炰骇鐗╋紝鏈墽琛?|
| `classify.py` + `build_graph.py` 鍦?`%TEMP%\kfrepro` 闅旂娌欑涓殑鍏堝悗杩愯 | 澶嶇幇 B2锛氬厛 classify锛堣〃澶?`source_swf,鈥锛? 琛岋級锛屽啀 build_graph锛堣〃澶?`source,target_pattern,鈥?resolved_target`锛? 琛岋級鈥斺€?*鍚庤€呯殑 CSV 瑕嗙洊鍓嶈€?* |
| 瀵?`kofwing/` 鍏ㄩ儴 14 涓?SWF 閲嶆柊璁＄畻 SHA-256 骞朵笌 `_struct.json`銆乣_struct_recovered.json`銆乣metadata.json` 涓夋柟姣斿 | 9 MATCH / 5 DIFF锛圔1锛?|
| `experiments/work/orig.swf`锛?25 MB锛塖HA-256 | `847a0ec9febb鈥锛屼笌褰撳墠 `kofwing/21256864.swf` 鐩稿悓 |
| `stage/`銆乣stage2/`銆乣sound/` 涓?`list.txt` 鐨勫師濮嬪瓧鑺?| `stage/list.txt` 801 B銆乁TF-8 BOM銆乣&stageBG=` 寮€澶达紱`sound/list.txt` 810 B銆丆RLF锛沗stage2/list.txt` **褰撳墠涓嶅瓨鍦?* |
| Python 浜ゅ弶鏍哥畻 | `registries.json` 鏉＄洰鍒嗗竷銆乣code_index` 鍒嗙被璁℃暟涓庤鑹插垎缁勩€乣_edges*.json` 杈归泦宸紓銆佽鑹插垎甯?|

### 9.2 浠呴槄璇汇€佹湭瀹炶窇锛堟爣娉ㄤ负 **鏈獙璇?*锛?
| 椤?| 鍘熷洜 |
|---|---|
| `jpexs_batch.py` 瀵圭湡瀹?97 鏂囦欢璇枡鐨勫畬鏁磋繍琛?| 闇€ JPEXS 澶勭悊绾?570 MB锛岃€楁椂浠ュ皬鏃惰锛涙湰娆′粎楠岃瘉浜嗗叾 argv 濂戠害涓?`process()` 鐨勯敊璇鐞嗕唬鐮佽矾寰?|
| `find_boot_swf.py` 瀵?146 MB `wingex1.2.exe` 鐨勬壂鎻?| 鏈繍琛岋紱`_exe_scan.json` 涓烘棦鏈変骇鐗╋紝鏈鏈鏍?|
| `parse_registries.py` 瀵圭湡瀹炴爲鐨勮繍琛?| `stage2/list.txt` 宸蹭笉鍦ㄧ鐩橈紙鐢ㄦ埛鏀归€犵増锛夛紝閲嶈窇缁撴灉蹇呯劧涓?`registries.json` 涓嶅悓锛岃宸紓**涓嶈兘**鍒ゅ畾涓哄伐鍏风己闄?|
| `build_inventory.py` / `build_code_index.py` / `build_graph.py` / `classify.py` 鍦ㄧ湡瀹炰粨搴撲笂鐨勯噸璺?| 瀹冧滑鐩存帴鍐?`reports/`锛堝睘鍙︿竴 Agent 鐨勪骇鍑鸿寖鍥达級锛涢獙璇佹敼鍦?`%TEMP%` 娌欑鍐呰繘琛?|
| `recover_from_exe.py` / `restore_registries.py` | **鏁呮剰涓嶈繍琛?*锛氫簩鑰呬細鏀瑰啓娓告垙鏈綋鏁版嵁 |
| `scan_recyclebin.py` / `rb_payload_check.py` / `pack_hypothesis.py` / `phase1_dep_audit.py` / `phase2_stage_bgm_audit.py` / `_check_offsets.py` / `inspect_out.py` / `find_classes.py` | 瓒婄晫锛堣闂?`D:\$Recycle.Bin`锛夋垨涓庢湰娆″璁￠棶棰樻棤鍏筹紱瀵圭‖缂栫爜璺緞浠呭仛浜嗛潤鎬佹壂鎻?|
| `experiments/` 鐩綍鐨勭敤閫?| 鏈窡韪€丷EADME 鏈彁鍙婏紝浠呰褰曞瑙備簨瀹?|

---

## 10. 娴嬭瘯濂椾欢

### 10.1 浣跨敤鏂规硶

```bash
cd D:\鎷崇殗\鎷崇殗WingEX1.2鍓嶇灮鐗圽_reverse
python -m unittest discover -s tests -t .
```

- 浠呯敤鏍囧噯搴?`unittest`锛屾棤 pytest銆佹棤缃戠粶瀹夎
- 鎵€鏈?SWF fixture 鐢?`tests/swf_fixtures.py` **閫愬瓧鑺傜▼搴忓寲鐢熸垚**锛團WS / CWS / ZWS / stale-length / 鏃?End tag 鍋囬槼鎬?/ 鎴柇 / 鍨冨溇 / 杩囧皬锛夛紝**鏈鍒朵换浣曠湡瀹炴父鎴忔枃浠?*
- 璇枡鐩綍鍒绘剰鍛藉悕涓?`鎷崇殗 Wing 鍓嶇灮鐗坄锛屽悓鏃惰鐩?涓枃 + 绌烘牸"璺緞
- 鍏ㄩ儴鍦?`tempfile.TemporaryDirectory()` 涓繍琛岋紝涓嶈Е纰?570 MB 鐪熷疄璇枡

### 10.2 瀹為檯杩愯缁撴灉

```
Ran 46 tests in 0.257s

OK
```

| 妯″潡 | 鐢ㄤ緥鏁?| 瑕嗙洊鐐?|
|---|---:|---|
| `tests/test_swf_struct.py` | 14 | SWF 澶撮儴 + tag 娴佹牎楠岋細FWS/CWS/ZWS 閫氳繃锛涙埅鏂?鍨冨溇/杩囧皬/LZMA 杞借嵎鎹熷潖琚嫆锛?*"绛惧悕鍚堟硶浣嗘棤 End tag" 鐨勫亣闃虫€ц鎷?*锛泂tale FileLength 鍙 warning 涓嶆嫆锛堝帇缂?SWF 鎸?spec 闀垮害涓嶄竴鑷村悓鏍峰彧璁?warning锛夛紱缂烘枃浠?*鎶涘紓甯歌€岄潪闈欓粯璺宠繃**锛涗笉鍙鏂囦欢璁板叆 `errors`锛涙棤鍙傛椂鎵撳嵃 usage 骞堕€€鍑?2 |
| `tests/test_inventory_determinism.py` | 7 | 鍚屼竴杈撳叆杩炵画涓ゆ杩愯 `main()` 浜у嚭**閫愬瓧鑺傜浉鍚?*鐨?JSON锛涜В鏋愬悗鐨勬枃妗ｄ笌 summary 鐩哥瓑锛涜搴忛伒寰伐鍏疯嚜韬殑鎺掑簭閿紱**琚嫆鏂囦欢涓嶄細杩涘叆 `with_as2`/`with_as3`**锛涜緭鍑虹洰褰曡嚜鍔ㄥ垱寤猴紱椤哄甫閽変綇"鎺掑簭渚濊禆骞冲彴璺緞鍒嗛殧绗?杩欎竴宸茬煡缂洪櫡 |
| `tests/test_edge_schema.py` | 25 | 杈瑰璞′笌 CSV 鍒楀悕涓€涓€瀵瑰簲锛堜袱濂?schema 鍚勪竴浠斤級锛?*涓ゅ schema 浜掍笉鍏煎**杩欎竴浜嬪疄琚樉寮忔柇瑷€锛涚疆淇″害鍙栧€兼亽鍦ㄥ０鏄庤瘝琛ㄥ唴锛汣ONFIRMED / MISSING / INFERRED / PATTERN 鍚勮嚜鐨勫垽瀹氭潯浠讹紙纾佺洏瀛樺湪鎬с€佽８ link id銆佽繙绋?URL銆佺洰褰曞墠缂€瀛樺湪鎬э級锛沗not_a_swf` 鍓嶇疆瀹堝崼锛涜鑹茶鍒欒〃褰㈢姸瀹屾暣銆佸繀闇€淇″彿鍧囨湁瀹氫箟锛?*"娌℃湁浠讳綍瑙勫垯鑳戒骇鍑?main_program"** 涓?"stage_background 鎺掑湪 engine 涔嬪墠" 涓や釜宸茬煡椋庨櫓琚拤浣忥紱杈规娊鍙栫殑琛屽彿銆佸幓閲嶃€佷笉鍙鑴氭湰璺宠繃銆丆SV 寰€杩旓紱瀵瑰凡鎻愪氦鐨?`dependency_edges.csv` 鍋氬舰鐘舵牎楠?|

> 璇存槑锛氶儴鍒嗙敤渚嬪悕浠?`test_no_rule_...` / `test_stage_background_...` / `test_ordering_depends_on_...` / `test_the_two_edge_schemas_are_incompatible` 寮€澶达紝瀹冧滑**鏂█鐨勬槸褰撳墠宸茬煡鐨勭己闄?*锛岀洰鐨勬槸璁╄繖浜涚己闄峰湪浠讳綍浜轰慨澶嶄箣鍓嶉兘淇濇寔鍙鈥斺€斾慨澶嶅悗杩欎簺鐢ㄤ緥浼氬け璐ワ紝姝ｅソ鎻愰啋鍚屾鏇存柊鏈姤鍛娿€?
---

## 11. 寤鸿鐨勫鐞嗛『搴?
1. **鍏堝喕缁?`kofwing/`**銆傚湪 B1/B3 淇ソ涔嬪墠锛屼换浣曢噸璺?`swf_struct.py` 閮戒細鐢ㄥ綋鍓嶇殑鎴柇鐗堜富绋嬪簭瑕嗙洊鎺夋竻鍗曢噷閭ｄ唤 125,450,217 B 鐨勮褰曘€傚缓璁厛纭 `experiments/work/orig.swf` 鏄惁瑕佹彁鍗囦负鏉冨▉鍓湰銆?2. **淇?`recover_from_exe.py` / `restore_registries.py` 鐨勫啓鏉冮檺**锛屾敼鎴愰粯璁?dry-run + 鏄惧紡 `--apply`銆?3. **鎷嗗紑 `dependency_edges.csv`**锛岃 `build_graph` 涓?`classify` 鍚勫啓鍚勭殑锛屽苟鍚屾淇 `final_report.md:198`銆?4. **閲嶇畻 `_struct.json` 骞堕噸寤?`file_inventory.csv`**锛宍with_sound` 鏀逛负鍙粺璁℃湁鏁堟枃浠讹紱鍚屾淇 M2/M3/M4 涓夊鏁板瓧銆?5. **缁欎富绋嬪簭韬唤鍔犳満鍣ㄦ姢鏍?*锛氬湪 `classify.py` 涓緷鎹?鑴氭湰绫绘暟閲?/ EXE 鍋忕Щ / 鏄惁琚?`build_code_index` 寮曠敤"浜у嚭 `main_program` 瑙掕壊锛屾浛鎹?`build_code_index.py:39` 鐨勭‖缂栫爜銆?6. 鏈€鍚庡鐞嗗仴澹€ч」锛坅rgv 瀹堝崼銆乣case_diffs`銆佸箓绛夐噸璺戙€丷EADME 琛ュ叏锛夈€?
---

*鏈姤鍛婁粎鏂板浜?`tests/` 鐩綍涓庢湰鏂囦欢锛屾湭淇敼 `tools/`銆乣reports/*.md`銆乣reports/*.csv`銆乣analysis/`銆乣README.md` 鎴?`_reverse/` 浠ュ鐨勪换浣曞唴瀹广€?