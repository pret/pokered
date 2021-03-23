CeladonDiner_Object:
	db $f ; border block

	def_warps
	warp  3,  7, 10, LAST_MAP
	warp  4,  7, 10, LAST_MAP

	def_signs

	def_objects
	object SPRITE_COOK, 8, 5, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_MIDDLE_AGED_WOMAN, 7, 2, STAY, NONE, 2 ; person
	object SPRITE_MIDDLE_AGED_MAN, 1, 4, STAY, DOWN, 3 ; person
	object SPRITE_FISHER, 5, 3, STAY, RIGHT, 4 ; person
	object SPRITE_GYM_GUIDE, 0, 1, STAY, DOWN, 5 ; person

	def_warps_to CELADON_DINER
