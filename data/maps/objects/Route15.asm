Route15_Object:
	db $43 ; border block

	def_warp_events
	warp_event  7,  8, ROUTE_15_GATE_1F, 1
	warp_event  7,  9, ROUTE_15_GATE_1F, 2
	warp_event 14,  8, ROUTE_15_GATE_1F, 3
	warp_event 14,  9, ROUTE_15_GATE_1F, 4

	def_bg_events
	bg_event 39,  9, 12 ; Route15Text12

	def_object_events
	object_event 41, 11, SPRITE_COOLTRAINER_F, STAY, DOWN, 1, OPP_JR_TRAINER_F, 20
	object_event 53, 10, SPRITE_COOLTRAINER_F, STAY, LEFT, 2, OPP_JR_TRAINER_F, 21
	object_event 31, 13, SPRITE_COOLTRAINER_M, STAY, UP, 3, OPP_BIRD_KEEPER, 6
	object_event 35, 13, SPRITE_COOLTRAINER_M, STAY, UP, 4, OPP_BIRD_KEEPER, 7
	object_event 53, 11, SPRITE_BEAUTY, STAY, DOWN, 5, OPP_BEAUTY, 9
	object_event 41, 10, SPRITE_BEAUTY, STAY, RIGHT, 6, OPP_BEAUTY, 10
	object_event 48, 10, SPRITE_BIKER, STAY, DOWN, 7, OPP_BIKER, 3
	object_event 46, 10, SPRITE_BIKER, STAY, DOWN, 8, OPP_BIKER, 4
	object_event 37,  5, SPRITE_COOLTRAINER_F, STAY, RIGHT, 9, OPP_JR_TRAINER_F, 22
	object_event 18, 13, SPRITE_COOLTRAINER_F, STAY, UP, 10, OPP_JR_TRAINER_F, 23
	object_event 18,  5, SPRITE_POKE_BALL, STAY, NONE, 11, TM_RAGE

	def_warps_to ROUTE_15
