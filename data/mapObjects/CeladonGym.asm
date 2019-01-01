CeladonGym_Object:
	db $3 ; border block

	db 2 ; warps
	warp 4, 17, 6, -1
	warp 5, 17, 6, -1

	db 0 ; signs

	db 8 ; objects
	object SPRITE_ERIKA, 4, 3, STAY, DOWN, 1, OPP_ERIKA, 1
	object SPRITE_LASS, 2, 11, STAY, RIGHT, 2, OPP_LASS, 17
	object SPRITE_FOULARD_WOMAN, 7, 10, STAY, LEFT, 3, OPP_BEAUTY, 1
	object SPRITE_LASS, 9, 5, STAY, DOWN, 4, OPP_JR_TRAINER_F, 11
	object SPRITE_FOULARD_WOMAN, 1, 5, STAY, DOWN, 5, OPP_BEAUTY, 2
	object SPRITE_LASS, 6, 3, STAY, DOWN, 6, OPP_LASS, 18
	object SPRITE_FOULARD_WOMAN, 3, 3, STAY, DOWN, 7, OPP_BEAUTY, 3
	object SPRITE_LASS, 5, 3, STAY, DOWN, 8, OPP_COOLTRAINER_F, 1

	; warp-to
	warp_to 4, 17, CELADON_GYM_WIDTH
	warp_to 5, 17, CELADON_GYM_WIDTH
