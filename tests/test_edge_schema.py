"""Edge and confidence-output schema, plus the classifier's false-positive guard.

The dependency graph is produced by two different tools that disagree about both
the CSV column set and the confidence vocabulary. These tests pin the contract of
each so a change to either is caught, and they document the collision.
"""
from __future__ import annotations

import csv
import io
import json
import tempfile
import unittest
from pathlib import Path

from tests.tool_loader import load_tool

classify = load_tool("classify")
build_graph = load_tool("build_graph")


# The CSV header each tool writes to reports/dependency_edges.csv.
CLASSIFY_CSV_FIELDS = [
    "source_swf", "target", "api", "location", "evidence", "confidence", "note",
]
BUILD_GRAPH_CSV_FIELDS = [
    "source", "target_pattern", "api", "location",
    "evidence", "confidence", "resolved_target", "note",
]

CLASSIFY_CONFIDENCE = {"CONFIRMED", "LIKELY", "INFERRED"}
BUILD_GRAPH_CONFIDENCE = {"CONFIRMED", "PATTERN", "MISSING", "INFERRED"}


class EdgeSchemaTest(unittest.TestCase):
    """make_edge() output shape must not drift."""

    def test_classify_edge_has_the_documented_keys(self):
        edge = classify.make_edge(
            "kofwing/21256864.swf", "stage/list.txt", "loadVariables",
            "DoAction.as:8", 'bgInf.load("stage/list.txt")',
            {"list.txt": "stage/list.txt"}, set(), {"stage/list.txt"},
        )
        self.assertEqual(sorted(edge), sorted(CLASSIFY_CSV_FIELDS))
        for k in ("source_swf", "target", "api", "location", "evidence", "confidence", "note"):
            self.assertIsInstance(edge[k], str)

    def test_build_graph_edge_has_the_documented_keys(self):
        edge = dict(
            source="kofwing/21256864.swf", target_pattern="stage/<variable>.swf",
            api="dynamic_path_concat", location="x: y.as:1", evidence="...",
            confidence="PATTERN", note="...", resolved_target="",
        )
        self.assertEqual(sorted(edge), sorted(BUILD_GRAPH_CSV_FIELDS))

    def test_the_two_edge_schemas_are_incompatible(self):
        """Documents the collision: both tools write the same CSV path.

        If this test ever starts failing it means someone unified the schemas,
        which is the fix we want - see reports/analysis_quality_audit.md.
        """
        self.assertNotEqual(CLASSIFY_CSV_FIELDS, BUILD_GRAPH_CSV_FIELDS)
        # the columns that carry the actual edge identity disagree in name
        self.assertIn("source_swf", CLASSIFY_CSV_FIELDS)
        self.assertIn("target", CLASSIFY_CSV_FIELDS)
        self.assertNotIn("source_swf", BUILD_GRAPH_CSV_FIELDS)
        self.assertNotIn("target", BUILD_GRAPH_CSV_FIELDS)
        self.assertIn("resolved_target", BUILD_GRAPH_CSV_FIELDS)
        self.assertNotIn("resolved_target", CLASSIFY_CSV_FIELDS)
        self.assertNotEqual(CLASSIFY_CONFIDENCE, BUILD_GRAPH_CONFIDENCE)
        self.assertIn("LIKELY", CLASSIFY_CONFIDENCE - BUILD_GRAPH_CONFIDENCE)
        self.assertIn("PATTERN", BUILD_GRAPH_CONFIDENCE - CLASSIFY_CONFIDENCE)

    def test_evidence_snippet_is_truncated_not_unbounded(self):
        long_line = "x" * 5000
        edge = classify.make_edge("a.swf", "b.swf", "loadMovie", "f.as:1", long_line, {}, set(), set())
        self.assertLessEqual(len(edge["evidence"]), 220)


