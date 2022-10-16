FarawayIslandOutside_Object:
	db $02 ; border block

	def_warp_events
	warp_event 14,  6, 0, FARAWAY_ISLAND_INSIDE
	warp_event 15,  6, 0, FARAWAY_ISLAND_INSIDE

	def_bg_events
	bg_event  2, 22, 10 ; Sign

	def_object_events

	def_warps_to FARAWAY_ISLAND_OUTSIDE