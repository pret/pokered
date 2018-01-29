Mansion2Object:
	db $1 ; border block

	db $4 ; warps
	warp $5, $a, $4, MANSION_1
	warp $7, $a, $0, MANSION_3
	warp $19, $e, $2, MANSION_3
	warp $6, $1, $1, MANSION_3

	db $0 ; signs

	db $4 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $3, $11, WALK, $2, $1, OPP_BURGLAR, $7
	object SPRITE_BALL, $1c, $7, STAY, NONE, $2, CALCIUM
	object SPRITE_BOOK_MAP_DEX, $12, $2, STAY, NONE, $3 ; person
	object SPRITE_BOOK_MAP_DEX, $3, $16, STAY, NONE, $4 ; person

	; warp-to
	warp_to $5, $a, MANSION_2_WIDTH ; MANSION_1
	warp_to $7, $a, MANSION_2_WIDTH ; MANSION_3
	warp_to $19, $e, MANSION_2_WIDTH ; MANSION_3
	warp_to $6, $1, MANSION_2_WIDTH ; MANSION_3
