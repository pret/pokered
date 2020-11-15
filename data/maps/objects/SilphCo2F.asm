SilphCo2F_Object:
	db $2e ; border block

	def_warps
	warp 24,  0, 2, SILPH_CO_1F
	warp 26,  0, 0, SILPH_CO_3F
	warp 20,  0, 0, SILPH_CO_ELEVATOR
	warp  3,  3, 6, SILPH_CO_3F
	warp 13,  3, 4, SILPH_CO_8F
	warp 27, 15, 5, SILPH_CO_8F
	warp  9, 15, 4, SILPH_CO_6F

	def_signs

	def_objects
	object SPRITE_ERIKA, 10, 1, STAY, UP, 1 ; person
	object SPRITE_SCIENTIST, 5, 12, STAY, DOWN, 2, OPP_SCIENTIST, 2
	object SPRITE_SCIENTIST, 24, 13, STAY, LEFT, 3, OPP_SCIENTIST, 3
	object SPRITE_ROCKET, 16, 11, STAY, UP, 4, OPP_ROCKET, 23
	object SPRITE_ROCKET, 24, 7, STAY, UP, 5, OPP_ROCKET, 24

	def_warps_to SILPH_CO_2F
