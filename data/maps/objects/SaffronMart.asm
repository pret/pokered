SaffronMart_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 4, -1
	warp 4, 7, 4, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_MART_GUY, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 4, 2, STAY, NONE, 2 ; person
	object SPRITE_LASS, 6, 5, WALK, 0, 3 ; person

	; warp-to
	warp_to 3, 7, SAFFRON_MART_WIDTH
	warp_to 4, 7, SAFFRON_MART_WIDTH
