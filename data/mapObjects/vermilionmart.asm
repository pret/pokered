VermilionMartObject: ; 0x5c9f4 (size=38)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $2, $ff
	db $7, $4, $2, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $1 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $6 + 4, $5 + 4, $ff, $ff, $2 ; person
	db SPRITE_LASS, $3 + 4, $3 + 4, $fe, $2, $3 ; person

	; warp-to
	EVENT_DISP VERMILION_MART_WIDTH, $7, $3
	EVENT_DISP VERMILION_MART_WIDTH, $7, $4
