OaksLabObject: ; 0x1d40a (size=88)
	db $3 ; border block

	db $2 ; warps
	db $b, $4, $2, $ff
	db $b, $5, $2, $ff

	db $0 ; signs

	db $b ; people
	db SPRITE_BLUE, $3 + 4, $4 + 4, $ff, $ff, TRAINER | $1, SONY1 + $C8, $1
	db SPRITE_BALL, $3 + 4, $6 + 4, $ff, $ff, $2 ; person
	db SPRITE_BALL, $3 + 4, $7 + 4, $ff, $ff, $3 ; person
	db SPRITE_BALL, $3 + 4, $8 + 4, $ff, $ff, $4 ; person
	db SPRITE_OAK, $2 + 4, $5 + 4, $ff, $d0, $5 ; person
	db SPRITE_BOOK_MAP_DEX, $1 + 4, $2 + 4, $ff, $ff, $6 ; person
	db SPRITE_BOOK_MAP_DEX, $1 + 4, $3 + 4, $ff, $ff, $7 ; person
	db SPRITE_OAK, $a + 4, $5 + 4, $ff, $d1, $8 ; person
	db SPRITE_GIRL, $9 + 4, $1 + 4, $fe, $1, $9 ; person
	db SPRITE_OAK_AIDE, $a + 4, $2 + 4, $ff, $ff, $a ; person
	db SPRITE_OAK_AIDE, $a + 4, $8 + 4, $ff, $ff, $b ; person

	; warp-to
	EVENT_DISP OAKS_LAB_WIDTH, $b, $4
	EVENT_DISP OAKS_LAB_WIDTH, $b, $5
