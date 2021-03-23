Route4_Object:
	db $2c ; border block

	def_warps
	warp 11,  5, 0, MT_MOON_POKECENTER
	warp 18,  5, 0, MT_MOON_1F
	warp 24,  5, 7, MT_MOON_B1F

	def_signs
	sign 12,  5, 4 ; PokeCenterSignText
	sign 17,  7, 5 ; Route4Text5
	sign 27,  7, 6 ; Route4Text6

	def_objects
	object SPRITE_COOLTRAINER_F, 9, 8, WALK, ANY_DIR, 1 ; person
	object SPRITE_COOLTRAINER_F, 63, 3, STAY, RIGHT, 2, OPP_LASS, 4
	object SPRITE_POKE_BALL, 57, 3, STAY, NONE, 3, TM_WHIRLWIND

	def_warps_to ROUTE_4
