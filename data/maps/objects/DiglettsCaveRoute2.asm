DiglettsCaveRoute2_Object:
	db $7d ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1
	warp_event  4,  4, DIGLETTS_CAVE, 1

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_FISHING_GURU, STAY, NONE, 1 ; person

	def_warps_to DIGLETTS_CAVE_ROUTE_2
