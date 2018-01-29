Mansion3Object:
	db $1 ; border block

	db $3 ; warps
	warp $7, $a, $1, MANSION_2
	warp $6, $1, $3, MANSION_2
	warp $19, $e, $2, MANSION_2

	db $0 ; signs

	db $5 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $5, $b, WALK, $2, $1, OPP_BURGLAR, $8
	object SPRITE_OAK_AIDE, $14, $b, STAY, LEFT, $2, OPP_SCIENTIST, $c
	object SPRITE_BALL, $1, $10, STAY, NONE, $3, MAX_POTION
	object SPRITE_BALL, $19, $5, STAY, NONE, $4, IRON
	object SPRITE_BOOK_MAP_DEX, $6, $c, STAY, NONE, $5 ; person

	; warp-to
	warp_to $7, $a, MANSION_3_WIDTH ; MANSION_2
	warp_to $6, $1, MANSION_3_WIDTH ; MANSION_2
	warp_to $19, $e, MANSION_3_WIDTH ; MANSION_2