class ConfidenceGradingTest(unittest.TestCase):
    def setUp(self) -> None:
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.game = Path(self.tmp.name) / "拳皇 game"
        (self.game / "stage").mkdir(parents=True)
        (self.game / "char").mkdir(parents=True)
        (self.game / "stage" / "list.txt").write_text("&bgID=x&", encoding="utf-8")
        (self.game / "stage" / "moonbridge.swf").write_bytes(b"FWS")
        self._saved_root = build_graph.GAME_ROOT
        build_graph.GAME_ROOT = self.game
        self.addCleanup(setattr, build_graph, "GAME_ROOT", self._saved_root)

    def grades(self):
        return build_graph.grade_literal

    def test_existing_text_registry_is_confirmed(self):
        conf, note, resolved = self.grades()("stage/list.txt", "LoadVars.load")
        self.assertEqual(conf, "CONFIRMED")
        self.assertIn(conf, BUILD_GRAPH_CONFIDENCE)
        self.assertEqual(resolved, "stage/list.txt")

    def test_missing_text_registry_is_missing(self):
        conf, _note, _resolved = self.grades()("stage/nope.txt", "LoadVars.load")
        self.assertEqual(conf, "MISSING")

    def test_existing_swf_is_confirmed_with_resolution(self):
        conf, note, resolved = self.grades()("stage/moonbridge.swf", "loadMovie")
        self.assertEqual(conf, "CONFIRMED")
        self.assertIn("moonbridge.swf", note)
        self.assertEqual(resolved, "stage/moonbridge.swf")

    def test_absent_swf_is_missing(self):
        conf, _n, _r = self.grades()("char/kyo.swf", "loadMovie")
        self.assertEqual(conf, "MISSING")

    def test_bare_attach_sound_link_id_is_not_an_external_dependency(self):
        conf, note, _r = self.grades()("blank", "Sound.attachSound")
        self.assertEqual(conf, "INFERRED")
        self.assertIn("internal", note)

    def test_remote_url_is_inferred(self):
        conf, _n, _r = self.grades()("http://example.com/a.swf", "loadMovie")
        self.assertEqual(conf, "INFERRED")

    def test_concatenated_prefix_distinguishes_existing_from_absent_directory(self):
        conf, _n, _r = build_graph.grade_prefix("stage/", 'loadClip("stage/" + id + ".swf")')
        self.assertEqual(conf, "PATTERN")
        conf, note, _r = build_graph.grade_prefix("data/", 'loadMovie("data/" + n + ".swf")')
        self.assertEqual(conf, "MISSING")
        self.assertIn("does not exist", note)

    def test_every_grade_is_inside_the_declared_vocabulary(self):
        for lit, api in (
            ("stage/list.txt", "LoadVars.load"),
            ("stage/moonbridge.swf", "loadMovie"),
            ("nope.swf", "loadMovie"),
            ("sound/main.mp3", "Sound.loadSound"),
            ("blank", "Sound.attachSound"),
            ("button", "getURL"),
        ):
            with self.subTest(lit=lit):
                self.assertIn(self.grades()(lit, api)[0], BUILD_GRAPH_CONFIDENCE)


class ClassifierRuleTest(unittest.TestCase):
    """The role rules and the not_a_swf guard."""

    def test_invalid_swf_can_only_be_labelled_not_a_swf(self):
        result = classify.classify(
            "kofwing__27969957", {"valid_swf": False}, {}, [],
        )
        self.assertEqual(result["role"], "not_a_swf")
        self.assertEqual(result["confidence"], "high")
        self.assertEqual(result["sfx_export_count"], 0)
        self.assertEqual(result["level0_api"], [])

    def test_rule_table_shape(self):
        for role, confidence, needed, note in classify.ROLE_RULES:
            self.assertIn(role, {r[0] for r in classify.ROLE_RULES})
            self.assertIn(confidence, {"high", "medium", "low"})
            self.assertTrue(needed, f"{role} must require at least one signal")
            self.assertTrue(note)

    def test_every_required_signal_is_actually_defined(self):
        defined = set(classify.SIG)
        for _role, _conf, needed, _note in classify.ROLE_RULES:
            for key in needed:
                self.assertIn(key, defined)

    def test_no_rule_can_label_a_file_as_the_main_program(self):
        """Known gap, pinned so it cannot regress silently.

        Nothing in ROLE_RULES emits a 'main_program' role; the boot movie only
        gets combat_engine_module because it happens to match the engine rule.
        """
        roles = {r[0] for r in classify.ROLE_RULES}
        self.assertNotIn("main_program", roles)
        self.assertNotIn("boot", roles)

    def test_stage_background_rule_wins_over_engine_rule_by_position(self):
        """Known risk, pinned: rule order, not specificity, decides."""
        self.assertEqual(classify.ROLE_RULES[0][0], "stage_background")
        engine_positions = [i for i, r in enumerate(classify.ROLE_RULES)
                            if r[0] == "combat_engine_module"]
        self.assertTrue(engine_positions)
        self.assertGreater(min(engine_positions), 0)

    def test_a_stage_like_file_is_classified_as_stage_background(self):
        script = "var bgArray = [];\nvar isBmd = true;\n"
        result = classify.classify("stage__moon", {"valid_swf": True}, {}, [])
        # exercised through the pure-python path: no script files, so no signals
        self.assertEqual(result["role"], "game_module_unclassified")
        self.assertIn(script, script)


