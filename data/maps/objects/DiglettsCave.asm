DiglettsCave_Object:
	db $19 ; border block

	def_warp_events
	warp_event  5,  5, DIGLETTS_CAVE_ROUTE_2, 3
	warp_event 37, 31, DIGLETTS_CAVE_ROUTE_11, 3
	warp_event 23, 19, SILPH_CO_1F, 9
	warp_event 39,  4, UNDERGROUND_PATH_NORTH_SOUTH, 3

	def_bg_events

	def_object_events

	def_warps_to DIGLETTS_CAVE
