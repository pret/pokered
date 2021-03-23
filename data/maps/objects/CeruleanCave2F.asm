CeruleanCave2F_Object:
	db $7d ; border block

	def_warps
	warp 29,  1, 2, CERULEAN_CAVE_1F
	warp 22,  6, 3, CERULEAN_CAVE_1F
	warp 19,  7, 4, CERULEAN_CAVE_1F
	warp  9,  1, 5, CERULEAN_CAVE_1F
	warp  1,  3, 6, CERULEAN_CAVE_1F
	warp  3, 11, 7, CERULEAN_CAVE_1F

	def_signs

	def_objects
	object SPRITE_POKE_BALL, 29, 9, STAY, NONE, 1, PP_UP
	object SPRITE_POKE_BALL, 4, 15, STAY, NONE, 2, ULTRA_BALL
	object SPRITE_POKE_BALL, 13, 6, STAY, NONE, 3, FULL_RESTORE

	def_warps_to CERULEAN_CAVE_2F
