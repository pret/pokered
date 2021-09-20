Route2Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, 3, LAST_MAP
	warp_event  5,  0, 3, LAST_MAP
	warp_event  4,  7, 4, LAST_MAP
	warp_event  5,  7, 4, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_SCIENTIST, 1, 4, STAY, LEFT, 1 ; person
	object_event SPRITE_YOUNGSTER, 5, 4, WALK, LEFT_RIGHT, 2 ; person

	def_warps_to ROUTE_2_GATE
