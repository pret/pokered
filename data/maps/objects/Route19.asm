	object_const_def
	const ROUTE19_COOLTRAINER_M1
	const ROUTE19_COOLTRAINER_M2
	const ROUTE19_SWIMMER1
	const ROUTE19_SWIMMER2
	const ROUTE19_SWIMMER3
	const ROUTE19_SWIMMER4
	const ROUTE19_SWIMMER5
	const ROUTE19_SWIMMER6
	const ROUTE19_SWIMMER7
	const ROUTE19_SWIMMER8

Route19_Object:
	db $43 ; border block

	def_warp_events

	def_bg_events
	bg_event 11,  9, TEXT_ROUTE19_SIGN

	def_object_events
	object_event  8,  7, SPRITE_COOLTRAINER_M, STAY, LEFT, TEXT_ROUTE19_COOLTRAINER_M1, OPP_SWIMMER, 2
	object_event 13,  7, SPRITE_COOLTRAINER_M,STAY, LEFT, TEXT_ROUTE19_COOLTRAINER_M2, OPP_SWIMMER, 3
	object_event 13, 25, SPRITE_SWIMMER, STAY, LEFT, TEXT_ROUTE19_SWIMMER1, OPP_SWIMMER, 4
	object_event  4, 27, SPRITE_SWIMMER, STAY, RIGHT, TEXT_ROUTE19_SWIMMER2, OPP_SWIMMER, 5
	object_event 16, 31, SPRITE_SWIMMER, STAY, UP, TEXT_ROUTE19_SWIMMER3, OPP_SWIMMER, 6
	object_event  9, 11, SPRITE_SWIMMER, STAY, DOWN, TEXT_ROUTE19_SWIMMER4, OPP_SWIMMER, 7
	object_event  8, 43, SPRITE_SWIMMER, STAY, LEFT, TEXT_ROUTE19_SWIMMER5, OPP_BEAUTY, 12
	object_event 11, 43, SPRITE_SWIMMER, STAY, RIGHT, TEXT_ROUTE19_SWIMMER6, OPP_BEAUTY, 13
	object_event  9, 42, SPRITE_SWIMMER, STAY, UP, TEXT_ROUTE19_SWIMMER7, OPP_SWIMMER, 8
	object_event 10, 44, SPRITE_SWIMMER, STAY, DOWN, TEXT_ROUTE19_SWIMMER8, OPP_BEAUTY, 14

	def_warps_to ROUTE_19
