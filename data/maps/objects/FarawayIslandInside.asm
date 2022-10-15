FarawayIslandInside_Object:
	db $02 ; border block

	def_warp_events
	warp_event 14, 21, 0, FARAWAY_ISLAND_OUTSIDE
	warp_event 15, 21, 0, FARAWAY_ISLAND_OUTSIDE

	def_bg_events

	def_object_events

	def_warps_to FARAWAY_ISLAND_INSIDE