"""
Extract the complete move list (出招表) from skillList.swf.

skillList.swf embeds one inline XML literal per (character, mode):
    var <Char><Mode> = new XML("<char><skillList skill=.. normal=.. easy=.. describe=../></char>");
and looks it up at runtime with:
    xml = _root[_root.currentName + _root.currentMode];

So the move table is fully self-contained in this SWF - no external XML file is
needed after all (the `xmlLoad` export is UI chrome, not a data source).

Output: reports/move_list.json + reports/move_list.md
"""
from __future__ import annotations

import html
import json
import re
from pathlib import Path

SRC = Path(r"D:\kof_rescue\skilllist_scripts")
REPORTS = Path(r"D:\拳皇\拳皇WingEX1.2前瞻版\_reverse\reports")

VAR_RE = re.compile(r"var\s+([A-Za-z0-9_]+)\s*=\s*new\s+XML\(\s*\"(.*?)\"\s*\)\s*;", re.S)
SKILL_RE = re.compile(r"<skillList\s+([^/>]*)/>")
ATTR_RE = re.compile(r'(\w+)\s*=\s*"([^"]*)"')


def main() -> int:
    entries: dict[str, dict] = {}
    for p in SRC.rglob("*.as"):
        try:
            text = p.read_text(encoding="utf-8", errors="replace")
        except Exception:
            continue
        for m in VAR_RE.finditer(text):
            var = m.group(1)
            # JPEXS emits the ActionScript string literal with escaped quotes
            # (\" ) - undo that before parsing the embedded XML.
            raw = m.group(2).replace('\\"', '"').replace("\\\\", "\\")
            raw = html.unescape(raw)
            moves = []
            for sm in SKILL_RE.finditer(raw):
                attrs = dict(ATTR_RE.findall(sm.group(1)))
                moves.append({
                    "skill": attrs.get("skill", ""),
                    "normal": attrs.get("normal", ""),
                    "easy": attrs.get("easy", ""),
                    "describe": attrs.get("describe", ""),
                })
            if moves:
                entries[var] = {
                    "variable": var,
                    "source": str(p.relative_to(SRC)).replace("\\", "/"),
                    "mode": var[-1] if var[-1].isdigit() else "?",
                    "character": var[:-1] if var[-1].isdigit() else var,
                    "move_count": sum(1 for x in moves if x["skill"]),
                    "moves": moves,
                }

    REPORTS.mkdir(parents=True, exist_ok=True)
    (REPORTS / "move_list.json").write_text(
        json.dumps(entries, ensure_ascii=False, indent=1), encoding="utf-8")

    chars = sorted({e["character"] for e in entries.values()})
    total_moves = sum(e["move_count"] for e in entries.values())

    md = ["# 出招表总表 (从 skillList.swf 提取)\n",
          "`skillList.swf` 内嵌每个角色的出招表，形式为内联 XML 字面量。",
          "运行期通过 `_root[currentName + currentMode]` 按变量名取用。\n",
          f"**已提取 {len(entries)} 份（角色×模式）表，合计 {total_moves} 条招式，覆盖 {len(chars)} 个角色。**\n",
          "\n## 总览\n",
          "| 变量 | 角色 | 模式 | 招式数 | 来源脚本 |", "| --- | --- | ---: | ---: | --- |"]
    for v in sorted(entries, key=lambda k: (entries[k]["character"], entries[k]["mode"])):
        e = entries[v]
        md.append(f"| `{v}` | {e['character']} | {e['mode']} | {e['move_count']} | "
                  f"`{e['source']}` |")

    md.append("\n## 明细\n")
    for v in sorted(entries, key=lambda k: (entries[k]["character"], entries[k]["mode"])):
        e = entries[v]
        md.append(f"\n### {e['character']} (mode {e['mode']}) — `{v}`\n")
        md.append("| 分类 | 招式 | 普通指令 | 易指令 | 说明 |")
        md.append("| --- | --- | --- | --- | --- |")
        section = ""
        for mv in e["moves"]:
            if mv["skill"] and not mv["normal"] and not mv["easy"]:
                section = mv["skill"]
                md.append(f"| **{section}** | | | | |")
                continue
            md.append(f"| {section} | {mv['skill']} | `{mv['normal']}` | "
                      f"`{mv['easy']}` | {mv['describe']} |")

    (REPORTS / "move_list.md").write_text("\n".join(md), encoding="utf-8")
    print(f"提取完成: {len(entries)} 份表, {total_moves} 条招式, {len(chars)} 个角色")
    print("角色:", ", ".join(chars))
    print("模式: 1 和 2 均有表" if len({e['mode'] for e in entries.values()}) > 1 else "仅单一模式")
    for f in sorted(entries, key=lambda k: entries[k]["character"])[:6]:
        e = entries[f]
        print(f"  {f:<12} {e['move_count']:>3} 条")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())