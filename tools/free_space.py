#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage: python3 free_space.py [BANK=none] [pokered.map]

Calculate the free space in the ROM or its individual banks.

The BANK argument allows printing free space in one, all, or none of the ROM's banks.
Valid arguments are numbers (in decimal "42" or hexadecimal "0x2A"), "all" or "none".
If not specified, defaults to "none".
"""

import sys

from mapreader import MapReader

def main():
	print_bank = 'none'
	filename = 'pokered.map'

	for arg in sys.argv[1:]:
		if arg.startswith('BANK='):
			print_bank = arg.split('=', 1)[-1]
		else:
			filename = arg

	if print_bank not in {'all', 'none'}:
		try:
			print_bank = (int(print_bank[2:], 16)
				if print_bank.startswith('0x') or print_bank.startswith('0X')
				else int(print_bank))
		except ValueError:
			error = f'Error: invalid BANK: {print_bank}'
			if print_bank.isalnum():
				error += f' (did you mean: 0x{print_bank}?)'
			print(error, file=sys.stderr)
			sys.exit(1)

	num_banks = 0x80
	bank_size = 0x4000 # bytes
	total_size = num_banks * bank_size

	reader = MapReader()
	with open(filename, 'r', encoding='utf-8') as file:
		reader.read_map_data(file.readlines())

	free_space = 0
	per_bank = []
	default_bank_data = {'sections': [], 'used': 0, 'slack': bank_size}
	for bank in range(num_banks):
		bank_data = reader.bank_data['ROM0 bank' if bank == 0 else 'ROMX bank']
		data = bank_data.get(bank, default_bank_data)
		used, slack = data['used'], data['slack']
		per_bank.append((used, slack))
		free_space += slack

	free_percent = 100 * free_space / total_size
	print(f'Free space: {free_space}/{total_size} ({free_percent:.2f}%)')
	if print_bank != 'none':
		print()
		print('bank, used, free')
		for bank in range(num_banks):
			used, slack = per_bank[bank]
			if print_bank in {'all', bank}:
				print(f'${bank:02X}, {used}, {slack}')

if __name__ == '__main__':
	main()
