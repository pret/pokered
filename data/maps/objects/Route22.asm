Route22_Object:
	db $2c ; border block

	def_warp_events
	warp_event  8,  5, ROUTE_22_GATE, 1

	def_bg_events
	bg_event  7, 11, 5 ; Route22FrontGateText
	bg_event  25, 15, 6 ; Route22TrainerTipsText

	def_object_events
	object_event 25,  5, SPRITE_BLUE, STAY, NONE, 1 ; person
	object_event 25,  5, SPRITE_BLUE, STAY, NONE, 2 ; person
	object_event 30,  2, SPRITE_POKE_BALL, STAY, NONE, 3, ITEM_ROUTE_22_NORTH_ALCOVE_NEW 
	object_event 2,  15, SPRITE_POKE_BALL, STAY, NONE, 4, ITEM_ROUTE_22_SOUTHWEST_CORNER_NEW 

	def_warps_to ROUTE_22
