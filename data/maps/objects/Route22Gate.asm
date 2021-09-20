Route22Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  7, 0, LAST_MAP
	warp_event  5,  7, 0, LAST_MAP
	warp_event  4,  0, 0, LAST_MAP
	warp_event  5,  0, 1, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GUARD, 6, 2, STAY, LEFT, 1 ; person

	def_warps_to ROUTE_22_GATE
