Route23_Object:
	db $f ; border block

	def_warps
	warp  7, 139, 2, ROUTE_22_GATE
	warp  8, 139, 3, ROUTE_22_GATE
	warp  4, 31, 0, VICTORY_ROAD_1F
	warp 14, 31, 1, VICTORY_ROAD_2F

	def_signs
	sign  3, 33, 8 ; Route23Text8

	def_objects
	object SPRITE_GUARD, 4, 35, STAY, DOWN, 1 ; person
	object SPRITE_GUARD, 10, 56, STAY, DOWN, 2 ; person
	object SPRITE_SWIMMER, 8, 85, STAY, DOWN, 3 ; person
	object SPRITE_SWIMMER, 11, 96, STAY, DOWN, 4 ; person
	object SPRITE_GUARD, 12, 105, STAY, DOWN, 5 ; person
	object SPRITE_GUARD, 8, 119, STAY, DOWN, 6 ; person
	object SPRITE_GUARD, 8, 136, STAY, DOWN, 7 ; person

	def_warps_to ROUTE_23
