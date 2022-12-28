Route18Gate2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  7, ROUTE_18_GATE_1F, 5

	def_bg_events
	bg_event  1,  2, 2 ; Route18GateUpstairsText2
	bg_event  6,  2, 3 ; Route18GateUpstairsText3

	def_object_events
	object_event  4,  2, SPRITE_YOUNGSTER, WALK, LEFT_RIGHT, 1 ; person

	def_warps_to ROUTE_18_GATE_2F
