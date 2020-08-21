VermilionPidgeyHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 4, LAST_MAP
	warp  3,  7, 4, LAST_MAP

	def_signs

	def_objects
	object SPRITE_YOUNGSTER, 5, 3, STAY, LEFT, 1 ; person
	object SPRITE_BIRD, 3, 5, WALK, LEFT_RIGHT, 2 ; person
	object SPRITE_PAPER, 4, 3, STAY, NONE, 3 ; person

	def_warps_to VERMILION_PIDGEY_HOUSE
