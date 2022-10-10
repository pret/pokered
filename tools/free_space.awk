#!/usr/bin/gawk -f

# Usage:  tools/free_space.awk [BANK=<bank_spec>] pokered.map

# The BANK argument allows printing free space in one, all, or none of the ROM's banks.
# Valid arguments are numbers (in decimal "42" or hexadecimal "0x2a"), "all" or "none".
# If not specified, defaults to "none".
# The `BANK` argument MUST be before the map file name, otherwise it has no effect!
# Yes:  tools/free_space.awk BANK=all pokered.map
# No:   tools/free_space.awk pokered.map BANK=42

# Copyright (c) 2020, Eldred Habert.
# SPDX-License-Identifier: MIT

BEGIN {
	nb_banks = 0
	free = 0
	rom_bank = 0 # Safety net for malformed files

	# Default settings
	# Variables assigned via the command-line (except through `-v`) are *after* `BEGIN`
	BANK="none"
}

# Only accept ROM banks, ignore everything else
toupper($0) ~ /^[ \t]*ROM[0X][ \t]+BANK[ \t]+#/ {
	nb_banks++
	rom_bank = 1
	split($0, fields, /[ \t]/)
	bank_num = strtonum(substr(fields[3], 2))
}

function register_bank(amount) {
	free += amount
	rom_bank = 0 # Reject upcoming banks by default

	if (BANK ~ /all/ || BANK == bank_num) {
		printf "Bank %3d: %5d/16384 (%.2f%%)\n", bank_num, amount, amount * 100 / 16384
	}
}

rom_bank && toupper($0) ~ /^[ \t]*EMPTY$/ {
	# Empty bank
	register_bank(16384)
}
rom_bank && toupper($0) ~ /^[ \t]*SLACK:[ \t]/ {
	if ($2 ~ /\$[0-9A-F]+/) {
		register_bank(strtonum("0x" substr($2, 2)))
	} else {
		printf "Malformed slack line? \"%s\" does not start with '$'\n", $2
	}
}

END {
	# Determine number of banks, by rounding to upper power of 2
	total_banks = 2 # Smallest size is 2 banks
	while (total_banks < nb_banks) {
		total_banks *= 2
	}

	# RGBLINK omits "trailing" ROM banks, so fake them
	bank_num = nb_banks
	while (bank_num < total_banks) {
		register_bank(16384)
		bank_num++
	}

	total = total_banks * 16384
	printf "Free space: %5d/%5d (%.2f%%)\n", free, total, free * 100 / total
}
