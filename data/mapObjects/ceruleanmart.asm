CeruleanMartObject: ; 0x5c8a8 (size=38)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $5, $ff
	db $7, $4, $5, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $1 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $4 + 4, $3 + 4, $fe, $1, $2 ; person
	db SPRITE_LASS, $2 + 4, $6 + 4, $fe, $2, $3 ; person

	; warp-to
	EVENT_DISP CERULEAN_MART_WIDTH, $7, $3
	EVENT_DISP CERULEAN_MART_WIDTH, $7, $4
