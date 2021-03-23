Route11Gate2F_Object:
	db $a ; border block

	def_warps
	warp  7,  7, 4, ROUTE_11_GATE_1F

	def_signs
	sign  1,  2, 3 ; Route11GateUpstairsText3
	sign  6,  2, 4 ; Route11GateUpstairsText4

	def_objects
	object SPRITE_YOUNGSTER, 4, 2, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_SCIENTIST, 2, 6, STAY, NONE, 2 ; person

	def_warps_to ROUTE_11_GATE_2F
