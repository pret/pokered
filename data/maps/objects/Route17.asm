Route17_Object:
	db $43 ; border block

	def_warp_events

	def_bg_events
	bg_event  9, 51, 11 ; Route17Text11
	bg_event  9, 63, 12 ; Route17Text12
	bg_event  9, 75, 13 ; Route17Text13
	bg_event  9, 87, 14 ; Route17Text14
	bg_event  9, 111, 15 ; Route17Text15
	bg_event  9, 141, 16 ; Route17Text16

	def_object_events
	object_event 12, 19, SPRITE_BIKER, STAY, LEFT, 1, OPP_CUE_BALL, 4
	object_event 11, 16, SPRITE_BIKER, STAY, RIGHT, 2, OPP_CUE_BALL, 5
	object_event  4, 18, SPRITE_BIKER, STAY, UP, 3, OPP_BIKER, 8
	object_event  7, 32, SPRITE_BIKER, STAY, LEFT, 4, OPP_BIKER, 9
	object_event 14, 34, SPRITE_BIKER, STAY, RIGHT, 5, OPP_BIKER, 10
	object_event 17, 58, SPRITE_BIKER, STAY, LEFT, 6, OPP_CUE_BALL, 6
	object_event  2, 68, SPRITE_BIKER, STAY, RIGHT, 7, OPP_CUE_BALL, 7
	object_event 14, 98, SPRITE_BIKER, STAY, RIGHT, 8, OPP_CUE_BALL, 8
	object_event  5, 98, SPRITE_BIKER, STAY, LEFT, 9, OPP_BIKER, 11
	object_event 10, 118, SPRITE_BIKER, STAY, DOWN, 10, OPP_BIKER, 12

	def_warps_to ROUTE_17
