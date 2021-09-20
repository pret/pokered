Route18Gate2F_Object:
	db $a ; border block

	def_warps
	warp  7,  7, 4, ROUTE_18_GATE_1F

	def_bg_events
	bg_event  1,  2, 2 ; Route18GateUpstairsText2
	bg_event  6,  2, 3 ; Route18GateUpstairsText3

	def_objects
	object SPRITE_YOUNGSTER, 4, 2, WALK, LEFT_RIGHT, 1 ; person

	def_warps_to ROUTE_18_GATE_2F
