Route18Gate1F_Object:
	db $a ; border block

	def_warps
	warp  0,  4, 0, LAST_MAP
	warp  0,  5, 1, LAST_MAP
	warp  7,  4, 2, LAST_MAP
	warp  7,  5, 3, LAST_MAP
	warp  6,  8, 0, ROUTE_18_GATE_2F

	def_signs

	def_objects
	object SPRITE_GUARD, 4, 1, STAY, DOWN, 1 ; person

	def_warps_to ROUTE_18_GATE_1F
