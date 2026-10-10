# File Inventory - King of Fighters Wing EX1.2

Generated from `D:\拳皇\拳皇WingEX1.2前瞻版` - all `.swf` files found recursively (including sub-directories).

## Summary

| Metric | Value |
| --- | --- |
| Total `.swf` files discovered | 97 |
| Structurally valid SWF | 93 |
| **Rejected as not-a-SWF (false positives)** | **4** |
| Files with a stale `FileLength` header | 89 |
| Files containing AS1/AS2 script | 82 |
| Files containing AS3 script (`DoABC`) | 0 |
| Files containing `DefineSprite` | 91 |
| Files containing sound tags | 6 |
| Distinct SHA-256 values | 91 |
| Duplicate groups | 6 |
| Total bytes | 594,904,068 |
| SWF versions present | [4, 6, 7, 8, 15, 24, 47] |

### What was verified before a file was accepted as an SWF

A file is only counted as a valid SWF when **all** of the following hold:

1. Bytes 0-2 are a real signature: `FWS` (uncompressed), `CWS` (zlib) or `ZWS` (LZMA).
2. The body actually decompresses.
3. The RECT + framerate + frame-count header parses.
4. The tag stream walks cleanly all the way to an `End` tag without any tag declaring more bytes than remain.

A stale `FileLength` value is reported as a **warning**, not a failure: these files were repackaged by a third-party SWF tool that left the header length untouched, while the tag stream itself is complete. JPEXS opens them normally.


## Rejected files (with the reason)

| File | Version | Bytes | Reason |
| --- | --- | --- | --- |
| `kofwing/27969957.swf` | 4 | 118,729,409 | tag 596 declares 2128240566 bytes but only 118727852 remain |
| `kofwing/40440656.swf` | 47 | 106,258,710 | tag 831 declares 1347756997 bytes but only 106256479 remain |
| `kofwing/74424254.swf` | 15 | 72,275,112 | tag 216 declares 3900357655 bytes but only 72274539 remain |
| `kofwing/84187910.swf` | 24 | 62,511,456 | tag 175 declares 3625605677 bytes but only 62510876 remain |


## All files

