Mansion2Object:
	db 1 ; border block

	db 4 ; warps
	warp 5, 10, 4, MANSION_1
	warp 7, 10, 0, MANSION_3
	warp 25, 14, 2, MANSION_3
	warp 6, 1, 1, MANSION_3

	db 0 ; signs

	db 4 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, 3, 17, WALK, 2, 1, OPP_BURGLAR, 7
	object SPRITE_BALL, 28, 7, STAY, NONE, 2, CALCIUM
	object SPRITE_BOOK_MAP_DEX, 18, 2, STAY, NONE, 3 ; person
	object SPRITE_BOOK_MAP_DEX, 3, 22, STAY, NONE, 4 ; person

	; warp-to
	warp_to 5, 10, MANSION_2_WIDTH ; MANSION_1
	warp_to 7, 10, MANSION_2_WIDTH ; MANSION_3
	warp_to 25, 14, MANSION_2_WIDTH ; MANSION_3
	warp_to 6, 1, MANSION_2_WIDTH ; MANSION_3
