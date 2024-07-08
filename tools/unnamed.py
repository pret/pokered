#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: unnamed.py [-h] [-r rootdir] [-l count] pokered.sym

Parse the symfile to find unnamed symbols.
"""

import sys
import argparse
import subprocess
import struct
import enum
import signal

class symtype(enum.Enum):
	LOCAL = 0
	IMPORT = 1
	EXPORT = 2

def unpack_from(fmt, file):
	size = struct.calcsize(fmt)
	return struct.unpack(fmt, file.read(size))

def read_string(file):
	buf = bytearray()
	while True:
		b = file.read(1)
		if b is None or b == b'\0':
			return buf.decode()
		buf += b

# Fix broken pipe when using `head`
signal.signal(signal.SIGPIPE, signal.SIG_DFL)

parser = argparse.ArgumentParser(description='Parse the symfile to find unnamed symbols')
parser.add_argument('symfile', type=argparse.FileType('r'),
	help='the list of symbols')
parser.add_argument('-r', '--rootdir', type=str,
	help='scan the output files to obtain a list of files with unnamed symbols (note: will rebuild objects as necessary)')
parser.add_argument('-l', '--list', type=int, default=0,
	help="output this many of each file's unnamed symbols (note: requires -r)")
args = parser.parse_args()

# Get list of object files
objects = None
if args.rootdir:
	for line in subprocess.Popen(['make', '-C', args.rootdir, '-s', '-p', 'DEBUG=1'],
			stdout=subprocess.PIPE).stdout.read().decode().split('\n'):
		if line.startswith('pokered_obj :='):
			objects = line[len('pokered_obj :='):].strip().split()
			break
	else:
		print('Error: Object files not found!', file=sys.stderr)
		sys.exit(1)

# Scan all unnamed symbols from the symfile
symbols_total = 0
symbols = set()
for line in args.symfile:
	line = line.split(';')[0].strip()
	split = line.split(' ')
	if len(split) < 2:
		continue

	symbols_total += 1

	symbol = ' '.join(split[1:]).strip()
	if symbol[-3:].lower() == split[0][-3:].lower():
		symbols.add(symbol)

# If no object files were provided, just print what we know and exit
unnamed_percent = 100 * (symbols_total - len(symbols)) / symbols_total
print(f'Unnamed pokered symbols: {len(symbols)} ({unnamed_percent:.2f}% complete)')
if not objects:
	for sym in symbols:
		print(sym)
	sys.exit()

# Count the amount of symbols in each file
file_symbols = {}
for objfile in objects:
	with open(objfile, 'rb') as file:
		obj_ver = None

		magic = unpack_from('4s', file)[0]
		if magic == b'RGB6':
			obj_ver = 6
		elif magic == b'RGB9':
			obj_ver = 10 + unpack_from('<I', file)[0]

		if obj_ver not in [6, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20]:
			print(f"Error: File '{objfile}' is of an unknown format.", file=sys.stderr)
			sys.exit(1)

		num_symbols = unpack_from('<I', file)[0]
		unpack_from('<I', file) # skip num sections

		if obj_ver in [16, 17, 18, 19, 20]:
			node_filenames = []
			num_nodes = unpack_from('<I', file)[0]
			for x in range(num_nodes):
				unpack_from('<II', file) # parent id, parent line no
				node_type = unpack_from('<B', file)[0]
				if node_type:
					node_filenames.append(read_string(file))
				else:
					node_filenames.append('rept')
					depth = unpack_from('<I', file)[0]
					for i in range(depth):
						unpack_from('<I', file) # rept iterations
			node_filenames.reverse()

		for _ in range(num_symbols):
			sym_name = read_string(file)
			sym_type = symtype(unpack_from('<B', file)[0] & 0x7f)
			if sym_type == symtype.IMPORT:
				continue
			if obj_ver in [16, 17, 18, 19, 20]:
				sym_fileno = unpack_from('<I', file)[0]
				sym_filename = node_filenames[sym_fileno]
			else:
				sym_filename = read_string(file)
			unpack_from('<III', file)
			if sym_name not in symbols:
				continue

			if sym_filename not in file_symbols:
				file_symbols[sym_filename] = []
			file_symbols[sym_filename].append(sym_name)

# Sort the files, the one with the most amount of symbols first
file_symbols = sorted(file_symbols.items(), key=lambda item: len(item[1]), reverse=True)
for filename, unnamed_syms in file_symbols:
	sym_list = ', '.join(unnamed_syms[:args.list])
	print(f'{filename}: {len(unnamed_syms)}{": " + sym_list if sym_list else ""}')
