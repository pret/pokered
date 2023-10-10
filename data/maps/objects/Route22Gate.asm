	object_const_def
	const_export ROUTE22GATE_GUARD

Route22Gate_Object:
	db $a ; border block

	def_warp_events
	warp_event  4,  7, LAST_MAP, 1
	warp_event  5,  7, LAST_MAP, 1
	warp_event  4,  0, LAST_MAP, 1
	warp_event  5,  0, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_GUARD, STAY, LEFT, TEXT_ROUTE22GATE_GUARD

	def_warps_to ROUTE_22_GATE
