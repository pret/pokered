SaffronPokecenter_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 6, LAST_MAP
	warp  4,  7, 6, LAST_MAP

	def_signs

	def_objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_BEAUTY, 5, 5, STAY, NONE, 2 ; person
	object SPRITE_GENTLEMAN, 8, 3, STAY, DOWN, 3 ; person
	object SPRITE_LINK_RECEPTIONIST, 11, 2, STAY, DOWN, 4 ; person

	def_warps_to SAFFRON_POKECENTER
