CopycatsHouse1F_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 0, LAST_MAP
	warp  3,  7, 0, LAST_MAP
	warp  7,  1, 0, COPYCATS_HOUSE_2F

	def_signs

	def_objects
	object SPRITE_MIDDLE_AGED_WOMAN, 2, 2, STAY, DOWN, 1 ; person
	object SPRITE_MIDDLE_AGED_MAN, 5, 4, STAY, LEFT, 2 ; person
	object SPRITE_FAIRY, 1, 4, WALK, UP_DOWN, 3 ; person

	def_warps_to COPYCATS_HOUSE_1F
