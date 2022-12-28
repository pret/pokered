Route18_Object:
	db $43 ; border block

	def_warp_events
	warp_event 33,  8, ROUTE_18_GATE_1F, 1
	warp_event 33,  9, ROUTE_18_GATE_1F, 2
	warp_event 40,  8, ROUTE_18_GATE_1F, 3
	warp_event 40,  9, ROUTE_18_GATE_1F, 4

	def_bg_events
	bg_event 43,  7, 4 ; Route18Text4
	bg_event 33,  5, 5 ; Route18Text5

	def_object_events
	object_event 36, 11, SPRITE_COOLTRAINER_M, STAY, RIGHT, 1, OPP_BIRD_KEEPER, 8
	object_event 40, 15, SPRITE_COOLTRAINER_M, STAY, LEFT, 2, OPP_BIRD_KEEPER, 9
	object_event 42, 13, SPRITE_COOLTRAINER_M, STAY, LEFT, 3, OPP_BIRD_KEEPER, 10

	def_warps_to ROUTE_18
