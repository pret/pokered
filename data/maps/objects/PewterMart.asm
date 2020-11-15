PewterMart_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 4, LAST_MAP
	warp  4,  7, 4, LAST_MAP

	def_signs

	def_objects
	object SPRITE_CLERK, 0, 5, STAY, RIGHT, 1 ; person
	object SPRITE_YOUNGSTER, 3, 3, WALK, UP_DOWN, 2 ; person
	object SPRITE_SUPER_NERD, 5, 5, STAY, NONE, 3 ; person

	def_warps_to PEWTER_MART
