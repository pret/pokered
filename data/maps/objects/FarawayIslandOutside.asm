FarawayIslandOutside_Object:
	db $2d ; border block

	def_warp_events
	warp_event  2, 35, VERMILION_CITY, 10
	warp_event  3, 35, VERMILION_CITY, 9
	warp_event 18,  8, FARAWAY_ISLAND_INSIDE, 1
	warp_event 19,  8, FARAWAY_ISLAND_INSIDE, 2

	def_bg_events
	bg_event  3, 27, 1 ; Sign

	def_object_events

	def_warps_to FARAWAY_ISLAND_OUTSIDE