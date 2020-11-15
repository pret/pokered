SaffronMart_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 4, LAST_MAP
	warp  4,  7, 4, LAST_MAP

	def_signs

	def_objects
	object SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_SUPER_NERD, 4, 2, STAY, NONE, 2 ; person
	object SPRITE_COOLTRAINER_F, 6, 5, WALK, ANY_DIR, 3 ; person

	def_warps_to SAFFRON_MART
