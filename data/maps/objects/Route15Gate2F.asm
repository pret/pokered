Route15Gate2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  7, ROUTE_15_GATE_1F, 5

	def_bg_events
	bg_event  6,  2, 2 ; Route15GateUpstairsText2

	def_object_events
	object_event  4,  2, SPRITE_SCIENTIST, STAY, DOWN, 1

	def_warps_to ROUTE_15_GATE_2F
