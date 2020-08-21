SilphCo4F_Object:
	db $2e ; border block

	def_warps
	warp 24,  0, 1, SILPH_CO_3F
	warp 26,  0, 1, SILPH_CO_5F
	warp 20,  0, 0, SILPH_CO_ELEVATOR
	warp 11,  7, 3, SILPH_CO_10F
	warp 17,  3, 3, SILPH_CO_6F
	warp  3, 15, 4, SILPH_CO_10F
	warp 17, 11, 5, SILPH_CO_10F

	def_signs

	def_objects
	object SPRITE_SILPH_WORKER, 6, 2, STAY, NONE, 1 ; person
	object SPRITE_ROCKET, 9, 14, STAY, RIGHT, 2, OPP_ROCKET, 26
	object SPRITE_SCIENTIST, 14, 6, STAY, LEFT, 3, OPP_SCIENTIST, 5
	object SPRITE_ROCKET, 26, 10, STAY, UP, 4, OPP_ROCKET, 27
	object SPRITE_POKE_BALL, 3, 9, STAY, NONE, 5, FULL_HEAL
	object SPRITE_POKE_BALL, 4, 7, STAY, NONE, 6, MAX_REVIVE
	object SPRITE_POKE_BALL, 5, 8, STAY, NONE, 7, ESCAPE_ROPE

	def_warps_to SILPH_CO_4F
