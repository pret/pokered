CeruleanGym_Object:
	db $3 ; border block

	db 2 ; warps
	warp 4, 13, 3, -1
	warp 5, 13, 3, -1

	db 0 ; signs

	db 4 ; objects
	object SPRITE_BRUNETTE_GIRL, 4, 2, STAY, DOWN, 1, OPP_MISTY, 1
	object SPRITE_LASS, 2, 3, STAY, RIGHT, 2, OPP_JR_TRAINER_F, 1
	object SPRITE_SWIMMER, 8, 7, STAY, LEFT, 3, OPP_SWIMMER, 1
	object SPRITE_GYM_HELPER, 7, 10, STAY, DOWN, 4 ; person

	; warp-to
	warp_to 4, 13, CERULEAN_GYM_WIDTH
	warp_to 5, 13, CERULEAN_GYM_WIDTH
