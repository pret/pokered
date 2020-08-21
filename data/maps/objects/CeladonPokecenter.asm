CeladonPokecenter_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 5, LAST_MAP
	warp  4,  7, 5, LAST_MAP

	def_signs

	def_objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_GENTLEMAN, 7, 3, WALK, LEFT_RIGHT, 2 ; person
	object SPRITE_BEAUTY, 10, 5, WALK, ANY_DIR, 3 ; person
	object SPRITE_LINK_RECEPTIONIST, 11, 2, STAY, DOWN, 4 ; person

	def_warps_to CELADON_POKECENTER
