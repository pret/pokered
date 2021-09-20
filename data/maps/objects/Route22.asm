Route22_Object:
	db $2c ; border block

	def_warp_events
	warp_event  8,  5, 0, ROUTE_22_GATE

	def_bg_events
	bg_event  7, 11, 3 ; Route22FrontGateText

	def_object_events
	object_event SPRITE_BLUE, 25, 5, STAY, NONE, 1 ; person
	object_event SPRITE_BLUE, 25, 5, STAY, NONE, 2 ; person

	def_warps_to ROUTE_22
