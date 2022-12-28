Route6Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  3,  5, LAST_MAP, 3
	warp_event  4,  5, LAST_MAP, 3
	warp_event  3,  0, LAST_MAP, 2
	warp_event  4,  0, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_GUARD, STAY, LEFT, 1 ; person

	def_warps_to ROUTE_6_GATE
