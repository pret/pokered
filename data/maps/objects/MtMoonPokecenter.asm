MtMoonPokecenter_Object:
	db $0 ; border block

	def_warps
	warp  3,  7, 0, LAST_MAP
	warp  4,  7, 0, LAST_MAP

	def_signs

	def_objects
	object SPRITE_NURSE, 3, 1, STAY, DOWN, 1 ; person
	object SPRITE_YOUNGSTER, 4, 3, STAY, UP, 2 ; person
	object SPRITE_GENTLEMAN, 7, 3, STAY, UP, 3 ; person
	object SPRITE_MIDDLE_AGED_MAN, 10, 6, WALK, LEFT_RIGHT, 4 ; person
	object SPRITE_CLIPBOARD, 7, 2, STAY, NONE, 5 ; person
	object SPRITE_LINK_RECEPTIONIST, 11, 2, STAY, DOWN, 6 ; person

	def_warps_to MT_MOON_POKECENTER
