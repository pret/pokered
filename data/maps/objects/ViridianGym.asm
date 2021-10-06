ViridianGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event 16, 17, LAST_MAP, 5
	warp_event 17, 17, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  2,  1, SPRITE_GIOVANNI, STAY, DOWN, 1, OPP_GIOVANNI, 3
	object_event 12,  7, SPRITE_COOLTRAINER_M, STAY, DOWN, 2, OPP_COOLTRAINER_M, 9
	object_event 11, 11, SPRITE_HIKER, STAY, UP, 3, OPP_BLACKBELT, 6
	object_event 10,  7, SPRITE_ROCKER, STAY, DOWN, 4, OPP_TAMER, 3
	object_event  3,  7, SPRITE_HIKER, STAY, LEFT, 5, OPP_BLACKBELT, 7
	object_event 13,  5, SPRITE_COOLTRAINER_M, STAY, RIGHT, 6, OPP_COOLTRAINER_M, 10
	object_event 10,  1, SPRITE_HIKER, STAY, DOWN, 7, OPP_BLACKBELT, 8
	object_event  2, 16, SPRITE_ROCKER, STAY, RIGHT, 8, OPP_TAMER, 4
	object_event  6,  5, SPRITE_COOLTRAINER_M, STAY, DOWN, 9, OPP_COOLTRAINER_M, 1
	object_event 16, 15, SPRITE_GYM_GUIDE, STAY, DOWN, 10 ; person
	object_event 16,  9, SPRITE_POKE_BALL, STAY, NONE, 11, REVIVE

	def_warps_to VIRIDIAN_GYM
