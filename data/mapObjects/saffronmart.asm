SaffronMartObject: ; 0x5d41c (size=38)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $4, $ff
	db $7, $4, $4, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $1 ; person
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $4 + 4, $ff, $ff, $2 ; person
	db SPRITE_LASS, $5 + 4, $6 + 4, $fe, $0, $3 ; person

	; warp-to
	EVENT_DISP SAFFRON_MART_WIDTH, $7, $3
	EVENT_DISP SAFFRON_MART_WIDTH, $7, $4
