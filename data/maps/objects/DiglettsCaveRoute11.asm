DiglettsCaveRoute11_Object:
	db $7d ; border block

	def_warp_events
	warp_event  2,  7, 4, LAST_MAP
	warp_event  3,  7, 4, LAST_MAP
	warp_event  4,  4, 1, DIGLETTS_CAVE

	def_bg_events

	def_objects
	object SPRITE_GAMBLER, 2, 3, STAY, NONE, 1 ; person

	def_warps_to DIGLETTS_CAVE_ROUTE_11
