SilphCo10F_Object:
	db $2e ; border block

	def_warps
	warp  8,  0, 0, SILPH_CO_9F
	warp 10,  0, 0, SILPH_CO_11F
	warp 12,  0, 0, SILPH_CO_ELEVATOR
	warp  9, 11, 3, SILPH_CO_4F
	warp 13, 15, 5, SILPH_CO_4F
	warp 13,  7, 6, SILPH_CO_4F

	def_signs

	def_objects
	object SPRITE_ROCKET, 1, 9, STAY, RIGHT, 1, OPP_ROCKET, 39
	object SPRITE_SCIENTIST, 10, 2, STAY, LEFT, 2, OPP_SCIENTIST, 11
	object SPRITE_ERIKA, 9, 15, WALK, ANY_DIR, 3 ; person
	object SPRITE_POKE_BALL, 2, 12, STAY, NONE, 4, TM_EARTHQUAKE
	object SPRITE_POKE_BALL, 4, 14, STAY, NONE, 5, RARE_CANDY
	object SPRITE_POKE_BALL, 5, 11, STAY, NONE, 6, CARBOS

	def_warps_to SILPH_CO_10F
