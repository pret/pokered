MtMoonB2F_Object:
	db $3 ; border block

	def_warps
	warp 25,  9, 1, MT_MOON_B1F
	warp 21, 17, 4, MT_MOON_B1F
	warp 15, 27, 5, MT_MOON_B1F
	warp  5,  7, 6, MT_MOON_B1F

	def_signs

	def_objects
	object SPRITE_SUPER_NERD, 12, 8, STAY, RIGHT, 1, OPP_SUPER_NERD, 2
	object SPRITE_ROCKET, 11, 16, STAY, DOWN, 2, OPP_ROCKET, 1
	object SPRITE_ROCKET, 15, 22, STAY, DOWN, 3, OPP_ROCKET, 2
	object SPRITE_ROCKET, 29, 11, STAY, UP, 4, OPP_ROCKET, 3
	object SPRITE_ROCKET, 29, 17, STAY, LEFT, 5, OPP_ROCKET, 4
	object SPRITE_FOSSIL, 12, 6, STAY, NONE, 6 ; person
	object SPRITE_FOSSIL, 13, 6, STAY, NONE, 7 ; person
	object SPRITE_POKE_BALL, 25, 21, STAY, NONE, 8, HP_UP
	object SPRITE_POKE_BALL, 29, 5, STAY, NONE, 9, TM_MEGA_PUNCH

	def_warps_to MT_MOON_B2F
