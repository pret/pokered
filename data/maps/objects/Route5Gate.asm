Route5Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  5, LAST_MAP, 3
	warp_event  4,  5, LAST_MAP, 3
	warp_event  3,  0, LAST_MAP, 2
	warp_event  4,  0, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_GUARD, STAY, RIGHT, 1 ; person

	def_warps_to ROUTE_5_GATE
