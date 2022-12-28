#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python consts.py constants/some_constants.asm

View numeric values of `const`ants.
"""

import sys
import re

const_value = 0
const_inc = 1

def asm_int(s):
	base = {'$': 16, '&': 8, '%': 2}.get(s[0], 10)
	return int(s if base == 10 else s[1:], base)

def print_const(s, v):
	print(f'{s} == {v} == ${v:x}')

def parse_for_constants(line):
	global const_value, const_inc
	if not (m := re.match(r'^\s+([A-Za-z_][A-Za-z0-9_@#]*)(?:\s+([^;\\n]+))?', line)):
		return
	macro, rest = m.groups()
	args = [arg.strip() for arg in rest.split(',')] if rest else []
	if args and not args[-1]:
		args = args[:-1]
	if macro == 'const_def':
		const_value = asm_int(args[0]) if len(args) >= 1 else 0
		const_inc = asm_int(args[1]) if len(args) >= 2 else 1
	elif macro == 'const':
		print_const(args[0], const_value)
		const_value += const_inc
	elif macro == 'shift_const':
		print_const(args[0], 1 << const_value)
		print_const(args[0] + '_F', const_value)
		const_value += const_inc
	elif macro == 'const_skip':
		const_value += const_inc * (asm_int(args[0]) if len(args) >= 1 else 1)
	elif macro == 'const_next':
		const_value = asm_int(args[0])

def main():
	if len(sys.argv) < 2:
		print(f'Usage: {sys.argv[0]} constants/some_constants.asm', file=sys.stderr)
		sys.exit(1)
	for filename in sys.argv[1:]:
		with open(filename, 'r', encoding='utf-8') as file:
			for line in file:
				parse_for_constants(line)

if __name__ == '__main__':
	main()
