SchoolObject: ; 0x1d55d (size=32)
	db $a ; border tile

	db $2 ; warps
	db $7, $2, $2, $ff
	db $7, $3, $2, $ff

	db $0 ; signs

	db $2 ; people
	db SPRITE_BRUNETTE_GIRL, $5 + 4, $3 + 4, $ff, $d1, $1 ; person
	db SPRITE_LASS, $1 + 4, $4 + 4, $ff, $d0, $2 ; person

	; warp-to
	EVENT_DISP $4, $7, $2
	EVENT_DISP $4, $7, $3

