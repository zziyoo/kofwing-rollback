"""Automated checks for the KOF Wing EX1.2 SWF analysis toolchain.

Run from the repository root:

    python -m unittest discover -s tests -t .

Standard library only. No network access, no third-party test runner.

The fixtures used here are synthesised byte-for-byte in ``swf_fixtures``; no real
game asset is copied into this directory.
"""