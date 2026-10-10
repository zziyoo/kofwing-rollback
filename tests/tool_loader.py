"""Import the pipeline tools by path.

``tools/`` is not a Python package and the tools resolve their own input/output
directories from ``__file__`` or ``sys.argv``, so the tests load each module
explicitly and control its arguments.
"""
from __future__ import annotations

import importlib.util
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
TOOLS_DIR = REPO_ROOT / "tools"
REPORTS_DIR = REPO_ROOT / "reports"
ANALYSIS_DIR = REPO_ROOT / "analysis"


def load_tool(name: str):
    """Import ``tools/<name>.py`` as a standalone module."""
    path = TOOLS_DIR / f"{name}.py"
    if not path.is_file():
        raise FileNotFoundError(f"tool not found: {path}")
    if name in sys.modules:
        return sys.modules[name]
    spec = importlib.util.spec_from_file_location(f"_reverse_tool_{name}", path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[f"_reverse_tool_{name}"] = module
    spec.loader.exec_module(module)
    return module