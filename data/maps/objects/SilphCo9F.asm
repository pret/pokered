SilphCo9F_Object:
	db $2e ; border block

	def_warps
	warp 14,  0, 0, SILPH_CO_10F
	warp 16,  0, 0, SILPH_CO_8F
	warp 18,  0, 0, SILPH_CO_ELEVATOR
	warp  9,  3, 7, SILPH_CO_3F
	warp 17, 15, 4, SILPH_CO_5F

	def_signs

	def_objects
	object SPRITE_NURSE, 3, 14, STAY, DOWN, 1 ; person
	object SPRITE_ROCKET, 2, 4, STAY, UP, 2, OPP_ROCKET, 37
	object SPRITE_SCIENTIST, 21, 13, STAY, DOWN, 3, OPP_SCIENTIST, 10
	object SPRITE_ROCKET, 13, 16, STAY, UP, 4, OPP_ROCKET, 38

	def_warps_to SILPH_CO_9F
