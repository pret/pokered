#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python used_space.py [pokered.map] [used_space.png]

Generate a PNG visualizing the space used by each bank in the ROM.
"""

import sys
from colorsys import hls_to_rgb

import png
from mapreader import MapReader

def main():
	mapfile = sys.argv[1] if len(sys.argv) >= 2 else 'pokered.map'
	outfile = sys.argv[2] if len(sys.argv) >= 3 else 'used_space.png'

	num_banks = 0x80
	bank_mask = 0x3FFF
	bank_size = 0x4000 # bytes

	bpp = 8 # bytes per pixel
	height = 256 # pixels
	assert bank_size % bpp == 0 and (bank_size // bpp) % height == 0

	pixels_per_bank = bank_size // bpp # 2048 pixels
	bank_width = pixels_per_bank // height # 8 pixels
	width = bank_width * num_banks # 1024 pixels

	reader = MapReader()
	with open(mapfile, 'r', encoding='utf-8') as file:
		reader.read_map_data(file.readlines())

	hit_data = []
	default_bank_data = {'sections': [], 'used': 0, 'slack': bank_size}
	for bank in range(num_banks):
		hits = [0] * pixels_per_bank
		bank_data = reader.bank_data['ROM0 bank' if bank == 0 else 'ROMX bank']
		data = bank_data.get(bank, default_bank_data)
		for s in data['sections']:
			beg = s['beg'] & bank_mask
			end = s['end'] & bank_mask
			for i in range(beg, end + 1):
				hits[i // bpp] += 1
		hit_data.append(hits)

	pixels = [[(0xFF, 0xFF, 0xFF)] * width for _ in range(height)]
	for bank, hits in enumerate(hit_data):
		hue = 0 if bank == 0 else 210 if bank % 2 else 270
		for i, hit in enumerate(hits):
			x, y = i % bank_width + bank * bank_width, i // bank_width
			hls = (hue / 360, 1 - (85 * hit / bpp) / 100, 1)
			rgb = tuple(int(c * 0xFF) for c in hls_to_rgb(*hls))
			pixels[y][x] = rgb

	png_data = [tuple(c for pixel in row for c in pixel) for row in pixels]
	with open(outfile, 'wb') as file:
		writer = png.Writer(width, height, greyscale=False, bitdepth=8, compression=9)
		writer.write(file, png_data)

if __name__ == '__main__':
	main()
