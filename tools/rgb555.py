#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python rgb555.py image.png

Round all colors of the input image to RGB555.
"""

import sys

import png

def rgb8_to_rgb5(c):
	return (c & 0b11111000) | (c >> 5)

def round_pal(filename):
	with open(filename, 'rb') as file:
		width, height, rows = png.Reader(file).asRGBA8()[:3]
		rows = list(rows)
	for row in rows:
		del row[3::4]
	rows = [[rgb8_to_rgb5(c) for c in row] for row in rows]
	writer = png.Writer(width, height, greyscale=False, bitdepth=8, compression=9)
	with open(filename, 'wb') as file:
		writer.write(file, rows)

def main():
	if len(sys.argv) < 2:
		print(f'Usage: {sys.argv[0]} pic.png', file=sys.stderr)
		sys.exit(1)
	for filename in sys.argv[1:]:
		if not filename.lower().endswith('.png'):
			print(f'{filename} is not a .png file!', file=sys.stderr)
		round_pal(filename)

if __name__ == '__main__':
	main()
