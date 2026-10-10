# Code Location Index - main program `kofwing__21256864`

All AS2 classes decompiled by JPEXS from the boot movie: **427 classes**.

The boot movie is resolved from `classification.json` (`role == main_program`), not hardcoded.

Paths are relative to `_reverse/analysis/kofwing__21256864/scripts/__Packages/`.


## Subsystem map

| Subsystem | Classes | Largest file |
| --- | ---: | --- |
| AI (per character) | 252 | `Oswald_AI.as` (123,455 B) |
| Flash MXML framework | 43 | `mx/managers/FocusManager.as` (22,646 B) |
| AI (player/auto) | 42 | `Athena_Player.as` (8,956 B) |
| Character definition | 42 | `Oswald_role.as` (21,104 B) |
| Combo system | 26 | `mx/controls/ComboBox.as` (15,769 B) |
| Utility / library | 12 | `CharSelect/CharSelect_icon.as` (31,348 B) |
| Stage / background | 3 | `Stage_effect.as` (16,647 B) |
| Hitbox / collision | 2 | `HitCheck_obj.as` (21,127 B) |
| Input handling | 2 | `role_corn/KeyControl.as` (12,278 B) |
| Ad / network | 1 | `FWAd_AS2.as` (4,885 B) |
| Shared role core | 1 | `role_corn/Role.as` (198,416 B) |
| Projectiles / objects | 1 | `skill/FlyingObj.as` (7,951 B) |

## Character AI classes

Every playable character has its own AI class plus five difficulty tiers (`Lv1`-`Lv5`) and one or more variant forms.

### Counting rules

Variant markers are stripped from the **base name** by an explicit, testable rule:

| Marker | Example | Base name |
| --- | --- | --- |
| `Type2_` | `Type2_Kyo_AI.as` | ``Type2_Kyo`` |
| `Type3_` | `Type3_Iori_AI.as` | ``Type3_Iori`` |
| leading `C` | `CZero_AI.as` | ``CZero`` |
| leading `CK` | `CKrizalid_AI.as` | ``CKrizalid`` |

| Quantity | Count | Meaning |
| --- | ---: | --- |
| AI class count | 294 | every `*_AI*.as`, variants included |
| Variant AI classes | 126 | classes carrying a variant marker |
| Independent characters | 21 | unique base names |

A name is **never** removed to make a number match a report; the rule above is applied uniformly.

| Base character | Variant forms | AI classes |
| --- | --- | ---: |
| Ash | Type2_ | 12 |
| Athena | Type2_ | 12 |
| Chunli | Type2_ | 12 |
| Goenitz | Type2_、Type3_ | 18 |
| Haohmaru | Type2_ | 12 |
| Igniz | Type2_ | 12 |
| Iori | Type2_、Type3_ | 18 |
| K | Type2_ | 12 |
| Krizalid | C | 12 |
| Kula | Type2_ | 12 |
| Kusanagi | — | 6 |
| Kyo | Type2_ | 12 |
| KyoW | Type2_ | 12 |
| Mai | Type2_ | 12 |
| Orochi | Type2_ | 12 |
| Oswald | — | 6 |
| Rugal | Type2_ | 12 |
| Ryo | Type2_ | 12 |
| Ryu | Type2_ | 12 |
| Terry | Type2_ | 12 |
| Zero | C | 12 |


## Largest / most important classes

| Class | Bytes | Subsystem |
| --- | ---: | --- |
| `role_corn/Role.as` | 198,416 | Shared role core |
| `Oswald_AI.as` | 123,455 | AI (per character) |
| `Kyo_AI.as` | 123,090 | AI (per character) |
| `Type2_Athena_AI.as` | 122,809 | AI (per character) |
| `Type2_Ryo_AI.as` | 122,494 | AI (per character) |
| `Type2_Ryu_AI.as` | 122,301 | AI (per character) |
| `Type2_Kyo_AI.as` | 122,117 | AI (per character) |
| `Athena_AI.as` | 121,736 | AI (per character) |
| `Zero_AI.as` | 121,347 | AI (per character) |
| `K_AI.as` | 121,145 | AI (per character) |
| `Mai_AI.as` | 120,617 | AI (per character) |
| `Type2_Chunli_AI.as` | 120,612 | AI (per character) |
| `Type2_Ash_AI.as` | 120,485 | AI (per character) |
| `Type2_Mai_AI.as` | 120,425 | AI (per character) |
| `Type3_Iori_AI.as` | 120,375 | AI (per character) |
| `Type2_K_AI.as` | 120,224 | AI (per character) |
| `Chunli_AI.as` | 119,912 | AI (per character) |
| `Rugal_AI.as` | 119,847 | AI (per character) |
| `Ash_AI.as` | 119,425 | AI (per character) |
| `Type3_Goenitz_AI.as` | 119,420 | AI (per character) |
| `Type2_Rugal_AI.as` | 119,394 | AI (per character) |
| `Ryo_AI.as` | 119,291 | AI (per character) |
| `Kula_AI.as` | 119,124 | AI (per character) |
| `Type2_Kula_AI.as` | 118,930 | AI (per character) |
| `KyoW_AI.as` | 118,825 | AI (per character) |
| `Type2_Iori_AI.as` | 118,756 | AI (per character) |
| `Type2_KyoW_AI.as` | 118,750 | AI (per character) |
| `Ryu_AI.as` | 118,599 | AI (per character) |
| `Kusanagi_AI.as` | 118,494 | AI (per character) |
| `Type2_Haohmaru_AI.as` | 117,979 | AI (per character) |
| `Iori_AI.as` | 117,711 | AI (per character) |
| `Haohmaru_AI.as` | 117,626 | AI (per character) |
| `CKrizalid_AI.as` | 117,572 | AI (per character) |
| `Type2_Orochi_AI.as` | 117,497 | AI (per character) |
| `Type2_Igniz_AI.as` | 117,374 | AI (per character) |
| `Igniz_AI.as` | 117,356 | AI (per character) |
| `Terry_AI.as` | 117,314 | AI (per character) |
| `Type2_Terry_AI.as` | 117,302 | AI (per character) |
| `Orochi_AI.as` | 117,232 | AI (per character) |
| `CZero_AI.as` | 117,184 | AI (per character) |
