GameCorner_Object:
	db $f ; border block

	def_warps
	warp 15, 17, 7, LAST_MAP
	warp 16, 17, 7, LAST_MAP
	warp 17,  4, 1, ROCKET_HIDEOUT_B1F

	def_signs
	sign  9,  4, 12 ; CeladonGameCornerText12

	def_objects
	object SPRITE_BEAUTY, 2, 6, STAY, DOWN, 1 ; person
	object SPRITE_CLERK, 5, 6, STAY, DOWN, 2 ; person
	object SPRITE_MIDDLE_AGED_MAN, 2, 10, STAY, LEFT, 3 ; person
	object SPRITE_BEAUTY, 2, 13, STAY, LEFT, 4 ; person
	object SPRITE_FISHING_GURU, 5, 11, STAY, RIGHT, 5 ; person
	object SPRITE_MIDDLE_AGED_WOMAN, 8, 11, STAY, LEFT, 6 ; person
	object SPRITE_GYM_GUIDE, 8, 14, STAY, LEFT, 7 ; person
	object SPRITE_GAMBLER, 11, 15, STAY, RIGHT, 8 ; person
	object SPRITE_CLERK, 14, 11, STAY, LEFT, 9 ; person
	object SPRITE_GENTLEMAN, 17, 13, STAY, RIGHT, 10 ; person
	object SPRITE_ROCKET, 9, 5, STAY, UP, 11, OPP_ROCKET, 7

	def_warps_to GAME_CORNER
