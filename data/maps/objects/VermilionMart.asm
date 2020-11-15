VermilionMart_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 2, LAST_MAP
	warp  4,  7, 2, LAST_MAP

	def_signs

	def_objects
	object SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_COOLTRAINER_M, 5, 6, STAY, NONE, 2 ; person
	object SPRITE_COOLTRAINER_F, 3, 3, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to VERMILION_MART
