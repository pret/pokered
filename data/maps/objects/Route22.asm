Route22_Object:
	db $2c ; border block

	def_warp_events
	warp_event  8,  5, ROUTE_22_GATE, 1

	def_bg_events
	bg_event  7, 11, 3 ; Route22FrontGateText

	def_object_events
	object_event 25,  5, SPRITE_BLUE, STAY, NONE, 1 ; person
	object_event 25,  5, SPRITE_BLUE, STAY, NONE, 2 ; person

	def_warps_to ROUTE_22
