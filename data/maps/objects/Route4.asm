Route4_Object:
	db $2c ; border block

	def_warp_events
	warp_event 11,  5, MT_MOON_POKECENTER, 1
	warp_event 18,  5, MT_MOON_1F, 1
	warp_event 24,  5, MT_MOON_B1F, 8

	def_bg_events
	bg_event 12,  5, 8 ; PokeCenterSignText
	bg_event 17,  7, 9 ; Sign
	bg_event 27,  7, 10 ; Sign
	bg_event 5,  5, 11 ; Sign
	bg_event 59,  15, 12 ; Sign

	def_object_events
	object_event  9,  8, SPRITE_COOLTRAINER_F, WALK, ANY_DIR, 1 ; person
	object_event 51,  3, SPRITE_COOLTRAINER_F, STAY, DOWN, 2, OPP_LASS, 4
	object_event 47,  5, SPRITE_COOLTRAINER_M, STAY, RIGHT, 3, OPP_ROOKIE, 1
	object_event 48,  5, SPRITE_COOLTRAINER_M, STAY, LEFT, 4, OPP_ROOKIE, 2
	object_event 5,  12, SPRITE_SUPER_NERD, STAY, RIGHT, 5, OPP_TAMER, 6
	object_event 57,  3, SPRITE_POKE_BALL, STAY, NONE, 6, TM_LEECH_SEED
	object_event 63,  3, SPRITE_POKE_BALL, STAY, NONE, 7, HYPER_BALL

	def_warps_to ROUTE_4
