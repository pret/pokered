DiglettsCaveRoute2_Object:
	db $7d ; border block

	def_warp_events
	warp_event  2,  7, 0, LAST_MAP
	warp_event  3,  7, 0, LAST_MAP
	warp_event  4,  4, 0, DIGLETTS_CAVE

	def_bg_events

	def_object_events
	object_event SPRITE_FISHING_GURU, 3, 3, STAY, NONE, 1 ; person

	def_warps_to DIGLETTS_CAVE_ROUTE_2
