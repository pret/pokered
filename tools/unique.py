#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python unique.py [-f|--flip] [-x|--cross] image.png

Erase duplicate tiles from an input image.
-f or --flip counts X/Y mirrored tiles as duplicates.
-x or --cross erases with a cross instead of a blank tile.
"""

import sys

import png

def rgb5_pixels(row):
	yield from (tuple(c // 8 for c in row[x:x+3]) for x in range(0, len(row), 4))

def rgb8_pixels(row):
	yield from (c * 8 + c // 4 for pixel in row for c in pixel)

def gray_pixels(row):
	yield from (pixel[0] // 10 for pixel in row)

def rows_to_tiles(rows, width, height):
	assert len(rows) == height and len(rows[0]) == width
	yield from (tuple(tuple(row[x:x+8]) for row in rows[y:y+8])
		for y in range(0, height, 8) for x in range(0, width, 8))

def tiles_to_rows(tiles, width, height):
	assert width % 8 == 0 and height % 8 == 0
	width, height = width // 8, height // 8
	tiles = list(tiles)
	assert len(tiles) == width * height
	tile_rows = (tiles[y:y+width] for y in range(0, width * height, width))
	yield from ([tile[y][x] for tile in tile_row for x in range(8)]
		for tile_row in tile_rows for y in range(8))

def tile_variants(tile, flip):
	yield tile
	if flip:
		yield tile[::-1]
		yield tuple(row[::-1] for row in tile)
		yield tuple(row[::-1] for row in tile[::-1])

def unique_tiles(tiles, flip, cross):
	if cross:
		blank = [[(0, 0, 0)] * 8 for _ in range(8)]
		for y in range(8):
			blank[y][y] = blank[y][7 - y] = (31, 31, 31)
		blank = tuple(tuple(row) for row in blank)
	else:
		blank = tuple(tuple([(31, 31, 31)] * 8) for _ in range(8))
	seen = set()
	for tile in tiles:
		if any(variant in seen for variant in tile_variants(tile, flip)):
			yield blank
		else:
			yield tile
			seen.add(tile)

def is_grayscale(colors):
	return (colors.issubset({(31, 31, 31), (21, 21, 21), (10, 10, 10), (0, 0, 0)}) or
		colors.issubset({(31, 31, 31), (20, 20, 20), (10, 10, 10), (0, 0, 0)}))

def erase_duplicates(filename, flip, cross):
	with open(filename, 'rb') as file:
		width, height, rows = png.Reader(file).asRGBA8()[:3]
		rows = [list(rgb5_pixels(row)) for row in rows]
	if width % 8 or height % 8:
		return False
	tiles = unique_tiles(rows_to_tiles(rows, width, height), flip, cross)
	rows = list(tiles_to_rows(tiles, width, height))
	if is_grayscale({c for row in rows for c in row}):
		rows = [list(gray_pixels(row)) for row in rows]
		writer = png.Writer(width, height, greyscale=True, bitdepth=2, compression=9)
	else:
		rows = [list(rgb8_pixels(row)) for row in rows]
		writer = png.Writer(width, height, greyscale=False, bitdepth=8, compression=9)
	with open(filename, 'wb') as file:
		writer.write(file, rows)
	return True

def main():
	flip = cross = False
	while True:
		if len(sys.argv) < 2:
			print(f'Usage: {sys.argv[0]} [-f|--flip] [-x|--cross] tileset.png', file=sys.stderr)
			sys.exit(1)
		elif sys.argv[1] in {'-f', '--flip'}:
			flip = True
		elif sys.argv[1] in {'-x', '--cross'}:
			cross = True
		elif sys.argv[1] in {'-fx', '-xf'}:
			flip = cross = True
		else:
			break
		sys.argv.pop(1)
	for filename in sys.argv[1:]:
		if not filename.lower().endswith('.png'):
			print(f'{filename} is not a .png file!', file=sys.stderr)
		elif not erase_duplicates(filename, flip, cross):
			print(f'{filename} is not divisible into 8x8 tiles!', file=sys.stderr)

if __name__ == '__main__':
	main()
