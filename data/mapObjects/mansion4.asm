Mansion4Object: ; 0x52498 (size=69)
	db $1 ; border block

	db $1 ; warps
	db $16, $17, $5, MANSION_1

	db $0 ; signs

	db $8 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $10, $17, FACE, STAY, $1, BURGLAR + $C8, $9
	object SPRITE_OAK_AIDE, $1b, $b, FACE, DOWN, $2, SCIENTIST + $C8, $d
	object SPRITE_BALL, $a, $2, FACE, STAY, $3, RARE_CANDY
	object SPRITE_BALL, $1, $16, FACE, STAY, $4, FULL_RESTORE
	object SPRITE_BALL, $13, $19, FACE, STAY, $5, TM_14
	object SPRITE_BALL, $5, $4, FACE, STAY, $6, TM_22
	object SPRITE_BOOK_MAP_DEX, $10, $14, FACE, STAY, $7 ; person
	object SPRITE_BALL, $5, $d, FACE, STAY, $8, SECRET_KEY

	; warp-to
	EVENT_DISP MANSION_4_WIDTH, $16, $17 ; MANSION_1
