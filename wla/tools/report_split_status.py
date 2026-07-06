#!/usr/bin/env python3
"""Report the current WLA-DX reconciliation scaffold status."""

from __future__ import annotations

import argparse
import re
from pathlib import Path

BANK_RE = re.compile(r'^\.BANK\s+(\d+)(?:\s+SLOT\s+\d+)?')
LABEL_RE = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*:\s*($|;|\.)')


def monolith_bank_label_counts(path: Path) -> dict[int, int]:
    counts: dict[int, int] = {}
    current_bank: int | None = None
    if not path.is_file():
        return counts
    for raw in path.read_text(errors='replace').splitlines():
        line = raw.rstrip()
        bank = BANK_RE.match(line)
        if bank:
            current_bank = int(bank.group(1))
            counts.setdefault(current_bank, 0)
            continue
        if current_bank is not None and LABEL_RE.match(line):
            counts[current_bank] += 1
    return counts


def split_label_count(path: Path) -> int:
    return sum(1 for line in path.read_text(errors='replace').splitlines() if LABEL_RE.match(line.rstrip()))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument('--split-dir', type=Path, default=Path('wla/pkrd'))
    ap.add_argument('--monolith', type=Path, default=Path('/data/pkrd/pkrd-noanon-hram-fixed.asm'))
    args = ap.parse_args()

    prelude = args.split_dir / 'prelude.asm'
    main = args.split_dir / 'main.asm'
    banks = [args.split_dir / f'bank{i:02d}.asm' for i in range(64)]
    missing = [path for path in [prelude, main, *banks] if not path.is_file()]
    monolith_counts = monolith_bank_label_counts(args.monolith)
    split_counts = {i: split_label_count(path) for i, path in enumerate(banks) if path.is_file()}
    uncovered = [i for i in sorted(monolith_counts) if monolith_counts.get(i, 0) and split_counts.get(i, 0) == 0]

    print('WLA-DX reconciliation status')
    print(f'  branch_goal : master-preserving scaffold; no broad source conversion')
    print(f'  split_dir   : {args.split_dir}')
    print(f'  monolith    : {args.monolith}')
    print(f'  prelude     : {"present" if prelude.is_file() else "missing"}')
    print(f'  main        : {"present" if main.is_file() else "missing"}')
    print(f'  bank_count  : {sum(path.is_file() for path in banks)}/64')
    print(f'  monolith_banks_indexed: {len(monolith_counts)}')
    print(f'  monolith_labels_indexed: {sum(monolith_counts.values())}')
    print(f'  split_labels_indexed: {sum(split_counts.values())}')
    if missing:
        print(f'  missing     : {len(missing)}')
        for path in missing[:20]:
            print(f'    {path}')
    else:
        print('  missing     : none')
    print(f'  uncovered_label_banks: {", ".join(f"bank{i:02d}" for i in uncovered[:20]) if uncovered else "none"}')
    print('  next_phase : choose one small master-aligned bank/region and reconcile it without replacing the RGBDS tree.')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
