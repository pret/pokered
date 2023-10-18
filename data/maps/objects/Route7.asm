	object_const_def
	const ROUTE7_GAMBLER1
	const ROUTE7_GAMBLER2

Route7_Object:
	db $f ; border block

	def_warp_events
	warp_event 18, 10, ROUTE_7_GATE, 4
	warp_event 11, 10, ROUTE_7_GATE, 2
	warp_event  5, 13, UNDERGROUND_PATH_ROUTE_7, 1

	def_bg_events
	bg_event  3, 13, TEXT_ROUTE7_UNDERGROUND_PATH_SIGN

	def_object_events
	object_event 13,  13, SPRITE_GRAMPS, STAY, UP, TEXT_ROUTE7_GAMBLER1, OPP_GAMBLER, 8
	object_event 13,  14, SPRITE_GRAMPS, STAY, DOWN, TEXT_ROUTE7_GAMBLER2, OPP_GAMBLER, 6

	def_warps_to ROUTE_7
