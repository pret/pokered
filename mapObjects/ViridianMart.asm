ViridianMartObject: ; 0x1d50a (size=38)
	db $0 ; border tile

	db $2 ; warps
	db $7, $3, $1, $ff
	db $7, $4, $1, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $1 ; person
	db SPRITE_BUG_CATCHER, $5 + 4, $5 + 4, $fe, $1, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $3 + 4, $3 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP $4, $7, $3
	EVENT_DISP $4, $7, $4
