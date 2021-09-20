Route8Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  0,  3, 0, LAST_MAP
	warp_event  0,  4, 1, LAST_MAP
	warp_event  5,  3, 2, LAST_MAP
	warp_event  5,  4, 3, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GUARD, 2, 1, STAY, DOWN, 1 ; person

	def_warps_to ROUTE_8_GATE
