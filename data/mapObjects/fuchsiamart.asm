FuchsiaMartObject: ; 0x1dd9b (size=38)
	db $0 ; border block

	db $2 ; warps
	db $7, $3, $0, $ff
	db $7, $4, $0, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_MART_GUY, $5 + 4, $0 + 4, $ff, $d3, $1 ; person
	db SPRITE_FAT_BALD_GUY, $2 + 4, $4 + 4, $ff, $ff, $2 ; person
	db SPRITE_LASS, $5 + 4, $6 + 4, $fe, $1, $3 ; person

	; warp-to
	EVENT_DISP FUCHSIA_MART_WIDTH, $7, $3
	EVENT_DISP FUCHSIA_MART_WIDTH, $7, $4
