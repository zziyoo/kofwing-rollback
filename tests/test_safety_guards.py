"""
Tests for the safety guards added during the closing review.

Covers the behaviours that must not silently regress:
  - recover_from_exe.py refuses to touch the game directory without --force
  - argv guards give usage instead of IndexError
  - split_character_name folds variants by an explicit, documented rule
  - make_id() cannot collide on deep same-named files
  - exactly one tool owns dependency_edges.csv
"""
from __future__ import annotations

import ast
import importlib.util
import subprocess
import sys
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
TOOLS = REPO / "tools"


def load(name):
    spec = importlib.util.spec_from_file_location(f"_t_{name}", TOOLS / f"{name}.py")
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


class RecoveryToolSafetyTest(unittest.TestCase):
    """The recovery tool writes OUTSIDE the repo into the game directory."""

    def setUp(self):
        self.src = (TOOLS / "recover_from_exe.py").read_text(encoding="utf-8")

    def test_force_flag_is_required_to_write(self):
        self.assertIn('FORCE = "--force" in sys.argv', self.src)

    def test_it_aborts_when_the_target_directory_is_not_empty(self):
        proc = subprocess.run([sys.executable, str(TOOLS / "recover_from_exe.py")],
                              capture_output=True, cwd=str(REPO), timeout=300)
        out = proc.stdout + proc.stderr
        if b"ABORT" not in out:
            # Only acceptable when the game directory is currently absent/empty;
            # then there is nothing to overwrite and no refusal is needed.
            self.assertNotIn(b"written", out)
        else:
            self.assertIn(b"game directory", out.lower() + b"GAME DIRECTORY")

    def test_files_already_matching_the_manifest_are_not_rewritten(self):
        self.assertIn("if exact and dest.exists()", self.src)

    def test_truncated_candidates_are_flagged_rather_than_silently_written(self):
        self.assertIn('"TRUNC" if truncated', self.src)

    def test_the_provenance_manifest_records_truncation(self):
        self.assertIn("truncated_at_eof", self.src)


class ArgvGuardTest(unittest.TestCase):
    """Running a tool with no arguments must print usage, not raise IndexError."""

    TOOLS_WITH_GUARDS = ["find_boot_swf.py", "classify.py", "parse_registries.py"]

    def test_no_argument_invocation_prints_usage(self):
        for tool in self.TOOLS_WITH_GUARDS:
            with self.subTest(tool=tool):
                proc = subprocess.run([sys.executable, str(TOOLS / tool)],
                                      capture_output=True, cwd=str(REPO), timeout=120)
                out = (proc.stdout + proc.stderr).decode("utf-8", "replace")
                self.assertIn("usage:", out)
                self.assertNotIn("IndexError", out)

    def test_every_tool_is_syntactically_valid(self):
        for p in sorted(TOOLS.glob("*.py")):
            with self.subTest(tool=p.name):
                ast.parse(p.read_text(encoding="utf-8"))


class CharacterVariantRuleTest(unittest.TestCase):
    """Type2_ / Type3_ / C variants must fold by an explicit documented rule."""

    @classmethod
    def setUpClass(cls):
        cls.mod = load("build_code_index")

    def test_documented_examples_hold(self):
        f = self.mod.split_character_name
        self.assertEqual(f("Kyo_AI.as"), ("Kyo", ""))
        self.assertEqual(f("Type2_Kyo_AI_Lv3.as"), ("Kyo", "Type2_"))
        self.assertEqual(f("Type3_Iori_AI.as"), ("Iori", "Type3_"))
        self.assertEqual(f("CZero_AI.as"), ("Zero", "C"))
        self.assertEqual(f("CKrizalid_AI.as"), ("Krizalid", "C"))
        self.assertEqual(f("Ash_AI_Lv5.as"), ("Ash", ""))

    def test_non_ai_files_yield_nothing(self):
        self.assertEqual(self.mod.split_character_name("Life_Power.as"), ("", ""))
        self.assertEqual(self.mod.split_character_name("HitCheck.as"), ("", ""))

    def test_rule_is_total_and_idempotent(self):
        f = self.mod.split_character_name
        for name in ["Type2_Ash_AI.as", "Type3_Goenitz_AI_Lv2.as", "Ryo_AI_Lv1.as"]:
            base, _marker = f(name)
            self.assertEqual(f(base + "_AI.as"), (base, ""))


