Mansion3Object: ; 0x522e6 (size=64)
	db $1 ; border block

	db $3 ; warps
	db $a, $7, $1, MANSION_2
	db $1, $6, $3, MANSION_2
	db $e, $19, $2, MANSION_2

	db $0 ; signs

	db $5 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $b + 4, $5 + 4, $fe, $2, TRAINER | $1, BURGLAR + $C8, $8
	db SPRITE_OAK_AIDE, $b + 4, $14 + 4, $ff, $d2, TRAINER | $2, SCIENTIST + $C8, $c
	db SPRITE_BALL, $10 + 4, $1 + 4, $ff, $ff, ITEM | $3, MAX_POTION
	db SPRITE_BALL, $5 + 4, $19 + 4, $ff, $ff, ITEM | $4, IRON
	db SPRITE_BOOK_MAP_DEX, $c + 4, $6 + 4, $ff, $ff, $5 ; person

	; warp-to
	EVENT_DISP MANSION_3_WIDTH, $a, $7 ; MANSION_2
	EVENT_DISP MANSION_3_WIDTH, $1, $6 ; MANSION_2
	EVENT_DISP MANSION_3_WIDTH, $e, $19 ; MANSION_2
