Mansion2Object:
	db $1 ; border block

	db $4 ; warps
	db $a, $5, $4, MANSION_1
	db $a, $7, $0, MANSION_3
	db $e, $19, $2, MANSION_3
	db $1, $6, $1, MANSION_3

	db $0 ; signs

	db $4 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $3, $11, WALK, $2, $1, OPP_BURGLAR, $7
	object SPRITE_BALL, $1c, $7, STAY, NONE, $2, CALCIUM
	object SPRITE_BOOK_MAP_DEX, $12, $2, STAY, NONE, $3 ; person
	object SPRITE_BOOK_MAP_DEX, $3, $16, STAY, NONE, $4 ; person

	; warp-to
	EVENT_DISP MANSION_2_WIDTH, $a, $5 ; MANSION_1
	EVENT_DISP MANSION_2_WIDTH, $a, $7 ; MANSION_3
	EVENT_DISP MANSION_2_WIDTH, $e, $19 ; MANSION_3
	EVENT_DISP MANSION_2_WIDTH, $1, $6 ; MANSION_3
