CeruleanCaveB1F_Object:
	db $7d ; border block

	def_warps
	warp  3,  6, 8, CERULEAN_CAVE_1F

	def_signs

	def_objects
	object SPRITE_MONSTER, 27, 13, STAY, DOWN, 1, MEWTWO, 70
	object SPRITE_POKE_BALL, 16, 9, STAY, NONE, 2, ULTRA_BALL
	object SPRITE_POKE_BALL, 18, 1, STAY, NONE, 3, MAX_REVIVE

	def_warps_to CERULEAN_CAVE_B1F
