
SECTION "ff00+c or not to ff00+c", ROMX

	ld a, [$ff00 + c]
	ld [65280 + c], a

	; Not ok
	ld a, [$ff01 + c]
	ld [xyz + c], a
