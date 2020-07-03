RedsHouse1F_Object:
	db $a ; border block

	db 3 ; warps
	warp 2, 7, 0, -1 ; exit1
	warp 3, 7, 0, -1 ; exit2
	warp 7, 1, 0, REDS_HOUSE_2F ; staircase

	db 1 ; signs
	sign 3, 1, 2 ; TV

	db 1 ; objects
	object SPRITE_MOM, 5, 4, STAY, LEFT, 1 ; Mom

	; warp-to
	warp_to 2, 7, REDS_HOUSE_1F_WIDTH
	warp_to 3, 7, REDS_HOUSE_1F_WIDTH
	warp_to 7, 1, REDS_HOUSE_1F_WIDTH
