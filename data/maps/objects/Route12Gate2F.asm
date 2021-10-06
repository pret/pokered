Route12Gate2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  7, ROUTE_12_GATE_1F, 5

	def_bg_events
	bg_event  1,  2, 2 ; Route12GateUpstairsText2
	bg_event  6,  2, 3 ; Route12GateUpstairsText3

	def_object_events
	object_event  3,  4, SPRITE_BRUNETTE_GIRL, WALK, UP_DOWN, 1 ; person

	def_warps_to ROUTE_12_GATE_2F
