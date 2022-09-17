Route20_Object:
	db $43 ; border block

	def_warp_events
	warp_event 48, 17, SEAFOAM_ISLANDS_1F, 1
	warp_event 58, 21, SEAFOAM_ISLANDS_1F, 3

	def_bg_events
	bg_event 51, 19, 11 ; Route20Text11
	bg_event 57, 23, 12 ; Route20Text12

	def_object_events
	object_event 87, 20, SPRITE_SWIMMER, STAY, UP, 1, OPP_SWIMMER, 9
	object_event 68, 23, SPRITE_SWIMMER, STAY, UP, 2, OPP_BEAUTY, 15
	object_event 45, 22, SPRITE_SWIMMER, STAY, DOWN, 3, OPP_BEAUTY, 6
	object_event 55, 26, SPRITE_SWIMMER, STAY, RIGHT, 4, OPP_JR_TRAINER_F, 24
	object_event 38, 25, SPRITE_SWIMMER, STAY, DOWN, 5, OPP_SWIMMER, 10
	object_event 87, 25, SPRITE_SWIMMER, STAY, UP, 6, OPP_SWIMMER, 11
	object_event 34, 21, SPRITE_COOLTRAINER_M, STAY, UP, 7, OPP_BIRD_KEEPER, 11
	object_event 25, 19, SPRITE_SWIMMER, STAY, UP, 8, OPP_BEAUTY, 7
	object_event 24, 24, SPRITE_SWIMMER, STAY, DOWN, 9, OPP_JR_TRAINER_F, 16
	object_event 15, 20, SPRITE_SWIMMER, STAY, UP, 10, OPP_BEAUTY, 8

	def_warps_to ROUTE_20
