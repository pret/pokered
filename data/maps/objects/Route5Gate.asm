Route5Gate_Object:
	db $a ; border block

	def_warps
	warp  3,  5, 2, LAST_MAP
	warp  4,  5, 2, LAST_MAP
	warp  3,  0, 1, LAST_MAP
	warp  4,  0, 0, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GUARD, 1, 3, STAY, RIGHT, 1 ; person

	def_warps_to ROUTE_5_GATE
