CinnabarMartObject: ; 0x75e91 (size=38)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $4, $ff
	db $7, $4, $4, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $1 ; person
	db SPRITE_ERIKA, $2 + 4, $6 + 4, $ff, $ff, $2 ; person
	db SPRITE_OAK_AIDE, $4 + 4, $3 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP CINNABAR_MART_WIDTH, $7, $3
	EVENT_DISP CINNABAR_MART_WIDTH, $7, $4
