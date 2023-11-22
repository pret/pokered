	object_const_def
	const_export ROUTE18_COOLTRAINER_M1
	const_export ROUTE18_COOLTRAINER_M2
	const_export ROUTE18_COOLTRAINER_M3

Route18_Object:
	db $43 ; border block

	def_warp_events
	warp_event 33,  8, ROUTE_18_GATE_1F, 1
	warp_event 33,  9, ROUTE_18_GATE_1F, 2
	warp_event 40,  8, ROUTE_18_GATE_1F, 3
	warp_event 40,  9, ROUTE_18_GATE_1F, 4

	def_bg_events
	bg_event 43,  7, TEXT_ROUTE18_SIGN
	bg_event 33,  5, TEXT_ROUTE18_CYCLING_ROAD_SIGN

	def_object_events
	object_event 36, 11, SPRITE_COOLTRAINER_M, STAY, RIGHT, TEXT_ROUTE18_COOLTRAINER_M1, OPP_BIRD_KEEPER, 8
	object_event 40, 15, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_ROUTE18_COOLTRAINER_M2, OPP_BIRD_KEEPER, 9
	object_event 42, 13, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_ROUTE18_COOLTRAINER_M3, OPP_BIRD_KEEPER, 10

	def_warps_to ROUTE_18
