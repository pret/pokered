#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python toc.py file.md

Replace a "## TOC" heading in a Markdown file with a table of contents,
generated from the other headings in the file. Supports multiple files.
Headings must start with "##" signs to be detected.
"""

import sys
import re
from collections import namedtuple
from urllib.parse import quote

toc_name = 'Contents'
valid_toc_headings = {'## TOC', '##TOC'}

TocItem = namedtuple('TocItem', ['name', 'anchor', 'level'])
punctuation_rx = re.compile(r'[^\w\- ]+')
numbered_heading_rx = re.compile(r'^[0-9]+\. ')
specialchar_rx = re.compile(r'[⅔]+')

def name_to_anchor(name):
	# GitHub's algorithm for generating anchors from headings
	# https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/toc_filter.rb
	anchor = name.strip().lower()               # lowercase
	anchor = re.sub(punctuation_rx, '', anchor) # remove punctuation
	anchor = anchor.replace(' ', '-')           # replace spaces with dash
	anchor = re.sub(specialchar_rx, '', anchor) # remove misc special chars
	anchor = quote(anchor)                      # url encode
	return anchor

def get_toc_index(lines):
	toc_index = None
	for i, line in enumerate(lines):
		if line.rstrip() in valid_toc_headings:
			toc_index = i
			break
	return toc_index

def get_toc_items(lines, toc_index):
	for i, line in enumerate(lines):
		if i <= toc_index:
			continue
		if line.startswith('##'):
			name = line.lstrip('#')
			level = len(line) - len(name) - len('##')
			name = name.strip()
			anchor = name_to_anchor(name)
			yield TocItem(name, anchor, level)

def toc_string(toc_items):
	lines = [f'## {toc_name}', '']
	for name, anchor, level in toc_items:
		padding = '  ' * level
		if re.match(numbered_heading_rx, name):
			bullet, name = name.split('.', 1)
			bullet += '.'
			name = name.lstrip()
		else:
			bullet = '-'
		lines.append(f'{padding}{bullet} [{name}](#{anchor})')
	return '\n'.join(lines) + '\n'

def add_toc(filename):
	with open(filename, 'r', encoding='utf-8') as file:
		lines = file.readlines()
	toc_index = get_toc_index(lines)
	if toc_index is None:
		return None # no TOC heading
	toc_items = list(get_toc_items(lines, toc_index))
	if not toc_items:
		return False # no content headings
	with open(filename, 'w', encoding='utf-8') as file:
		for i, line in enumerate(lines):
			if i == toc_index:
				file.write(toc_string(toc_items))
			else:
				file.write(line)
	return True # OK

def main():
	if len(sys.argv) < 2:
		print(f'Usage: {sys.argv[0]} file.md', file=sys.stderr)
		sys.exit(1)
	for filename in sys.argv[1:]:
		print(filename)
		result = add_toc(filename)
		if result is None:
			print('Warning: No "## TOC" heading found', file=sys.stderr)
		elif result is False:
			print('Warning: No content headings found', file=sys.stderr)
		else:
			print('OK')

if __name__ == '__main__':
	main()
