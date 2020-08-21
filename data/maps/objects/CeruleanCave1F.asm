CeruleanCave1F_Object:
	db $7d ; border block

	def_warps
	warp 24, 17, 6, LAST_MAP
	warp 25, 17, 6, LAST_MAP
	warp 27,  1, 0, CERULEAN_CAVE_2F
	warp 23,  7, 1, CERULEAN_CAVE_2F
	warp 18,  9, 2, CERULEAN_CAVE_2F
	warp  7,  1, 3, CERULEAN_CAVE_2F
	warp  1,  3, 4, CERULEAN_CAVE_2F
	warp  3, 11, 5, CERULEAN_CAVE_2F
	warp  0,  6, 0, CERULEAN_CAVE_B1F

	def_signs

	def_objects
	object SPRITE_POKE_BALL, 7, 13, STAY, NONE, 1, FULL_RESTORE
	object SPRITE_POKE_BALL, 19, 3, STAY, NONE, 2, MAX_ELIXER
	object SPRITE_POKE_BALL, 5, 0, STAY, NONE, 3, NUGGET

	def_warps_to CERULEAN_CAVE_1F
