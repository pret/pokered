ViridianMart_Object:
	db $0 ; border block

	db 2 ; warps
	warp 3, 7, 1, -1
	warp 4, 7, 1, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_MART_GUY, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_BUG_CATCHER, 5, 5, WALK, 1, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_1, 3, 3, STAY, NONE, 3 ; person

	; warp-to
	warp_to 3, 7, VIRIDIAN_MART_WIDTH
	warp_to 4, 7, VIRIDIAN_MART_WIDTH
