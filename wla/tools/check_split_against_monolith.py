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

    bank39_text = Path('wla/banks/bank39_text.asm')
    bank39_source = banks[39].read_text(errors='replace')
    if '.INCLUDE "wla/banks/bank39_text.asm"' not in bank39_source:
        print('FAIL bank39 is not using its structured Text 8 include')
        return 1
    bank39_labels = file_labels(bank39_text)
    if len(bank39_labels) != 202 or bank39_labels[0] != '_VermilionGymLTSurgePostBattleAdviceText' or bank39_labels[-1] != 'Bank39TextEnd':
        print(f'FAIL structured bank39 label boundary changed: {len(bank39_labels)} labels')
        return 1
    if '.DSB $4000 - $2aa4, $00' not in bank39_source or 'Bank39End::' not in bank39_source:
        print('FAIL bank39 is missing its end-label and linked-size assertion')
        return 1
    print('OK bank39 uses structured Text 8 include: 201 records, end/size assertions')

    bank40_text = Path('wla/banks/bank40_text.asm')
    bank40_source = banks[40].read_text(errors='replace')
    if '.INCLUDE "wla/banks/bank40_text.asm"' not in bank40_source:
        print('FAIL bank40 is not using its structured Text 9 include')
        return 1
    bank40_labels = file_labels(bank40_text)
    if len(bank40_labels) != 207 or bank40_labels[0] != '_FuchsiaGymKogaPostBattleAdviceText' or bank40_labels[-1] != 'Bank40TextEnd':
        print(f'FAIL structured bank40 label boundary changed: {len(bank40_labels)} labels')
        return 1
    if '.DSB $4000 - $2a37, $00' not in bank40_source or 'Bank40End::' not in bank40_source:
        print('FAIL bank40 is missing its end-label and linked-size assertion')
        return 1
    print('OK bank40 uses structured Text 9 include: 206 records, end/size assertions')

    bank41_text = Path('wla/banks/bank41_text.asm')
    bank41_source = banks[41].read_text(errors='replace')
    if '.INCLUDE "wla/banks/bank41_text.asm"' not in bank41_source:
        print('FAIL bank41 is not using its structured Text 10 include')
        return 1
    bank41_labels = file_labels(bank41_text)
    if len(bank41_labels) != 222 or bank41_labels[0] != '_CableClubNPCPleaseComeAgainText' or bank41_labels[-1] != 'Bank41TextEnd':
        print(f'FAIL structured bank41 label boundary changed: {len(bank41_labels)} labels')
        return 1
    if '.DSB $4000 - $2b94, $00' not in bank41_source or 'Bank41End::' not in bank41_source:
        print('FAIL bank41 is missing its end-label and linked-size assertion')
        return 1
    print('OK bank41 uses structured Text 10 include: 221 records, end/size assertions')

    bank43_text = Path('wla/banks/bank43_dex_text.asm')
    bank43_source = banks[43].read_text(errors='replace')
    if '.INCLUDE "wla/banks/bank43_dex_text.asm"' not in bank43_source:
        print('FAIL bank43 is not using its structured Pokédex Text include')
        return 1
    bank43_labels = file_labels(bank43_text)
    if len(bank43_labels) != 152 or bank43_labels[0] != '_RhydonDexEntry' or bank43_labels[-1] != 'Bank43DexTextEnd':
        print(f'FAIL structured bank43 label boundary changed: {len(bank43_labels)} labels')
        return 1
    if '.DSB $4000 - $3838, $00' not in bank43_source or 'Bank43End::' not in bank43_source:
        print('FAIL bank43 is missing its end-label and linked-size assertion')
        return 1
    print('OK bank43 uses structured Pokédex Text include: 151 records, end/size assertions')

    bank44_names = Path('wla/banks/bank44_move_names.asm')
    bank44_source = banks[44].read_text(errors='replace')
    if '.INCLUDE "wla/banks/bank44_move_names.asm"' not in bank44_source:
        print('FAIL bank44 is not using its structured Move Names include')
        return 1
    bank44_labels = file_labels(bank44_names)
    if bank44_labels != ['MoveNames', 'Bank44MoveNamesEnd']:
        print(f'FAIL structured bank44 label boundary changed: {bank44_labels}')
        return 1
    move_name_count = bank44_names.read_text(errors='replace').count('.STRINGMAP pokemon,')
    if move_name_count != 165:
        print(f'FAIL structured bank44 move-name count changed: {move_name_count}')
        return 1
    if '.DSB $4000 - $060f, $00' not in bank44_source or 'Bank44End::' not in bank44_source:
        print('FAIL bank44 is missing its end-label and linked-size assertion')
        return 1
    print('OK bank44 uses structured Move Names include: 165 records, end/size assertions')

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
