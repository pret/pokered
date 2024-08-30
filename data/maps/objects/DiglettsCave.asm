	object_const_def
	const_export DIGLETTS_CAVE_DIGLETT1
	const_export DIGLETTS_CAVE_DIGLETT2
	const_export DIGLETTS_CAVE_DIGLETT3
	const_export DIGLETTS_CAVE_DIGLETT4

DiglettsCave_Object:
	db $19 ; border block

	def_warp_events
	warp_event  5,  5, DIGLETTS_CAVE_ROUTE_2, 3
	warp_event 37, 31, DIGLETTS_CAVE_ROUTE_11, 3
	warp_event 23, 19, SILPH_CO_1F, 9
	warp_event 39,  4, UNDERGROUND_PATH_NORTH_SOUTH, 3

	def_bg_events

	def_object_events
	object_event 25, 26, SPRITE_NOTHING, STAY, DOWN, TEXT_DIGLETTS_CAVE_DIGLETTS
	object_event 13, 28, SPRITE_NOTHING, STAY, DOWN, TEXT_DIGLETTS_CAVE_DIGLETTS
	object_event 11, 18, SPRITE_NOTHING, STAY, DOWN, TEXT_DIGLETTS_CAVE_DIGLETTS
	object_event  4,  8, SPRITE_NOTHING, STAY, DOWN, TEXT_DIGLETTS_CAVE_DIGLETTS

	def_warps_to DIGLETTS_CAVE
