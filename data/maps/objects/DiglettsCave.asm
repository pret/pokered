DiglettsCave_Object:
	db $19 ; border block

	def_warp_events
	warp_event  5,  5, DIGLETTS_CAVE_ROUTE_2, 3
	warp_event 37, 31, DIGLETTS_CAVE_ROUTE_11, 3

	def_bg_events
	bg_event 13, 25, 2 ; DiglettsCaveText1

	def_object_events
	object_event 29, 12, SPRITE_MONSTER, STAY, DOWN, 1, CROCKY, 28 | OW_POKEMON

	def_warps_to DIGLETTS_CAVE
