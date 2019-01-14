VermilionGym_Object:
	db $3 ; border block

	db 2 ; warps
	warp 4, 17, 3, -1
	warp 5, 17, 3, -1

	db 0 ; signs

	db 5 ; objects
	object SPRITE_ROCKER, 5, 1, STAY, DOWN, 1, OPP_LT_SURGE, 1
	object SPRITE_GENTLEMAN, 9, 6, STAY, LEFT, 2, OPP_GENTLEMAN, 3
	object SPRITE_BLACK_HAIR_BOY_2, 3, 8, STAY, LEFT, 3, OPP_ROCKER, 1
	object SPRITE_SAILOR, 0, 10, STAY, RIGHT, 4, OPP_SAILOR, 8
	object SPRITE_GYM_HELPER, 4, 14, STAY, DOWN, 5 ; person

	; warp-to
	warp_to 4, 17, VERMILION_GYM_WIDTH
	warp_to 5, 17, VERMILION_GYM_WIDTH
