Route12Gate1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  0, LAST_MAP, 1
	warp_event  5,  0, LAST_MAP, 2
	warp_event  4,  7, LAST_MAP, 3
	warp_event  5,  7, LAST_MAP, 3
	warp_event  8,  6, ROUTE_12_GATE_2F, 1

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_GUARD, STAY, NONE, 1 ; person

	def_warps_to ROUTE_12_GATE_1F
