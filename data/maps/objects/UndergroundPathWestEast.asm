UndergroundPathWestEast_Object:
	db $1 ; border block

	def_warp_events
	warp_event  2,  5, UNDERGROUND_PATH_ROUTE_7, 3
	warp_event 47,  2, UNDERGROUND_PATH_ROUTE_8, 3

	def_bg_events

	def_object_events

	def_warps_to UNDERGROUND_PATH_WEST_EAST
