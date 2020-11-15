Route22Gate_Object:
	db $a ; border block

	def_warps
	warp  4,  7, 0, LAST_MAP
	warp  5,  7, 0, LAST_MAP
	warp  4,  0, 0, LAST_MAP
	warp  5,  0, 1, LAST_MAP

	def_signs

	def_objects
	object SPRITE_GUARD, 6, 2, STAY, LEFT, 1 ; person

	def_warps_to ROUTE_22_GATE
