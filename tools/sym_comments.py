#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python sym_comments.py file.asm [pokered.sym] > file_commented.asm

Comments each label in file.asm with its bank:address from the sym file.
"""

import sys
import re

def main():
	if len(sys.argv) not in {2, 3}:
		print(f'Usage: {sys.argv[0]} file.asm [pokered.sym] > file_commented.asm', file=sys.stderr)
		sys.exit(1)

	wram_name = sys.argv[1]
	sym_name = sys.argv[2] if len(sys.argv) == 3 else 'pokered.sym'

	sym_def_rx = re.compile(r'(^{sym})(:.*)|(^\.{sym})(.*)'.format(sym=r'[A-Za-z_][A-Za-z0-9_#@]*'))

	sym_addrs = {}
	with open(sym_name, 'r', encoding='utf-8') as file:
		for line in file:
			line = line.split(';', 1)[0].rstrip()
			parts = line.split(' ', 1)
			if len(parts) != 2:
				continue
			addr, sym = parts
			sym_addrs[sym] = addr

	with open(wram_name, 'r', encoding='utf-8') as file:
		cur_label = None
		for line in file:
			line = line.rstrip()
			if (m = re.match(sym_def_rx, line)):
				sym, rest = m.group(1), m.group(2)
				if sym is None and rest is None:
					sym, rest = m.group(3), m.group(4)
				key = sym
				if not sym.startswith('.'):
					cur_label = sym
				elif cur_label:
					key = cur_label + sym
				if key in sym_addrs:
					addr = sym_addrs[key]
					line = sym + rest + ' ; ' + addr
			print(line)

if __name__ == '__main__':
	main()
