Route5_Object:
	db $a ; border block

	def_warp_events
	warp_event 10, 29, ROUTE_5_GATE, 4
	warp_event  9, 29, ROUTE_5_GATE, 3
	warp_event 10, 33, ROUTE_5_GATE, 1
	warp_event 17, 27, UNDERGROUND_PATH_ROUTE_5, 1
	warp_event 10, 21, DAYCARE, 1

	def_bg_events
	bg_event 17, 29, 6 ; Route5Text1

	def_object_events
	object_event 1,  13, SPRITE_COOLTRAINER_M, STAY, RIGHT, 1, OPP_ROOKIE, 3
	object_event 4,  15, SPRITE_COOLTRAINER_M, STAY, LEFT, 2, OPP_ROOKIE, 4
	object_event 18, 23, SPRITE_COOLTRAINER_M, STAY, UP, 3, OPP_ROOKIE, 5
	object_event 15, 10, SPRITE_SUPER_NERD, STAY, DOWN, 4, OPP_TAMER, 6
	object_event 2, 30, SPRITE_POKE_BALL, STAY, NONE, 5, TM_RAZOR_WIND

	def_warps_to ROUTE_5
