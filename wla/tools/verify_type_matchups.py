#!/usr/bin/env python3
"""Verify WLA type matchup reconciliation against the RGBDS source table."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


DEFAULT_SOURCE_CANDIDATES = (
    Path("data/types/type_matchups.asm"),
    Path("/data/src/pokered/data/types/type_matchups.asm"),
)
DEFAULT_TARGET = Path("wla/data/types/type_matchups_reconcile.asm")
LABEL_RE = re.compile(r"^\s*([A-Za-z_.@][A-Za-z0-9_.@]*):{1,2}\s*(?:$|;)")
DB_RE = re.compile(r"^\s*\.?DB\b(.*)$", re.IGNORECASE)


def resolve_default_source() -> Path:
    for path in DEFAULT_SOURCE_CANDIDATES:
        if path.is_file():
            return path
    return DEFAULT_SOURCE_CANDIDATES[0]


def normalize_operands(operands: str) -> str:
    return " ".join(part.strip().upper() for part in operands.split(","))


def db_entries(path: Path) -> list[tuple[int, str]]:
    entries: list[tuple[int, str]] = []
    for line_no, raw in enumerate(path.read_text(errors="replace").splitlines(), 1):
        line = raw.split(";", 1)[0].strip()
        if not line:
            continue
        match = DB_RE.match(line)
        if match:
            entries.append((line_no, normalize_operands(match.group(1))))
    return entries


def labels(path: Path) -> list[str]:
    found: list[str] = []
    for raw in path.read_text(errors="replace").splitlines():
        match = LABEL_RE.match(raw)
        if match:
            found.append(match.group(1))
    return found


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", type=Path, default=resolve_default_source())
    ap.add_argument("--target", type=Path, default=DEFAULT_TARGET)
    args = ap.parse_args()

    if not args.source.is_file():
        print(f"FAIL source not found: {args.source}")
        return 1
    if not args.target.is_file():
        print(f"FAIL target not found: {args.target}")
        return 1

    source_labels = labels(args.source)
    target_labels = labels(args.target)
    if source_labels != target_labels:
        print(f"FAIL label sequence differs: source={source_labels} target={target_labels}")
        return 1

    source_entries = db_entries(args.source)
    target_entries = db_entries(args.target)
    source_values = [entry for _, entry in source_entries]
    target_values = [entry for _, entry in target_entries]

    print("Type matchup reconciliation verification")
    print(f"  source : {args.source}")
    print(f"  target : {args.target}")
    print(f"  source DB entries: {len(source_values)}")
    print(f"  target DB entries: {len(target_values)}")

    if len(source_values) != len(target_values):
        print("FAIL DB entry count differs")
        return 1

    for index, (source, target) in enumerate(zip(source_values, target_values), 1):
        if source != target:
            source_line = source_entries[index - 1][0]
            target_line = target_entries[index - 1][0]
            print(
                "FAIL DB entry differs at "
                f"#{index}: source line {source_line}={source!r}, "
                f"target line {target_line}={target!r}"
            )
            return 1

    if not target_values or target_values[-1] != "-1":
        print(f"FAIL target final DB entry is not the -1 terminator: {target_values[-1] if target_values else '<none>'}")
        return 1

    print("OK full DB table matches, including -1 terminator")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
