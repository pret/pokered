SilphCo7F_Object:
	db $2e ; border block

	def_warps
	warp 16,  0, 1, SILPH_CO_8F
	warp 22,  0, 0, SILPH_CO_6F
	warp 18,  0, 0, SILPH_CO_ELEVATOR
	warp  5,  7, 3, SILPH_CO_11F
	warp  5,  3, 8, SILPH_CO_3F
	warp 21, 15, 3, SILPH_CO_5F

	def_signs

	def_objects
	object SPRITE_SILPH_WORKER, 1, 5, STAY, NONE, 1 ; person
	object SPRITE_SILPH_WORKER, 13, 13, STAY, UP, 2 ; person
	object SPRITE_SILPH_WORKER, 7, 10, STAY, NONE, 3 ; person
	object SPRITE_ERIKA, 10, 8, STAY, NONE, 4 ; person
	object SPRITE_ROCKET, 13, 1, STAY, DOWN, 5, OPP_ROCKET, 32
	object SPRITE_SCIENTIST, 2, 13, STAY, DOWN, 6, OPP_SCIENTIST, 8
	object SPRITE_ROCKET, 20, 2, STAY, LEFT, 7, OPP_ROCKET, 33
	object SPRITE_ROCKET, 19, 14, STAY, RIGHT, 8, OPP_ROCKET, 34
	object SPRITE_BLUE, 3, 7, STAY, UP, 9 ; person
	object SPRITE_POKE_BALL, 1, 9, STAY, NONE, 10, CALCIUM
	object SPRITE_POKE_BALL, 24, 11, STAY, NONE, 11, TM_SWORDS_DANCE

	def_warps_to SILPH_CO_7F
