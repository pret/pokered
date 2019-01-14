OaksLab_Object:
	db $3 ; border block

	db 2 ; warps
	warp 4, 11, 2, -1
	warp 5, 11, 2, -1

	db 0 ; signs

	db 11 ; objects
	object SPRITE_BLUE, 4, 3, STAY, NONE, 1, OPP_SONY1, 1
	object SPRITE_BALL, 6, 3, STAY, NONE, 2 ; person
	object SPRITE_BALL, 7, 3, STAY, NONE, 3 ; person
	object SPRITE_BALL, 8, 3, STAY, NONE, 4 ; person
	object SPRITE_OAK, 5, 2, STAY, DOWN, 5 ; person
	object SPRITE_BOOK_MAP_DEX, 2, 1, STAY, NONE, 6 ; person
	object SPRITE_BOOK_MAP_DEX, 3, 1, STAY, NONE, 7 ; person
	object SPRITE_OAK, 5, 10, STAY, UP, 8 ; person
	object SPRITE_GIRL, 1, 9, WALK, 1, 9 ; person
	object SPRITE_OAK_AIDE, 2, 10, STAY, NONE, 10 ; person
	object SPRITE_OAK_AIDE, 8, 10, STAY, NONE, 11 ; person

	; warp-to
	warp_to 4, 11, OAKS_LAB_WIDTH
	warp_to 5, 11, OAKS_LAB_WIDTH
