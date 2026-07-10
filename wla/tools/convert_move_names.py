#!/usr/bin/env python3
"""Convert the RGBDS move-name list to native WLA-DX string-map data."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


NAME_RE = re.compile(r'^\s*li\s+"([^"]+)"$')


def convert(source: Path) -> str:
    names = []
    for raw in source.read_text().splitlines():
        match = NAME_RE.fullmatch(raw)
        if match:
            names.append(match.group(1))
    if len(names) != 165:
        raise ValueError(f"expected 165 move names, found {len(names)}")
    output = [
        "; Generated from data/moves/names.asm by convert_move_names.py.",
        '.STRINGMAPTABLE pokemon "wla/pokemon.tbl"',
        "",
        "MoveNames::",
    ]
    output.extend(f'\t.STRINGMAP pokemon, "{name}@"' for name in names)
    output.extend(("", "Bank44MoveNamesEnd::", ""))
    return "\n".join(output)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    args.output.write_text(convert(args.source))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
