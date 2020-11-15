SaffronPidgeyHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 3, LAST_MAP
	warp  3,  7, 3, LAST_MAP

	def_signs

	def_objects
	object SPRITE_BRUNETTE_GIRL, 2, 3, STAY, RIGHT, 1 ; person
	object SPRITE_BIRD, 0, 4, WALK, UP_DOWN, 2 ; person
	object SPRITE_YOUNGSTER, 4, 1, STAY, DOWN, 3 ; person
	object SPRITE_PAPER, 3, 3, STAY, NONE, 4 ; person

	def_warps_to SAFFRON_PIDGEY_HOUSE