| Path | Size | Ver | Compress | FPS | Canvas | Tags | DoAction | DoInit | DoABC | Sprite | Img | Snd | Scripts | Role | Conf |
| --- | ---: | ---: | --- | ---: | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- | --- |
| `kofwing/11480055.swf` | 5,215,693 | 8 | zlib | 30.0 | 0.0x-102.4 | 4734 | 1 | 42 | 0 | 308 | 2062 | 68 | 1471 | combat_engine_module | high |
| `kofwing/16695748.swf` | 1,768,578 | 8 | zlib | 35.0 | -51.2x409.6 | 2097 | 1 | 44 | 0 | 214 | 819 | 42 | 956 | combat_engine_module | high |
| `kofwing/18464326.swf` | 2,353,548 | 8 | zlib | 35.0 | -51.2x409.6 | 2711 | 1 | 30 | 0 | 157 | 1158 | 54 | 452 | combat_engine_module | high |
| `kofwing/20817874.swf` | 29,157 | 15 | zlib | 24.0 | 350.4x603.2 | 178 | 1 | 37 | 0 | 46 | 0 | 0 | 59 | flash_debug_ui | high |
| `kofwing/21256864.swf` | 125,450,217 | 15 | lzma | 35.0 | 350.4x603.2 | 71378 | 39 | 733 | 0 | 6733 | 24753 | 1308 | 27122 | combat_engine_module | high |
| `kofwing/27969957.swf` | 118,729,409 | 4 | none (uncompressed) | 177.441 | 0.05x0.0 | 51 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | not_a_swf | high |
| `kofwing/40440656.swf` | 106,258,710 | 47 | none (uncompressed) | 241.363 | 22.35x-51.2 | 69 | 0 | 0 | 0 | 0 | 0 | 2 | 0 | not_a_swf | high |
| `kofwing/6148152.swf` | 40,171 | 8 | none (uncompressed) | 12.0 | -51.2x409.6 | 5 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | flash_runtime_helper | high |
| `kofwing/6230976.swf` | 4,271 | 8 | none (uncompressed) | 20.0 | -204.8x537.6 | 12 | 1 | 0 | 0 | 2 | 0 | 0 | 1 | flash_fullscreen_overlay | high |
| `kofwing/6235248.swf` | 968 | 7 | zlib | 12.0 | -51.2x409.6 | 4 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | settings_store | medium |
| `kofwing/7298128.swf` | 34,199 | 6 | zlib | 20.0 | 81.6x284.8 | 392 | 17 | 0 | 0 | 52 | 0 | 0 | 152 | flash_settings_panel | high |
| `kofwing/74424254.swf` | 72,275,112 | 15 | none (uncompressed) | 161.301 | -394.15x-377.6 | 20 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | not_a_swf | high |
| `kofwing/84187910.swf` | 62,511,456 | 24 | none (uncompressed) | 37.883 | 3.05x15.6 | 19 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | not_a_swf | high |
| `kofwing/8492959.swf` | 2,987,096 | 8 | zlib | 35.0 | -51.2x409.6 | 3039 | 1 | 44 | 0 | 206 | 1316 | 37 | 774 | combat_engine_module | high |
| `stage2/Ash.swf` | 3,826,773 | 15 | zlib | 24.0 | 350.4x603.2 | 25 | 1 | 0 | 0 | 2 | 8 | 0 | 3 | stage_background | high |
| `stage2/Athena.swf` | 741,240 | 15 | zlib | 24.0 | -716.8x-179.2 | 24 | 0 | 0 | 0 | 2 | 8 | 0 | 1 | stage_background | high |
| `stage2/Bali.swf` | 741,240 | 15 | zlib | 24.0 | -716.8x-179.2 | 24 | 0 | 0 | 0 | 2 | 8 | 0 | 1 | stage_background | high |
| `stage2/Black.swf` | 16,447 | 8 | none (uncompressed) | 30.0 | -716.8x-102.4 | 12 | 1 | 0 | 0 | 2 | 2 | 0 | 2 | stage_background | high |
| `stage2/Chunli.swf` | 3,018,885 | 15 | zlib | 24.0 | 350.4x603.2 | 25 | 1 | 0 | 0 | 2 | 8 | 0 | 3 | stage_background | high |
| `stage2/CloneTeam.swf` | 102,794 | 15 | zlib | 24.0 | -716.8x-102.4 | 54 | 1 | 0 | 0 | 11 | 12 | 0 | 2 | stage_background | high |
| `stage2/CZero.swf` | 122,483 | 15 | zlib | 24.0 | -716.8x-102.4 | 81 | 1 | 0 | 0 | 9 | 37 | 0 | 2 | stage_background | high |
| `stage2/E_Ash.swf` | 860,711 | 15 | zlib | 24.0 | -716.8x-179.2 | 222 | 1 | 0 | 0 | 5 | 107 | 0 | 4 | stage_background | high |
| `stage2/Goenitz.swf` | 1,305,064 | 15 | zlib | 24.0 | -716.8x-179.2 | 40 | 0 | 0 | 0 | 2 | 16 | 0 | 1 | stage_background | high |
| `stage2/Haohmaru.swf` | 8,678,404 | 15 | none (uncompressed) | 35.0 | 350.4x603.2 | 134 | 1 | 0 | 0 | 4 | 61 | 0 | 3 | stage_background | high |
| `stage2/Igniz_01.swf` | 490,614 | 8 | zlib | 30.0 | 350.4x603.2 | 24 | 0 | 0 | 0 | 3 | 8 | 0 | 1 | stage_background | high |
| `stage2/Igniz_02um.swf` | 98,243 | 15 | zlib | 35.0 | -716.8x-102.4 | 39 | 1 | 0 | 0 | 5 | 6 | 0 | 2 | stage_background | high |
| `stage2/Iori.swf` | 929,798 | 15 | zlib | 35.0 | 350.4x603.2 | 33 | 1 | 0 | 0 | 9 | 6 | 0 | 6 | stage_background | high |
| `stage2/Iori2.swf` | 102,172 | 8 | zlib | 30.0 | -716.8x-102.4 | 21 | 1 | 0 | 0 | 5 | 0 | 0 | 2 | stage_background | high |
| `stage2/Iori3.swf` | 603,629 | 15 | zlib | 24.0 | -716.8x-179.2 | 24 | 0 | 0 | 0 | 2 | 8 | 0 | 1 | stage_background | high |
| `stage2/K.swf` | 35,633 | 15 | zlib | 24.0 | -716.8x-102.4 | 31 | 0 | 0 | 0 | 5 | 10 | 0 | 1 | stage_background | high |
| `stage2/K2.swf` | 1,135,000 | 15 | zlib | 35.0 | -716.8x-179.2 | 35 | 1 | 0 | 0 | 9 | 9 | 0 | 3 | stage_background | high |
| `stage2/Kim.swf` | 164,081 | 15 | zlib | 34.0 | -716.8x-179.2 | 109 | 1 | 0 | 0 | 13 | 39 | 0 | 2 | stage_background | high |
| `stage2/Krizalid.swf` | 1,839,564 | 15 | zlib | 34.0 | -716.8x-179.2 | 90 | 1 | 0 | 0 | 3 | 40 | 0 | 3 | stage_background | high |
| `stage2/Kula.swf` | 422,621 | 15 | zlib | 35.0 | -716.8x-179.2 | 17 | 1 | 0 | 0 | 3 | 3 | 0 | 3 | stage_background | high |
| `stage2/Kula2.swf` | 118,741 | 15 | zlib | 34.0 | -716.8x-179.2 | 33 | 1 | 0 | 0 | 6 | 7 | 0 | 3 | stage_background | high |
| `stage2/Kyo.swf` | 760,907 | 15 | zlib | 24.0 | -716.8x-179.2 | 24 | 0 | 0 | 0 | 2 | 8 | 0 | 1 | stage_background | high |
| `stage2/Kyo2.swf` | 430,398 | 15 | zlib | 35.0 | -716.8x-179.2 | 41 | 1 | 0 | 0 | 12 | 10 | 0 | 5 | stage_background | high |
| `stage2/KyoW.swf` | 5,829,080 | 15 | zlib | 35.0 | -716.8x-179.2 | 386 | 1 | 0 | 0 | 8 | 182 | 0 | 2 | stage_background | high |
| `stage2/longStage.swf` | 265,493 | 15 | zlib | 24.0 | 350.4x603.2 | 14 | 1 | 0 | 0 | 2 | 0 | 0 | 3 | stage_background | high |
| `stage2/Mai.swf` | 743,603 | 15 | zlib | 24.0 | -716.8x-179.2 | 24 | 0 | 0 | 0 | 2 | 8 | 0 | 1 | stage_background | high |
| `stage2/Mizuchi.swf` | 140,423 | 15 | zlib | 35.0 | -716.8x-102.4 | 53 | 1 | 0 | 0 | 12 | 8 | 0 | 4 | stage_background | high |
| `stage2/Moriya.swf` | 373,682 | 15 | zlib | 24.0 | 350.4x603.2 | 80 | 1 | 0 | 0 | 7 | 33 | 0 | 3 | stage_background | high |
| `stage2/Orochi Chris.swf` | 243,855 | 8 | zlib | 30.0 | -716.8x-102.4 | 69 | 1 | 0 | 0 | 8 | 27 | 0 | 2 | stage_background | high |
| `stage2/Orochi Yashiro.swf` | 524,505 | 8 | zlib | 32.0 | -716.8x-102.4 | 190 | 1 | 0 | 0 | 14 | 84 | 0 | 2 | stage_background | high |
| `stage2/Orochi.swf` | 248,436 | 8 | zlib | 30.0 | -716.8x-102.4 | 102 | 1 | 0 | 0 | 7 | 43 | 0 | 2 | stage_background | high |
| `stage2/Oswald.swf` | 3,826,773 | 15 | zlib | 24.0 | 350.4x603.2 | 25 | 1 | 0 | 0 | 2 | 8 | 0 | 3 | stage_background | high |
| `stage2/Rugal_02.swf` | 585,909 | 8 | zlib | 30.0 | -716.8x-102.4 | 110 | 1 | 0 | 0 | 8 | 49 | 0 | 2 | stage_background | high |
| `stage2/Rugal_02um.swf` | 126,559 | 15 | zlib | 24.0 | -716.8x-179.2 | 118 | 1 | 0 | 0 | 12 | 45 | 0 | 2 | stage_background | high |
| `stage2/Rugal_98.swf` | 155,913 | 15 | zlib | 35.0 | 350.4x603.2 | 256 | 1 | 0 | 0 | 10 | 119 | 0 | 3 | stage_background | high |
| `stage2/Ryo.swf` | 115,188 | 15 | zlib | 24.0 | -716.8x-102.4 | 41 | 1 | 0 | 0 | 6 | 11 | 0 | 2 | stage_background | high |
| `stage2/Ryu.swf` | 1,228,365 | 15 | zlib | 35.0 | -716.8x-179.2 | 17 | 1 | 0 | 0 | 3 | 3 | 0 | 3 | stage_background | high |
| `stage2/Terry.swf` | 232,405 | 15 | zlib | 24.0 | -716.8x-102.4 | 23 | 0 | 0 | 0 | 4 | 7 | 0 | 1 | stage_background | high |
| `stage2/Zero.swf` | 484,096 | 15 | zlib | 30.0 | -716.8x-102.4 | 47 | 1 | 0 | 0 | 5 | 1 | 0 | 2 | stage_background | high |
| `stage2/其他地图/动态/Ash2.swf` | 482,349 | 15 | zlib | 35.0 | 350.4x603.2 | 45 | 1 | 0 | 0 | 5 | 16 | 0 | 3 | stage_background | high |
| `stage2/其他地图/动态/Dock.swf` | 488,072 | 15 | zlib | 24.0 | 350.4x603.2 | 67 | 1 | 0 | 0 | 4 | 28 | 0 | 3 | stage_background | high |
| `stage2/其他地图/动态/earth.swf` | 1,214,836 | 15 | zlib | 35.0 | 350.4x603.2 | 113 | 1 | 0 | 0 | 8 | 46 | 0 | 6 | stage_background | high |
| `stage2/其他地图/动态/Greece.swf` | 323,314 | 15 | zlib | 35.0 | -716.8x-102.4 | 92 | 1 | 0 | 0 | 13 | 32 | 0 | 2 | stage_background | high |
| `stage2/其他地图/动态/Japan.swf` | 15,140,751 | 15 | zlib | 24.0 | 350.4x603.2 | 105 | 1 | 0 | 0 | 2 | 48 | 0 | 3 | stage_background | high |
| `stage2/其他地图/动态/Orochi Chris.swf` | 243,855 | 8 | zlib | 30.0 | -716.8x-102.4 | 69 | 1 | 0 | 0 | 8 | 27 | 0 | 2 | stage_background | high |
| `stage2/其他地图/动态/Orochi Yashiro.swf` | 524,505 | 8 | zlib | 32.0 | -716.8x-102.4 | 190 | 1 | 0 | 0 | 14 | 84 | 0 | 2 | stage_background | high |
| `stage2/其他地图/动态/Rugal_02um.swf` | 126,559 | 15 | zlib | 24.0 | -716.8x-179.2 | 118 | 1 | 0 | 0 | 12 | 45 | 0 | 2 | stage_background | high |
| `stage2/其他地图/动态/Saiki.swf` | 12,439,656 | 15 | zlib | 35.0 | -716.8x-102.4 | 786 | 0 | 0 | 0 | 8 | 383 | 0 | 4 | stage_background | high |
| `stage2/其他地图/动态/祸忌.swf` | 7,235,378 | 15 | zlib | 35.0 | 350.4x603.2 | 45 | 1 | 0 | 0 | 2 | 18 | 0 | 3 | stage_background | high |
| `stage2/其他地图/静态/007.swf` | 787,391 | 7 | zlib | 30.0 | -716.8x-102.4 | 15 | 1 | 0 | 0 | 4 | 1 | 0 | 2 | stage_background | high |
| `stage2/其他地图/静态/105.swf` | 96,317 | 7 | zlib | 30.0 | -716.8x-102.4 | 15 | 1 | 0 | 0 | 4 | 1 | 0 | 2 | stage_background | high |
| `stage2/其他地图/静态/A8.swf` | 530,826 | 8 | zlib | 33.0 | -716.8x-179.2 | 11 | 1 | 0 | 0 | 2 | 1 | 0 | 2 | stage_background | high |
| `stage2/其他地图/静态/Desert.swf` | 314,259 | 15 | zlib | 35.0 | -716.8x-179.2 | 14 | 1 | 0 | 0 | 2 | 2 | 0 | 2 | stage_background | high |
| `stage2/其他地图/静态/Lab.swf` | 1,766,989 | 15 | zlib | 35.0 | 350.4x603.2 | 34 | 1 | 0 | 0 | 10 | 9 | 0 | 6 | stage_background | high |
| `stage2/其他地图/静态/Moon.swf` | 259,819 | 15 | zlib | 35.0 | -716.8x-179.2 | 67 | 1 | 0 | 0 | 9 | 23 | 0 | 5 | stage_background | high |
| `stage2/其他地图/静态/Palace.swf` | 424,919 | 15 | zlib | 35.0 | -716.8x-179.2 | 22 | 1 | 0 | 0 | 5 | 2 | 0 | 3 | stage_background | high |
| `stage2/其他地图/静态/piazza.swf` | 583,256 | 15 | zlib | 35.0 | -716.8x-179.2 | 35 | 1 | 0 | 0 | 11 | 8 | 0 | 5 | stage_background | high |
| `stage2/其他地图/静态/Platform.swf` | 4,389,799 | 15 | zlib | 35.0 | -716.8x-179.2 | 134 | 1 | 0 | 0 | 8 | 58 | 0 | 6 | stage_background | high |
| `stage2/其他地图/静态/Railway.swf` | 289,351 | 8 | zlib | 30.0 | -716.8x-102.4 | 13 | 1 | 0 | 0 | 2 | 2 | 0 | 2 | stage_background | high |
| `stage2/其他地图/静态/street.swf` | 225,181 | 8 | zlib | 30.0 | -716.8x-102.4 | 12 | 1 | 0 | 0 | 2 | 2 | 0 | 2 | stage_background | high |
| `stage2/其他地图/静态/练习.swf` | 390,513 | 15 | zlib | 24.0 | 350.4x603.2 | 17 | 1 | 0 | 0 | 4 | 0 | 0 | 3 | stage_background | high |
| `stage2/其他地图/马里奥.swf` | 8,975 | 15 | zlib | 24.0 | -716.8x-102.4 | 12 | 0 | 0 | 0 | 3 | 1 | 0 | 1 | stage_background | high |
| `stage2/练习.swf` | 390,513 | 15 | zlib | 24.0 | 350.4x603.2 | 17 | 1 | 0 | 0 | 4 | 0 | 0 | 3 | stage_background | high |
| `stage/东方实验室.swf` | 435,697 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/入口.swf` | 426,145 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/入口2.swf` | 468,990 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/冰墓.swf` | 441,601 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/双龙之塔.swf` | 267,966 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/地下巫术实验室.swf` | 333,555 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/地狱炎窟.swf` | 367,431 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/城门外.swf` | 299,093 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/寂静花园.swf` | 346,688 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/密涅瓦号帆船.swf` | 245,993 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/暗影之主.swf` | 77,301 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/狄恩斯赫特大教堂.swf` | 404,275 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/禁忌的地下水洞.swf` | 742,878 | 15 | zlib | 24.0 | 350.4x603.2 | 13 | 1 | 0 | 0 | 2 | 2 | 0 | 3 | stage_background | high |
| `stage/秘密巫术实验室.swf` | 364,006 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/练习加大版.swf` | 390,475 | 15 | zlib | 24.0 | 350.4x603.2 | 11 | 1 | 0 | 0 | 2 | 0 | 0 | 3 | stage_background | high |
| `stage/终焉之间.swf` | 268,620 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/邪恶之桥.swf` | 231,735 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/里弗人工意识.swf` | 379,191 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/阿万特村.swf` | 255,660 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |
| `stage/隧道.swf` | 151,073 | 15 | zlib | 24.0 | 350.4x603.2 | 12 | 1 | 0 | 0 | 2 | 1 | 0 | 3 | stage_background | high |


## Byte-identical duplicate groups

These paths hold identical content. Both are kept - nothing is overwritten - but only one copy needs editing if you patch a resource.

| SHA-256 (short) | Paths |
| --- | --- |
| `0d941733d7f7c249...` | `stage2/Ash.swf`<br>`stage2/Oswald.swf` |
| `ee8955bf5a89ddec...` | `stage2/Athena.swf`<br>`stage2/Bali.swf` |
| `5c34fbab8d34daa8...` | `stage2/Orochi Chris.swf`<br>`stage2/其他地图/动态/Orochi Chris.swf` |
| `25d3bf01a94ec26b...` | `stage2/Orochi Yashiro.swf`<br>`stage2/其他地图/动态/Orochi Yashiro.swf` |
| `147bfbfff669ad58...` | `stage2/Rugal_02um.swf`<br>`stage2/其他地图/动态/Rugal_02um.swf` |
| `132058611cfcd55f...` | `stage2/其他地图/静态/练习.swf`<br>`stage2/练习.swf` |
