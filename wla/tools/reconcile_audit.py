#!/usr/bin/env python3
"""Audit wla/data reconcile files against their RGBDS data sources."""

from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path


LABEL_RE = re.compile(r'^\s*([A-Za-z_.@][A-Za-z0-9_.@]*):{1,2}\s*(?:$|;|\.|[A-Za-z_])')
DIRECTIVE_RE = re.compile(r'^\s*\.(DB|DW|DS|DN)\b(.*)$', re.IGNORECASE)
DB_RE = re.compile(r'^\s*\.DB\b(.*)$', re.IGNORECASE)
NUMBER_RE = re.compile(r'(?<![A-Za-z0-9_$])(?:\$[0-9A-Fa-f]+|\b\d+\b)')
RGBDS_ONLY_RE = re.compile(
    r'^\s*(?:table_width|assert(?:_table_length|_list_length)?|list_start|li\b|'
    r'IF\b|IF\s+DEF|ENDC|MACRO|ENDM|REPT|ENDR|FOR\b|PURGE\b)',
    re.IGNORECASE,
)


@dataclass(frozen=True)
class Issue:
    path: Path
    message: str
    line: int | None = None

    def format(self) -> str:
        location = f'{self.path}:{self.line}' if self.line is not None else str(self.path)
        return f'{location}: {self.message}'


@dataclass(frozen=True)
class AuditResult:
    reconcile_files: int
    mapped_files: int
    non_reconcile_files: int
    issues: tuple[Issue, ...]

    @property
    def ok(self) -> bool:
        return not self.issues


def _strip_comment(line: str) -> str:
    return line.split(';', 1)[0].strip()


def _labels(path: Path) -> list[str]:
    labels: list[str] = []
    for raw in path.read_text(errors='replace').splitlines():
        match = LABEL_RE.match(raw)
        if match:
            labels.append(match.group(1))
    return labels


def _active_lines(path: Path) -> list[tuple[int, str]]:
    active: list[tuple[int, str]] = []
    for line_no, raw in enumerate(path.read_text(errors='replace').splitlines(), 1):
        line = _strip_comment(raw)
        if line:
            active.append((line_no, line))
    return active


def _number_value(token: str) -> int:
    if token.startswith('$'):
        return int(token[1:], 16)
    return int(token)


