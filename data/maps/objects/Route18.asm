Route18_Object:
	db $43 ; border block

	def_warps
	warp 33,  8, 0, ROUTE_18_GATE_1F
	warp 33,  9, 1, ROUTE_18_GATE_1F
	warp 40,  8, 2, ROUTE_18_GATE_1F
	warp 40,  9, 3, ROUTE_18_GATE_1F

	def_signs
	sign 43,  7, 4 ; Route18Text4
	sign 33,  5, 5 ; Route18Text5

	def_objects
	object SPRITE_COOLTRAINER_M, 36, 11, STAY, RIGHT, 1, OPP_BIRD_KEEPER, 8
	object SPRITE_COOLTRAINER_M, 40, 15, STAY, LEFT, 2, OPP_BIRD_KEEPER, 9
	object SPRITE_COOLTRAINER_M, 42, 13, STAY, LEFT, 3, OPP_BIRD_KEEPER, 10

	def_warps_to ROUTE_18
