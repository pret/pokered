LavenderMartObject: ; 0x5c95d (size=38)
	db $0 ; border tile

	db $2 ; warps
	db $7, $3, $3, $ff
	db $7, $4, $3, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $1 ; person
	db SPRITE_BALDING_GUY, $4 + 4, $3 + 4, $ff, $ff, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $2 + 4, $7 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP $4, $7, $3
	EVENT_DISP $4, $7, $4
