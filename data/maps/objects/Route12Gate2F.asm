Route12Gate2F_Object:
	db $a ; border block

	def_warps
	warp  7,  7, 4, ROUTE_12_GATE_1F

	def_signs
	sign  1,  2, 2 ; Route12GateUpstairsText2
	sign  6,  2, 3 ; Route12GateUpstairsText3

	def_objects
	object SPRITE_BRUNETTE_GIRL, 3, 4, WALK, UP_DOWN, 1 ; person

	def_warps_to ROUTE_12_GATE_2F