def _check_file_pair(source: Path, reconcile: Path) -> list[Issue]:
    issues: list[Issue] = []
    source_text = source.read_text(errors='replace')
    reconcile_text = reconcile.read_text(errors='replace')
    reconcile_lines = reconcile_text.splitlines()
    active = _active_lines(reconcile)
    dw_string_lines: list[int] = []
    db_out_of_range: list[str] = []

    if not active:
        issues.append(Issue(reconcile, 'contains no active assembly; placeholder reconcile files are not allowed'))

    for line_no, line in active:
        if '[truncated]' in line:
            issues.append(Issue(reconcile, 'contains truncated placeholder text', line_no))

        directive = DIRECTIVE_RE.match(line)
        if directive and not directive.group(2).strip():
            issues.append(Issue(reconcile, f'.{directive.group(1).upper()} has no operand', line_no))

        if re.match(r'^\s*\.DW\s+"', line, re.IGNORECASE):
            dw_string_lines.append(line_no)

        db = DB_RE.match(line)
        if db:
            operands = db.group(1)
            for number in NUMBER_RE.finditer(operands):
                value = _number_value(number.group(0))
                if value > 0xFF:
                    db_out_of_range.append(f'{line_no}:{number.group(0)}')

        if RGBDS_ONLY_RE.match(line):
            issues.append(Issue(reconcile, 'contains an RGBDS-only macro/directive that must be translated or explicitly supported', line_no))

    if dw_string_lines:
        sample = ', '.join(str(line) for line in dw_string_lines[:10])
        suffix = '' if len(dw_string_lines) <= 10 else f', ... {len(dw_string_lines) - 10} more'
        issues.append(Issue(reconcile, f'uses .DW with string literals on line(s) {sample}{suffix}; strings must be emitted as bytes/fixed-width data, not pointers'))

    if db_out_of_range:
        sample = ', '.join(db_out_of_range[:10])
        suffix = '' if len(db_out_of_range) <= 10 else f', ... {len(db_out_of_range) - 10} more'
        issues.append(Issue(reconcile, f'contains .DB literals outside 8-bit range: {sample}{suffix}'))

    source_labels = _labels(source)
    reconcile_labels = _labels(reconcile)
    generated_labels = bool(re.search(r'^\s*[A-Za-z_.@][A-Za-z0-9_.@]*_\\1:', source_text, re.MULTILINE))
    labels_match = source_labels == reconcile_labels
    if generated_labels:
        source_iter = iter(reconcile_labels)
        labels_match = all(any(candidate == label for candidate in source_iter) for label in source_labels)
    if not labels_match:
        issues.append(
            Issue(
                reconcile,
                f'label sequence differs from {source}: source={len(source_labels)} reconcile={len(reconcile_labels)}',
            )
        )

    if re.search(r'^\s*li\s+"', source_text, re.MULTILINE) and re.search(r'^\s*\.DW\s+"', reconcile_text, re.MULTILINE | re.IGNORECASE):
        issues.append(Issue(reconcile, 'source uses list_start/li fixed-width strings but reconcile emits .DW string operands'))

    if re.search(r'^\s*bcd[23]\b', source_text, re.MULTILINE | re.IGNORECASE):
        unpacked_decimal_lines: list[int] = []
        for line_no, raw in enumerate(reconcile_lines, 1):
            line = _strip_comment(raw)
            if re.match(r'^\s*\.DB\s+\d+\s*$', line, re.IGNORECASE):
                unpacked_decimal_lines.append(line_no)
        if unpacked_decimal_lines:
            sample = ', '.join(str(line) for line in unpacked_decimal_lines[:10])
            suffix = '' if len(unpacked_decimal_lines) <= 10 else f', ... {len(unpacked_decimal_lines) - 10} more'
            issues.append(Issue(reconcile, f'source uses bcd2/bcd3 but reconcile emits unpacked decimal .DB literals on line(s) {sample}{suffix}'))

    if (re.search(r'^\s*dname\b', source_text, re.MULTILINE | re.IGNORECASE)
            and 'dname padding:' not in reconcile_text):
        issues.append(Issue(reconcile, 'source uses dname fixed-width text; reconcile must prove padding/terminator semantics explicitly'))

    return issues


def audit_reconcile_tree(data_dir: Path = Path('data'), wla_data_dir: Path = Path('wla/data')) -> AuditResult:
    issues: list[Issue] = []
    reconcile_files = sorted(wla_data_dir.rglob('*_reconcile.asm'))
    all_wla_asm = sorted(wla_data_dir.rglob('*.asm'))
    non_reconcile = [path for path in all_wla_asm if not path.name.endswith('_reconcile.asm')]
    mapped_files = 0

    for path in non_reconcile:
        issues.append(Issue(path, 'wla/data assembly file does not use the required _reconcile.asm suffix'))

    for reconcile in reconcile_files:
        rel = reconcile.relative_to(wla_data_dir)
        source = data_dir / rel.with_name(rel.name.replace('_reconcile.asm', '.asm'))
        if not source.is_file():
            issues.append(Issue(reconcile, f'no matching RGBDS source file at {source}'))
            continue
        mapped_files += 1
        issues.extend(_check_file_pair(source, reconcile))

    return AuditResult(
        reconcile_files=len(reconcile_files),
        mapped_files=mapped_files,
        non_reconcile_files=len(non_reconcile),
        issues=tuple(issues),
    )


def print_reconcile_audit(result: AuditResult, *, limit: int | None = None) -> None:
    print('WLA-DX data reconciliation audit')
    print(f'  reconcile_files      : {result.reconcile_files}')
    print(f'  mapped_to_data        : {result.mapped_files}')
    print(f'  non_reconcile_asm     : {result.non_reconcile_files}')
    print(f'  issues               : {len(result.issues)}')
    if result.issues:
        shown = result.issues if limit is None else result.issues[:limit]
        for issue in shown:
            print(f'    FAIL {issue.format()}')
        if limit is not None and len(result.issues) > limit:
            print(f'    ... {len(result.issues) - limit} more issue(s)')


def main() -> int:
    result = audit_reconcile_tree()
    print_reconcile_audit(result)
    return 0 if result.ok else 1


if __name__ == '__main__':
    raise SystemExit(main())
