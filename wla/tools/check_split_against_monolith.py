#!/usr/bin/env python3
"""Structural split coverage checks against the fixed WLA-DX monolith."""

from __future__ import annotations

import argparse
import re
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from reconcile_audit import audit_reconcile_tree, print_reconcile_audit

BANK_RE = re.compile(r'^\.BANK\s+(\d+)(?:\s+SLOT\s+\d+)?')
LABEL_RE = re.compile(r'^[A-Za-z_][A-Za-z0-9_]*:{1,2}\s*($|;|\.)')
INCLUDE_BANK_RE = re.compile(r'^\.INCLUDE\s+"wla/pkrd/bank(\d{2})\.asm"', re.MULTILINE)


def labels_by_bank(path: Path) -> dict[int, list[str]]:
    result: dict[int, list[str]] = {}
    current_bank: int | None = None
    for raw in path.read_text(errors='replace').splitlines():
        line = raw.rstrip()
        bank = BANK_RE.match(line)
        if bank:
            current_bank = int(bank.group(1))
            result.setdefault(current_bank, [])
            continue
        if current_bank is None:
            continue
        if LABEL_RE.match(line):
            result[current_bank].append(line.split(':', 1)[0].strip())
    return result


def file_labels(path: Path) -> list[str]:
    labels: list[str] = []
    for raw in path.read_text(errors='replace').splitlines():
        line = raw.rstrip()
        if LABEL_RE.match(line):
            labels.append(line.split(':', 1)[0].strip())
    return labels


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument('monolith', type=Path)
    ap.add_argument('--split-dir', type=Path, default=Path('wla/pkrd'))
    args = ap.parse_args()

    split_dir = args.split_dir
    prelude = split_dir / 'prelude.asm'
    main = split_dir / 'main.asm'
    banks = [split_dir / f'bank{i:02d}.asm' for i in range(64)]

    missing = [path for path in [prelude, main, *banks] if not path.is_file()]
    if missing:
        print(f'FAIL missing split files: {len(missing)}')
        for path in missing[:20]:
            print(f'  {path}')
        return 1
    print('OK split files present: prelude + 64 banks + main')

    for i, path in enumerate(banks):
        text = path.read_text(errors='replace')
        if not re.search(rf'^\.BANK\s+{i}(?:\s|$)', text, re.MULTILINE):
            print(f'FAIL {path} missing .BANK {i} marker')
            return 1
    print('OK split bank files contain expected .BANK markers: 64/64')

    main_text = main.read_text(errors='replace')
    if main_text.count('.INCLUDE "wla/pkrd/prelude.asm"') != 1:
        print('FAIL main.asm missing single prelude include')
        return 1
    bank_includes = sorted(int(m.group(1)) for m in INCLUDE_BANK_RE.finditer(main_text))
    if bank_includes != list(range(64)):
        print(f'FAIL main.asm bank include set is incomplete: {bank_includes[:8]} ... {bank_includes[-8:]}')
        return 1
    if 'data/pkrd/' in '\n'.join(line for line in main_text.splitlines() if line.lstrip().startswith('.INCLUDE')):
        print('FAIL main.asm include paths still reference root data/pkrd')
        return 1
    print('OK main.asm references prelude and 64 banks')

    bank42_text = Path('wla/banks/bank42_text.asm')
    bank42_source = banks[42].read_text(errors='replace')
    if '.INCLUDE "wla/banks/bank42_text.asm"' not in bank42_source:
        print('FAIL bank42 is not using its structured Text 11 include')
        return 1
    if not bank42_text.is_file():
        print(f'FAIL structured bank42 include missing: {bank42_text}')
        return 1
    bank42_labels = file_labels(bank42_text)
    if len(bank42_labels) != 30 or bank42_labels[0] != '_ItemUseText001' or bank42_labels[-1] != 'Bank42TextEnd':
        print(f'FAIL structured bank42 label boundary changed: {len(bank42_labels)} labels')
        return 1
    bank42_text_source = bank42_text.read_text(errors='replace')
    if '.STRINGMAP pokemon,' not in bank42_text_source or '.STRINGMAPTABLE pokemon "wla/pokemon.tbl"' not in bank42_text_source:
        print('FAIL bank42 Text 11 is not using the Pokemon WLA string map')
        return 1

    charmap_source = Path('constants/charmap.asm').read_text(errors='replace').splitlines()
    expected_map: list[str] = []
    for raw in charmap_source:
        match = re.search(r'charmap\s+"([^"]*)",\s*\$([0-9a-fA-F]{2})', raw)
        if match:
            expected_map.append(f'{match.group(2).lower()}={match.group(1)}')
    table_lines = [line for line in Path('wla/pokemon.tbl').read_text(errors='replace').splitlines() if line and not line.startswith(';')]
    if table_lines != expected_map:
        print('FAIL wla/pokemon.tbl is out of sync with constants/charmap.asm')
        return 1
    if '.DSB $4000 - $0330, $00' not in bank42_source or 'Bank42End::' not in bank42_source:
        print('FAIL bank42 is missing its end-label-derived linked-size assertion')
        return 1
    print(f'OK bank42 uses structured Text 11 include: 29 records, end/size assertions, {len(table_lines)} charmap entries')

    if not args.monolith.is_file():
        print(f'FAIL monolith not found: {args.monolith}')
        return 1
    monolith_labels = labels_by_bank(args.monolith)
    if sorted(monolith_labels) != list(range(64)):
        print(f'FAIL monolith bank set is incomplete: {sorted(monolith_labels)}')
        return 1

    total_monolith_labels = 0
    total_split_labels = 0
    sample_failures: list[str] = []
    for i, bank_path in enumerate(banks):
        expected = monolith_labels.get(i, [])
        actual = set(file_labels(bank_path))
        total_monolith_labels += len(expected)
        total_split_labels += len(actual)
        sample = expected[:10]
        missing_sample = [label for label in sample if label not in actual]
        if missing_sample:
            sample_failures.append(f'bank{i:02d}: ' + ', '.join(missing_sample[:5]))
    if sample_failures:
        print('FAIL representative monolith labels missing from split:')
        for failure in sample_failures[:20]:
            print(f'  {failure}')
        return 1

    print(f'OK representative monolith labels present in split banks: {total_monolith_labels} monolith labels indexed, {total_split_labels} split labels indexed')

    reconcile_result = audit_reconcile_tree()
    print_reconcile_audit(reconcile_result)
    if not reconcile_result.ok:
        return 1

    return 0


if __name__ == '__main__':
    raise SystemExit(main())
