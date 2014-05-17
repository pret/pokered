ViridianHouseObject: ; 0x1d5bb (size=44)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $3, $ff
	db $7, $3, $3, $ff

	db $0 ; signs

	db $4 ; people
	db SPRITE_BALDING_GUY, $3 + 4, $5 + 4, $ff, $ff, $1 ; person
	db SPRITE_LITTLE_GIRL, $4 + 4, $1 + 4, $fe, $1, $2 ; person
	db SPRITE_BIRD, $5 + 4, $5 + 4, $fe, $2, $3 ; person
	db SPRITE_CLIPBOARD, $0 + 4, $4 + 4, $ff, $ff, $4 ; person

	; warp-to
	EVENT_DISP VIRIDIAN_HOUSE_WIDTH, $7, $2
	EVENT_DISP VIRIDIAN_HOUSE_WIDTH, $7, $3