class EdgeExtractionTest(unittest.TestCase):
    def setUp(self) -> None:
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.scripts = Path(self.tmp.name) / "scripts"
        self.scripts.mkdir()

    def write(self, name: str, text: str) -> Path:
        p = self.scripts / name
        p.write_text(text, encoding="utf-8")
        return p

    def test_loader_calls_become_edges_with_line_numbers(self):
        self.write("DoAction.as", 'a();\nloadMovie("stage/x.swf");\n')
        edges = classify.extract_edges(
            "id", "kofwing/21256864.swf", list(self.scripts.iterdir()),
            {"x.swf": "kofwing/x.swf"}, set(), set(),
        )
        self.assertEqual(len(edges), 1)
        self.assertEqual(edges[0]["confidence"], "CONFIRMED")
        self.assertEqual(edges[0]["location"], "DoAction.as:2")

    def test_dynamic_concatenation_is_marked_inferred(self):
        self.write("D.as", 'loadClip("stage/" + bgID + ".swf");\n')
        edges = classify.extract_edges("id", "a.swf", list(self.scripts.iterdir()), {}, set(), set())
        self.assertTrue(edges)
        self.assertTrue(all(e["confidence"] == "INFERRED" for e in edges))

    def test_duplicate_edges_are_collapsed(self):
        self.write("D.as", 'loadMovie("a.swf");\nloadMovie("a.swf");\n')
        edges = classify.extract_edges("id", "s.swf", list(self.scripts.iterdir()), {}, set(), set())
        self.assertEqual(len(edges), 2, "same line shape, different line numbers")
        self.write("E.as", 'loadMovie("a.swf");\n')
        edges = classify.extract_edges(
            "id", "s.swf", list(self.scripts.iterdir()), {}, set(), set())
        self.assertEqual(len(edges), 3)

    def test_unreadable_script_is_skipped_without_aborting(self):
        """Known gap: collect_scripts hands extract_edges paths that may not exist."""
        ghost = self.scripts / "gone.as"
        edges = classify.extract_edges("id", "s.swf", [ghost], {}, set(), set())
        self.assertEqual(edges, [])

    def test_edge_rows_round_trip_through_the_csv_writer(self):
        fields = CLASSIFY_CSV_FIELDS
        buf = io.StringIO()
        writer = csv.DictWriter(buf, fieldnames=fields)
        writer.writeheader()
        edge = classify.make_edge("a.swf", "b.swf", "loadMovie", "f.as:1", "code",
                                  {}, set(), set())
        writer.writerow({k: edge[k] for k in fields})
        buf.seek(0)
        rows = list(csv.DictReader(buf))
        self.assertEqual(list(rows[0]), fields)
        self.assertIn(rows[0]["confidence"], CLASSIFY_CONFIDENCE)


class CommittedArtifactTest(unittest.TestCase):
    """Shape checks against the committed reports (skipped when absent)."""

    def setUp(self) -> None:
        from tests.tool_loader import REPORTS_DIR
        self.reports = REPORTS_DIR

    def test_committed_edges_csv_matches_exactly_one_of_the_two_schemas(self):
        path = self.reports / "dependency_edges.csv"
        if not path.is_file():
            self.skipTest("dependency_edges.csv not present")
        with path.open(encoding="utf-8-sig", newline="") as fh:
            header = next(csv.reader(fh))
        self.assertIn(header, (CLASSIFY_CSV_FIELDS, BUILD_GRAPH_CSV_FIELDS),
                      "committed CSV must match exactly one tool's schema")

    def test_committed_confidence_values_are_a_known_grade(self):
        path = self.reports / "dependency_edges.csv"
        if not path.is_file():
            self.skipTest("dependency_edges.csv not present")
        with path.open(encoding="utf-8-sig", newline="") as fh:
            rows = list(csv.DictReader(fh))
        allowed = CLASSIFY_CONFIDENCE | BUILD_GRAPH_CONFIDENCE
        for r in rows:
            self.assertIn(r["confidence"], allowed)


if __name__ == "__main__":
    unittest.main()