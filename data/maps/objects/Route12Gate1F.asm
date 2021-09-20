Route12Gate1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, 0, LAST_MAP
	warp_event  5,  0, 1, LAST_MAP
	warp_event  4,  7, 2, LAST_MAP
	warp_event  5,  7, 2, LAST_MAP
	warp_event  8,  6, 0, ROUTE_12_GATE_2F

	def_bg_events

	def_object_events
	object_event SPRITE_GUARD, 1, 3, STAY, NONE, 1 ; person

	def_warps_to ROUTE_12_GATE_1F
