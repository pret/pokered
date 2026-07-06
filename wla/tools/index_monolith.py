#!/usr/bin/env python3
"""Index the fixed WLA-DX monolith for reconciliation planning."""

from __future__ import annotations

import argparse
import re
from pathlib import Path

BANK_RE = re.compile(r'^\.BANK\s+(\d+)(?:\s+SLOT\s+\d+)?')
ORG_RE = re.compile(r'^\.ORG\s+\$[0-9A-F]+', re.IGNORECASE)
ENUM_RE = re.compile(r'^\.enum\s+\$[0-9A-F]+\s+export', re.IGNORECASE)
LABEL_RE = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*:\s*($|;|\.)')
MEMORYMAP_RE = re.compile(r'^\.(MEMORYMAP|ROMBANKMAP|ROMBANKSIZE|ROMBANKS|ENDME|ENDRO)')


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument('monolith', type=Path)
    args = ap.parse_args()
    if not args.monolith.is_file():
        print(f'MONOLITH missing: {args.monolith}')
        return 1

    banks: set[int] = set()
    bank_lines: list[str] = []
    org_lines: list[str] = []
    enum_lines: list[str] = []
    labels: list[str] = []
    memory_map: list[str] = []
    current_bank: int | None = None
    boundaries: list[tuple[int, int, int]] = []

    for lineno, raw in enumerate(args.monolith.read_text(errors='replace').splitlines(), start=1):
        line = raw.rstrip()
        if MEMORYMAP_RE.match(line):
            memory_map.append(f'{lineno}:{line}')
        bank = BANK_RE.match(line)
        if bank:
            current_bank = int(bank.group(1))
            banks.add(current_bank)
            bank_lines.append(f'{lineno}:{line}')
            boundaries.append((current_bank, lineno, 0))
            continue
        if ORG_RE.match(line):
            org_lines.append(f'{lineno}:{line}')
        if ENUM_RE.match(line):
            enum_lines.append(f'{lineno}:{line}')
        if LABEL_RE.match(line):
            labels.append(line.split(':', 1)[0].strip())
            if current_bank is not None and boundaries:
                bank_no, start_line, count = boundaries[-1]
                boundaries[-1] = (bank_no, start_line, count + 1)

    print(f'MONOLITH {args.monolith}')
    print(f'  banks        : {len(banks)}')
    print(f'  enum_blocks  : {len(enum_lines)}')
    print(f'  org_regions  : {len(org_lines)}')
    print(f'  top_labels   : {len(labels)}')
    if memory_map:
        print('  memory_map   :')
        for line in memory_map[:20]:
            print(f'   {line}')
    if bank_lines:
        print('  bank_headers :')
        for line in bank_lines[:64]:
            print(f'   {line}')
    if org_lines:
        print('  org_regions  :')
        for line in org_lines[:40]:
            print(f'   {line}')
    if enum_lines:
        print('  enum_exports :')
        for line in enum_lines[:40]:
            print(f'   {line}')
    if boundaries:
        print('  bank_label_counts:')
        for bank_no, start_line, count in boundaries[:64]:
            print(f'   bank{bank_no:02d}: line {start_line}, labels {count}')
    if labels:
        print('  sample_labels:')
        for label in labels[:80]:
            print(f'   {label}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
