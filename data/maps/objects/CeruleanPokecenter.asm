CeruleanPokecenter_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 2, LAST_MAP
	warp  4,  7, 2, LAST_MAP

	def_signs

	def_objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_SUPER_NERD, 10, 5, WALK, ANY_DIR, 2 ; person
	object SPRITE_GENTLEMAN, 4, 3, STAY, DOWN, 3 ; person
	object SPRITE_LINK_RECEPTIONIST, 11, 2, STAY, DOWN, 4 ; person

	def_warps_to CERULEAN_POKECENTER
