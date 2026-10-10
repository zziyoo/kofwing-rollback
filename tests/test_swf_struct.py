"""SWF header + tag-stream validation: what swf_struct.py accepts and rejects."""
from __future__ import annotations

import tempfile
import unittest
from pathlib import Path

from tests import swf_fixtures as fx
from tests.tool_loader import load_tool

swf_struct = load_tool("swf_struct")


class SwfHeaderAndTagStreamTest(unittest.TestCase):
    """A file is only a valid SWF when signature + body + tag walk all agree."""

    def setUp(self) -> None:
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.dir = Path(self.tmp.name)

    def write(self, name: str, data: bytes) -> Path:
        p = self.dir / name
        p.write_bytes(data)
        return p

    def analyze(self, name: str, data: bytes) -> dict:
        return swf_struct.analyze(self.write(name, data), name)

    # --- accepted -----------------------------------------------------

    def test_uncompressed_swf_is_accepted(self):
        rec = self.analyze("plain.swf", fx.fws())
        self.assertTrue(rec["is_swf_signature"])
        self.assertTrue(rec["valid_swf"])
        self.assertTrue(rec["tag_walk_ok"])
        self.assertEqual(rec["errors"], [])
        self.assertEqual(rec["tag_total"], 5)
        self.assertEqual(rec["swf_version"], 8)
        self.assertEqual(rec["frame_rate"], 8.0)
        self.assertTrue(rec["length_match"])

    def test_zlib_swf_is_accepted_and_walks_its_tag_stream(self):
        rec = self.analyze("c.swf", fx.cws())
        self.assertEqual(rec["compression"], "zlib")
        self.assertTrue(rec["valid_swf"])
        self.assertEqual(rec["tag_total"], 5)
        self.assertEqual(rec["n_do_action"], 1)

    def test_lzma_swf_is_accepted(self):
        rec = self.analyze("z.swf", fx.zws())
        self.assertEqual(rec["compression"], "lzma")
        self.assertTrue(rec["valid_swf"])
        self.assertEqual(rec["swf_version"], 15)
        self.assertEqual(rec["tag_total"], 5)

    def test_tags_are_census_not_guessed(self):
        rec = self.analyze("plain.swf", fx.fws())
        self.assertEqual(rec["n_sprite"], 0)
        self.assertEqual(rec["n_do_abc"], 0)
        self.assertTrue(rec["has_do_action"])
        self.assertFalse(rec["has_do_init_action"])
        self.assertIn("ShowFrame", rec["tag_histogram_named"])

    # --- rejected -----------------------------------------------------

    def test_false_positive_signature_without_end_tag_is_rejected(self):
        """The exact shape rejected in the real corpus: real signature, garbage tags."""
        rec = self.analyze("fp.swf", fx.no_end_tag_candidate())
        self.assertTrue(rec["is_swf_signature"], "signature really is present")
        self.assertFalse(rec["tag_walk_ok"])
        self.assertFalse(rec["valid_swf"], "no End tag -> not a SWF")
        self.assertTrue(rec["errors"], "the reason must be recorded, not dropped")

    def test_truncated_swf_is_rejected(self):
        rec = self.analyze("trunc.swf", fx.truncated_valid_swf())
        self.assertTrue(rec["is_swf_signature"])
        self.assertFalse(rec["valid_swf"])

    def test_non_swf_bytes_are_rejected(self):
        rec = self.analyze("garbage.swf", fx.garbage())
        self.assertFalse(rec["is_swf_signature"])
        self.assertFalse(rec["valid_swf"])
        self.assertIn("bad signature", rec["errors"][0])

    def test_file_smaller_than_header_is_rejected(self):
        rec = self.analyze("tiny.swf", fx.too_small())
        self.assertFalse(rec["valid_swf"])
        self.assertIn("too small", rec["errors"][0])

    def test_corrupt_compressed_body_is_reported_not_raised(self):
        good = bytearray(fx.zws())
        good[40:80] = b"\x00" * 40          # smash the LZMA payload
        rec = self.analyze("badz.swf", bytes(good))
        self.assertFalse(rec["valid_swf"])
        self.assertTrue(rec["errors"])

    # --- the stale FileLength rule ------------------------------------

    def test_stale_declared_length_is_a_warning_not_a_rejection(self):
        rec = self.analyze("stale.swf", fx.stale_length_swf())
        self.assertTrue(rec["valid_swf"], "a stale FileLength must not reject the file")
        self.assertFalse(rec["length_match"])
        self.assertEqual(rec["length_delta"], 512)
        self.assertEqual(rec["errors"], [])
        self.assertTrue(rec["warnings"])

    def test_spec_length_for_compressed_swf_is_a_warning_too(self):
        for name, data in (("c2.swf", fx.cws()), ("z2.swf", fx.zws())):
            with self.subTest(name=name):
                rec = self.analyze(name, data)
                self.assertTrue(rec["valid_swf"])
                self.assertFalse(rec["length_match"])


class MissingInputHandlingTest(unittest.TestCase):
    """A missing input must fail loudly - never be silently skipped."""

    def test_analyze_raises_on_missing_file(self):
        with tempfile.TemporaryDirectory() as td:
            ghost = Path(td) / "not_here.swf"
            with self.assertRaises(FileNotFoundError):
                swf_struct.analyze(ghost, "not_here.swf")

    def test_analyze_records_a_hash_failure_instead_of_raising(self):
        """A file that exists but cannot be read is reported through `errors`."""
        with tempfile.TemporaryDirectory() as td:
            # A directory cannot be read as a file -> open() raises IsADirectoryError,
            # which analyze() catches and turns into a recorded error.
            d = Path(td) / "a_directory.swf"
            d.mkdir()
            rec = swf_struct.analyze(d, "a_directory.swf")
            self.assertFalse(rec["valid_swf"])
            self.assertTrue(rec["errors"])
            self.assertIsNone(rec["sha256"])

    def test_main_reports_usage_and_exits_nonzero_without_arguments(self):
        import io
        import sys
        from contextlib import redirect_stdout

        buf = io.StringIO()
        argv = sys.argv
        sys.argv = ["swf_struct.py"]
        try:
            with redirect_stdout(buf):
                rc = swf_struct.main()
        finally:
            sys.argv = argv
        self.assertEqual(rc, 2)
        self.assertIn("usage:", buf.getvalue())


if __name__ == "__main__":
    unittest.main()