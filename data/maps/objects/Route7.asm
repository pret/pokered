Route7_Object:
	db $f ; border block

	def_warp_events
	warp_event 18,  9, 2, ROUTE_7_GATE
	warp_event 18, 10, 3, ROUTE_7_GATE
	warp_event 11,  9, 0, ROUTE_7_GATE
	warp_event 11, 10, 1, ROUTE_7_GATE
	warp_event  5, 13, 0, UNDERGROUND_PATH_ROUTE_7

	def_bg_events
	bg_event  3, 13, 1 ; Route7Text1

	def_object_events

	def_warps_to ROUTE_7
