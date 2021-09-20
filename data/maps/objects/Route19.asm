Route19_Object:
	db $43 ; border block

	def_warp_events

	def_bg_events
	bg_event 11,  9, 11 ; Route19Text11

	def_object_events
	object_event SPRITE_COOLTRAINER_M, 8, 7, STAY, LEFT, 1, OPP_SWIMMER, 2
	object_event SPRITE_COOLTRAINER_M, 13, 7, STAY, LEFT, 2, OPP_SWIMMER, 3
	object_event SPRITE_SWIMMER, 13, 25, STAY, LEFT, 3, OPP_SWIMMER, 4
	object_event SPRITE_SWIMMER, 4, 27, STAY, RIGHT, 4, OPP_SWIMMER, 5
	object_event SPRITE_SWIMMER, 16, 31, STAY, UP, 5, OPP_SWIMMER, 6
	object_event SPRITE_SWIMMER, 9, 11, STAY, DOWN, 6, OPP_SWIMMER, 7
	object_event SPRITE_SWIMMER, 8, 43, STAY, LEFT, 7, OPP_BEAUTY, 12
	object_event SPRITE_SWIMMER, 11, 43, STAY, RIGHT, 8, OPP_BEAUTY, 13
	object_event SPRITE_SWIMMER, 9, 42, STAY, UP, 9, OPP_SWIMMER, 8
	object_event SPRITE_SWIMMER, 10, 44, STAY, DOWN, 10, OPP_BEAUTY, 14

	def_warps_to ROUTE_19
