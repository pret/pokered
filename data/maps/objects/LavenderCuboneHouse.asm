LavenderCuboneHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 4, LAST_MAP
	warp  3,  7, 4, LAST_MAP

	def_signs

	def_objects
	object SPRITE_MONSTER, 3, 5, STAY, UP, 1 ; person
	object SPRITE_BRUNETTE_GIRL, 2, 4, STAY, RIGHT, 2 ; person

	def_warps_to LAVENDER_CUBONE_HOUSE
