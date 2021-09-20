Route21_Object:
	db $43 ; border block

	def_warp_events

	def_bg_events

	def_object_events
	object_event SPRITE_FISHER, 4, 24, STAY, LEFT, 1, OPP_FISHER, 7
	object_event SPRITE_FISHER, 6, 25, STAY, DOWN, 2, OPP_FISHER, 9
	object_event SPRITE_SWIMMER, 10, 31, STAY, UP, 3, OPP_SWIMMER, 12
	object_event SPRITE_SWIMMER, 12, 30, STAY, RIGHT, 4, OPP_CUE_BALL, 9
	object_event SPRITE_SWIMMER, 16, 63, STAY, DOWN, 5, OPP_SWIMMER, 13
	object_event SPRITE_SWIMMER, 5, 71, STAY, RIGHT, 6, OPP_SWIMMER, 14
	object_event SPRITE_SWIMMER, 15, 71, STAY, LEFT, 7, OPP_SWIMMER, 15
	object_event SPRITE_FISHER, 14, 56, STAY, LEFT, 8, OPP_FISHER, 8
	object_event SPRITE_FISHER, 17, 57, STAY, RIGHT, 9, OPP_FISHER, 10

	def_warps_to ROUTE_21
