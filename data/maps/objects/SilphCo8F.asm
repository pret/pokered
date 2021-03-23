SilphCo8F_Object:
	db $2e ; border block

	def_warps
	warp 16,  0, 1, SILPH_CO_9F
	warp 14,  0, 0, SILPH_CO_7F
	warp 18,  0, 0, SILPH_CO_ELEVATOR
	warp  3, 11, 6, SILPH_CO_8F
	warp  3, 15, 4, SILPH_CO_2F
	warp 11,  5, 5, SILPH_CO_2F
	warp 11,  9, 3, SILPH_CO_8F

	def_signs

	def_objects
	object SPRITE_SILPH_WORKER, 4, 2, STAY, NONE, 1 ; person
	object SPRITE_ROCKET, 19, 2, STAY, LEFT, 2, OPP_ROCKET, 35
	object SPRITE_SCIENTIST, 10, 2, STAY, DOWN, 3, OPP_SCIENTIST, 9
	object SPRITE_ROCKET, 12, 15, STAY, RIGHT, 4, OPP_ROCKET, 36

	def_warps_to SILPH_CO_8F
