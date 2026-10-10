"""Inventory determinism: the same input must always yield byte-identical output.

Deliberately runs against a handful of synthesised fixtures in a temp directory,
never the ~570 MB real corpus.
"""
from __future__ import annotations

import io
import json
import sys
import tempfile
import unittest
from contextlib import redirect_stdout
from pathlib import Path

from tests import swf_fixtures as fx
from tests.tool_loader import load_tool

swf_struct = load_tool("swf_struct")


def _build_corpus(root: Path) -> None:
    """Lay out a miniature tree with the same shape as the real one."""
    for d in ("kofwing", "stage/其他地图", "stage/a dir with spaces", "stage2/动态"):
        (root / d).mkdir(parents=True, exist_ok=True)

    (root / "kofwing" / "11480055.swf").write_bytes(fx.cws())
    (root / "kofwing" / "21256864.swf").write_bytes(fx.zws())
    (root / "kofwing" / "false_positive.swf").write_bytes(fx.no_end_tag_candidate())
    (root / "stage" / "其他地图" / "銀月橋.swf").write_bytes(fx.fws(version=6))
    (root / "stage" / "a dir with spaces" / "moon bridge.swf").write_bytes(fx.fws(version=7))
    (root / "stage2" / "动态" / "Ryo.swf").write_bytes(fx.fws(version=4))
    (root / "stage" / "garbage.swf").write_bytes(fx.garbage())


# The corpus deliberately lives under a directory whose name mixes spaces and
# CJK characters, because that is the real layout of this project and it is the
# layout most likely to break naive path handling.
CORPUS_NAME = "拳皇 Wing 前瞻版"


class InventoryDeterminismTest(unittest.TestCase):
    def setUp(self) -> None:
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.base = Path(self.tmp.name)
        self.corpus = self.base / CORPUS_NAME
        self.corpus.mkdir()
        _build_corpus(self.corpus)

    def run_struct(self, out_path: Path) -> str:
        argv = sys.argv
        sys.argv = ["swf_struct.py", str(self.corpus), str(out_path)]
        try:
            with redirect_stdout(io.StringIO()):
                rc = swf_struct.main()
        finally:
            sys.argv = argv
        self.assertEqual(rc, 0)
        return out_path.read_text(encoding="utf-8")

    def test_two_runs_produce_identical_bytes(self):
        a = self.run_struct(self.base / "run1.json")
        b = self.run_struct(self.base / "run2.json")
        self.assertEqual(a, b, "swf_struct output must be reproducible byte-for-byte")

    def test_parsed_documents_are_equal_not_just_text(self):
        one = json.loads(self.run_struct(self.base / "run3.json"))
        two = json.loads(self.run_struct(self.base / "run4.json"))
        self.assertEqual(one, two)
        self.assertEqual(one["summary"], two["summary"])

    def test_file_ordering_follows_the_native_path_sort_key(self):
        """swf_struct sorts by ``str(p).lower()`` on the *native* path.

        On Windows that separator is a backslash, which sorts after "2", so
        ``stage2\\...`` lands before ``stage\\...``. The test reproduces the tool's
        own key rather than assuming a POSIX-style ordering.
        """
        doc = json.loads(self.run_struct(self.base / "run5.json"))
        got = [r["relative_path"] for r in doc["files"]]
        expected = [
            str(p.relative_to(self.corpus)).replace("\\", "/")
            for p in sorted(self.corpus.rglob("*"), key=lambda p: str(p).lower())
            if p.is_file() and p.suffix.lower() == ".swf"
        ]
        self.assertEqual(got, expected)
        self.assertEqual(len(got), len(set(got)))

    def test_ordering_depends_on_the_platform_path_separator(self):
        """Known gap, pinned: the row order is not separator-normalised.

        ``relative_path`` is normalised to "/" but the sort key is not, so the
        same corpus enumerated on POSIX and on Windows yields different row order.
        """
        doc = json.loads(self.run_struct(self.base / "run5.json"))
        rels = [r["relative_path"] for r in doc["files"]]
        posix_style = sorted(rels, key=str.lower)
        if "\\" in str(self.corpus):
            # Windows: native separator reorders stage2/ ahead of stage/
            self.assertNotEqual(rels, posix_style)
        else:
            self.assertEqual(rels, posix_style)

    def test_summary_counts_the_fixture_corpus_correctly(self):
        doc = json.loads(self.run_struct(self.base / "run6.json"))
        s = doc["summary"]
        self.assertEqual(s["total_files"], 7)
        self.assertEqual(s["valid_swf"], 5)
        self.assertEqual(s["invalid_swf"], 2)
        self.assertEqual(s["invalid_swf"] + s["valid_swf"], s["total_files"])
        self.assertEqual(s["total_bytes"], sum(r["bytes"] for r in doc["files"]))

    def test_rejected_files_are_excluded_from_the_script_bearing_counts(self):
        doc = json.loads(self.run_struct(self.base / "run7.json"))
        s = doc["summary"]
        rejected = [r for r in doc["files"] if not r["valid_swf"]]
        self.assertTrue(rejected)
        for r in rejected:
            self.assertFalse(r["tag_walk_ok"])
            self.assertFalse(r["has_do_action"])
            self.assertFalse(r["has_do_init_action"])
            self.assertFalse(r["has_do_abc"])
        # with_as2 / with_as3 must only ever count files that actually parsed.
        self.assertLessEqual(s["with_as2"], s["valid_swf"])
        self.assertLessEqual(s["with_as3"], s["valid_swf"])
        self.assertEqual(
            s["with_as2"],
            sum(1 for r in doc["files"]
                if r["valid_swf"] and (r["has_do_action"] or r["has_do_init_action"])),
        )

    def test_output_directory_is_created_if_absent(self):
        nested = self.base / "does" / "not" / "exist" / "out.json"
        self.run_struct(nested)
        self.assertTrue(nested.is_file())


if __name__ == "__main__":
    unittest.main()