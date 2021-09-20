Route5_Object:
	db $a ; border block

	def_warp_events
	warp_event 10, 29, 3, ROUTE_5_GATE
	warp_event  9, 29, 2, ROUTE_5_GATE
	warp_event 10, 33, 0, ROUTE_5_GATE
	warp_event 17, 27, 0, UNDERGROUND_PATH_ROUTE_5
	warp_event 10, 21, 0, DAYCARE

	def_bg_events
	bg_event 17, 29, 1 ; Route5Text1

	def_object_events

	def_warps_to ROUTE_5
