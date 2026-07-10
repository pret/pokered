#!/usr/bin/env python3
"""Convert RGBDS Pokédex text records to native WLA-DX string-map data."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


LABEL_RE = re.compile(r"^(_[A-Za-z0-9]+DexEntry)::$")
TEXT_RE = re.compile(r'^\s*(text|next|page)\s+"(.*)"$')
COMMANDS = {"text": "$00", "next": "$4e", "page": "$49"}


def convert(source: Path) -> str:
    output = [
        "; Generated from data/pokemon/dex_text.asm by convert_dex_text.py.",
        '.STRINGMAPTABLE pokemon "wla/pokemon.tbl"',
        "",
    ]
    records = 0
    for line_number, raw in enumerate(source.read_text().splitlines(), 1):
        line = raw.strip()
        if not line:
            continue
        label = LABEL_RE.fullmatch(line)
        if label:
            output.extend((f"{label.group(1)}::", "\t.DB $00"))
            records += 1
            continue
        text = TEXT_RE.fullmatch(raw)
        if text:
            command, value = text.groups()
            if command != "text":
                output.append(f"\t.DB {COMMANDS[command]}")
            output.append(f'\t.STRINGMAP pokemon, "{value}"')
            continue
        if line == "dex":
            output.extend(("\t.DB $5f, $50", ""))
            continue
        raise ValueError(f"{source}:{line_number}: unsupported line: {raw}")
    if records != 151:
        raise ValueError(f"expected 151 Pokédex records, found {records}")
    output.append("Bank43DexTextEnd::")
    return "\n".join(output) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    args.output.write_text(convert(args.source))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
