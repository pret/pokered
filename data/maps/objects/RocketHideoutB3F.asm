RocketHideoutB3F_Object:
	db $2e ; border block

	def_warps
	warp 25,  6, 1, ROCKET_HIDEOUT_B2F
	warp 19, 18, 0, ROCKET_HIDEOUT_B4F

	def_signs

	def_objects
	object SPRITE_ROCKET, 10, 22, STAY, RIGHT, 1, OPP_ROCKET, 14
	object SPRITE_ROCKET, 26, 12, STAY, UP, 2, OPP_ROCKET, 15
	object SPRITE_POKE_BALL, 26, 17, STAY, NONE, 3, TM_DOUBLE_EDGE
	object SPRITE_POKE_BALL, 20, 14, STAY, NONE, 4, RARE_CANDY

	def_warps_to ROCKET_HIDEOUT_B3F
