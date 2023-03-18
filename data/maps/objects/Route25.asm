Route25_Object:
	db $2c ; border block

	def_warp_events
	warp_event 45,  5, BILLS_HOUSE, 1

	def_bg_events
	bg_event 43,  5, 11 ; Route25Text11
	bg_event 53,  7, 12 ; Route25Text12

	def_object_events
	object_event 14,  4, SPRITE_YOUNGSTER, STAY, DOWN, 1, OPP_YOUNGSTER, 5
	object_event 18,  7, SPRITE_YOUNGSTER, STAY, UP, 2, OPP_YOUNGSTER, 6
	object_event 24,  6, SPRITE_COOLTRAINER_M, STAY, DOWN, 3, OPP_JR_TRAINER_M, 10
	object_event 18, 10, SPRITE_COOLTRAINER_F, STAY, RIGHT, 4, OPP_LASS, 9
	object_event 32,  5, SPRITE_YOUNGSTER, STAY, LEFT, 5, OPP_YOUNGSTER, 7
	object_event 37,  6, SPRITE_COOLTRAINER_F, STAY, DOWN, 6, OPP_LASS, 10
	object_event  8,  6, SPRITE_HIKER, STAY, RIGHT, 7, OPP_HIKER, 2
	object_event 23, 11, SPRITE_HIKER, STAY, UP, 8, OPP_HIKER, 3
	object_event 13,  9, SPRITE_HIKER, STAY, RIGHT, 9, OPP_HIKER, 4
	object_event 22,  4, SPRITE_POKE_BALL, STAY, NONE, 10, TM_ROUTE_25_CUT_ALCOVE

	def_warps_to ROUTE_25
