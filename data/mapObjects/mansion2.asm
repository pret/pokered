Mansion2Object: ; 0x520d1 (size=63)
	db $1 ; border block

	db $4 ; warps
	db $a, $5, $4, MANSION_1
	db $a, $7, $0, MANSION_3
	db $e, $19, $2, MANSION_3
	db $1, $6, $1, MANSION_3

	db $0 ; signs

	db $4 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $11 + 4, $3 + 4, $fe, $2, TRAINER | $1, BURGLAR + $C8, $7
	db SPRITE_BALL, $7 + 4, $1c + 4, $ff, $ff, ITEM | $2, CALCIUM
	db SPRITE_BOOK_MAP_DEX, $2 + 4, $12 + 4, $ff, $ff, $3 ; person
	db SPRITE_BOOK_MAP_DEX, $16 + 4, $3 + 4, $ff, $ff, $4 ; person

	; warp-to
	EVENT_DISP MANSION_2_WIDTH, $a, $5 ; MANSION_1
	EVENT_DISP MANSION_2_WIDTH, $a, $7 ; MANSION_3
	EVENT_DISP MANSION_2_WIDTH, $e, $19 ; MANSION_3
	EVENT_DISP MANSION_2_WIDTH, $1, $6 ; MANSION_3
