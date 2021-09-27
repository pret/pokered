Route3_Object:
	db $2c ; border block

	def_warp_events

	def_bg_events
	bg_event 59,  9, 10 ; Route3Text10

	def_object_events
	object_event 57, 11, SPRITE_SUPER_NERD, STAY, NONE, 1 ; person
	object_event 10,  6, SPRITE_YOUNGSTER, STAY, RIGHT, 2, OPP_BUG_CATCHER, 4
	object_event 14,  4, SPRITE_YOUNGSTER, STAY, DOWN, 3, OPP_YOUNGSTER, 1
	object_event 16,  9, SPRITE_COOLTRAINER_F, STAY, LEFT, 4, OPP_LASS, 1
	object_event 19,  5, SPRITE_YOUNGSTER, STAY, DOWN, 5, OPP_BUG_CATCHER, 5
	object_event 23,  4, SPRITE_COOLTRAINER_F, STAY, LEFT, 6, OPP_LASS, 2
	object_event 22,  9, SPRITE_YOUNGSTER, STAY, LEFT, 7, OPP_YOUNGSTER, 2
	object_event 24,  6, SPRITE_YOUNGSTER, STAY, RIGHT, 8, OPP_BUG_CATCHER, 6
	object_event 33, 10, SPRITE_COOLTRAINER_F, STAY, UP, 9, OPP_LASS, 3

	def_warps_to ROUTE_3
