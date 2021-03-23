Route12SuperRodHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 3, LAST_MAP
	warp  3,  7, 3, LAST_MAP

	def_signs

	def_objects
	object SPRITE_FISHING_GURU, 2, 4, STAY, RIGHT, 1 ; person

	def_warps_to ROUTE_12_SUPER_ROD_HOUSE
