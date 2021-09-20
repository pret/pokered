Route5Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  5, 2, LAST_MAP
	warp_event  4,  5, 2, LAST_MAP
	warp_event  3,  0, 1, LAST_MAP
	warp_event  4,  0, 0, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GUARD, 1, 3, STAY, RIGHT, 1 ; person

	def_warps_to ROUTE_5_GATE
