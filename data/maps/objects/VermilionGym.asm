VermilionGym_Object:
	db $3 ; border block

	def_warps
	warp  4, 17, 3, LAST_MAP
	warp  5, 17, 3, LAST_MAP

	def_signs

	def_objects
	object SPRITE_ROCKER, 5, 1, STAY, DOWN, 1, OPP_LT_SURGE, 1
	object SPRITE_GENTLEMAN, 9, 6, STAY, LEFT, 2, OPP_GENTLEMAN, 3
	object SPRITE_SUPER_NERD, 3, 8, STAY, LEFT, 3, OPP_ROCKER, 1
	object SPRITE_SAILOR, 0, 10, STAY, RIGHT, 4, OPP_SAILOR, 8
	object SPRITE_GYM_GUIDE, 4, 14, STAY, DOWN, 5 ; person

	def_warps_to VERMILION_GYM
