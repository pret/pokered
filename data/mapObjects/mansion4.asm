Mansion4Object:
	db $1 ; border block

	db $1 ; warps
	warp $17, $16, $5, MANSION_1

	db $0 ; signs

	db $8 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $10, $17, STAY, NONE, $1, OPP_BURGLAR, $9
	object SPRITE_OAK_AIDE, $1b, $b, STAY, DOWN, $2, OPP_SCIENTIST, $d
	object SPRITE_BALL, $a, $2, STAY, NONE, $3, RARE_CANDY
	object SPRITE_BALL, $1, $16, STAY, NONE, $4, FULL_RESTORE
	object SPRITE_BALL, $13, $19, STAY, NONE, $5, TM_14
	object SPRITE_BALL, $5, $4, STAY, NONE, $6, TM_22
	object SPRITE_BOOK_MAP_DEX, $10, $14, STAY, NONE, $7 ; person
	object SPRITE_BALL, $5, $d, STAY, NONE, $8, SECRET_KEY

	; warp-to
	warp_to $17, $16, MANSION_4_WIDTH ; MANSION_1
