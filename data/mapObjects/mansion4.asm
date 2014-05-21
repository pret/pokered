Mansion4Object: ; 0x52498 (size=69)
	db $1 ; border block

	db $1 ; warps
	db $16, $17, $5, MANSION_1

	db $0 ; signs

	db $8 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $17 + 4, $10 + 4, $ff, $ff, TRAINER | $1, BURGLAR + $C8, $9
	db SPRITE_OAK_AIDE, $b + 4, $1b + 4, $ff, $d0, TRAINER | $2, SCIENTIST + $C8, $d
	db SPRITE_BALL, $2 + 4, $a + 4, $ff, $ff, ITEM | $3, RARE_CANDY
	db SPRITE_BALL, $16 + 4, $1 + 4, $ff, $ff, ITEM | $4, FULL_RESTORE
	db SPRITE_BALL, $19 + 4, $13 + 4, $ff, $ff, ITEM | $5, TM_14
	db SPRITE_BALL, $4 + 4, $5 + 4, $ff, $ff, ITEM | $6, TM_22
	db SPRITE_BOOK_MAP_DEX, $14 + 4, $10 + 4, $ff, $ff, $7 ; person
	db SPRITE_BALL, $d + 4, $5 + 4, $ff, $ff, ITEM | $8, SECRET_KEY

	; warp-to
	EVENT_DISP MANSION_4_WIDTH, $16, $17 ; MANSION_1
