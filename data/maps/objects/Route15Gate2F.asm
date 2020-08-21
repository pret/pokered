Route15Gate2F_Object:
	db $a ; border block

	def_warps
	warp  7,  7, 4, ROUTE_15_GATE_1F

	def_signs
	sign  6,  2, 2 ; Route15GateUpstairsText2

	def_objects
	object SPRITE_SCIENTIST, 4, 2, STAY, DOWN, 1

	def_warps_to ROUTE_15_GATE_2F
