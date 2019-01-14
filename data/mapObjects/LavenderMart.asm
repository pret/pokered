LavenderMart_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 3, -1
	warp 4, 7, 3, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_MART_GUY, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_BALDING_GUY, 3, 4, STAY, NONE, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, 7, 2, STAY, NONE, 3 ; person

	; warp-to
	warp_to 3, 7, LAVENDER_MART_WIDTH
	warp_to 4, 7, LAVENDER_MART_WIDTH
