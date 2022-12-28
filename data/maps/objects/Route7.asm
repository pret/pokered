Route7_Object:
	db $f ; border block

	def_warp_events
	warp_event 18,  9, ROUTE_7_GATE, 3
	warp_event 18, 10, ROUTE_7_GATE, 4
	warp_event 11,  9, ROUTE_7_GATE, 1
	warp_event 11, 10, ROUTE_7_GATE, 2
	warp_event  5, 13, UNDERGROUND_PATH_ROUTE_7, 1

	def_bg_events
	bg_event  3, 13, 1 ; Route7Text1

	def_object_events

	def_warps_to ROUTE_7