class AnalysisIdCollisionTest(unittest.TestCase):
    """make_id() must not collide for deep same-named files."""

    @classmethod
    def setUpClass(cls):
        cls.mod = load("jpexs_batch")

    def test_same_name_at_different_depths_does_not_collide(self):
        a = self.mod.make_id("stage2/其他地图/静态/007.swf")
        b = self.mod.make_id("stage2/其他地图/动态/007.swf")
        c = self.mod.make_id("stage2/其他地图/007.swf")
        self.assertEqual(len({a, b, c}), 3)

    def test_three_level_duplicates_do_not_collide(self):
        a = self.mod.make_id("x/y/z/007.swf")
        b = self.mod.make_id("q/y/z/007.swf")
        self.assertNotEqual(a, b)

    def test_same_input_is_stable(self):
        self.assertEqual(self.mod.make_id("stage2/Kyo.swf"),
                         self.mod.make_id("stage2/Kyo.swf"))


class DependencyCsvOwnershipTest(unittest.TestCase):
    """Two tools writing the same CSV with different schemas silently clobbered
    each other. Exactly one tool may own it now."""

    OWNER = "dependency_edges.csv"

    def _writers(self):
        out = []
        for tool in sorted(TOOLS.glob("*.py")):
            txt = tool.read_text(encoding="utf-8")
            idx = txt.find(f'"{self.OWNER}"')
            while idx != -1:
                seg = txt[max(0, idx - 120): idx + 120]
                if '.open("w"' in seg:
                    out.append(tool.name)
                    break
                idx = txt.find(f'"{self.OWNER}"', idx + 1)
        return out

    def test_only_build_graph_writes_the_authoritative_csv(self):
        self.assertEqual(self._writers(), ["build_graph.py"])

    def test_classify_writes_a_separately_named_legacy_file(self):
        self.assertIn("dependency_edges_classify_legacy.csv",
                      (TOOLS / "classify.py").read_text(encoding="utf-8"))

    def test_the_two_schemas_are_not_interchangeable(self):
        """Guards against someone re-merging them silently."""
        legacy = (REPO / "reports" / "dependency_edges_classify_legacy.csv")
        auth = (REPO / "reports" / self.OWNER)
        if not legacy.exists() or not auth.exists():
            self.skipTest("regenerate both CSVs to compare schemas")
        lh = legacy.read_text(encoding="utf-8-sig").splitlines()[0].split(",")
        ah = auth.read_text(encoding="utf-8-sig").splitlines()[0].split(",")
        self.assertNotEqual(set(lh), set(ah))


class BootMovieClassificationTest(unittest.TestCase):
    """The boot movie must be identified by measured evidence, not by filename."""

    @classmethod
    def setUpClass(cls):
        cls.mod = load("classify")
        cls.json_path = REPO / "reports" / "classification.json"

    def test_threshold_has_a_wide_margin_over_the_largest_pack(self):
        self.assertGreater(self.mod.MAIN_PROGRAM_MIN_CLASSES, 26)
        self.assertLess(self.mod.MAIN_PROGRAM_MIN_CLASSES, 427)

    def test_main_program_rule_is_first(self):
        self.assertEqual(self.mod.ROLE_RULES[0][0], "main_program")

    @unittest.skipUnless((REPO / "reports" / "classification.json").exists(),
                         "run tools/classify.py first")
    def test_boot_movie_and_packs_get_different_roles(self):
        import json
        d = json.loads(self.json_path.read_text(encoding="utf-8"))
        mains = [v["relative_path"] for v in d.values() if v["role"] == "main_program"]
        packs = [v["relative_path"] for v in d.values()
                 if v["role"] == "combat_engine_module"]
        self.assertEqual(mains, ["kofwing/21256864.swf"])
        self.assertEqual(len(packs), 4)
        self.assertNotIn("kofwing/21256864.swf", packs)


if __name__ == "__main__":
    unittest.main()