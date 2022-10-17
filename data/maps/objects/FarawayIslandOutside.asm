FarawayIslandOutside_Object:
	db $02 ; border block

	def_warp_events
	warp_event 2, 29, VERMILION_CITY, 11
	warp_event 3, 29, VERMILION_CITY, 10
	warp_event 14,  6, FARAWAY_ISLAND_INSIDE, 1
	warp_event 15,  6, FARAWAY_ISLAND_INSIDE, 2

	def_bg_events
	bg_event  2, 22, 1 ; Sign

	def_object_events

	def_warps_to FARAWAY_ISLAND_OUTSIDE