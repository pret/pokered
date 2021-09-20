ViridianGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event 16, 17, 4, LAST_MAP
	warp_event 17, 17, 4, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_GIOVANNI, 2, 1, STAY, DOWN, 1, OPP_GIOVANNI, 3
	object_event SPRITE_COOLTRAINER_M, 12, 7, STAY, DOWN, 2, OPP_COOLTRAINER_M, 9
	object_event SPRITE_HIKER, 11, 11, STAY, UP, 3, OPP_BLACKBELT, 6
	object_event SPRITE_ROCKER, 10, 7, STAY, DOWN, 4, OPP_TAMER, 3
	object_event SPRITE_HIKER, 3, 7, STAY, LEFT, 5, OPP_BLACKBELT, 7
	object_event SPRITE_COOLTRAINER_M, 13, 5, STAY, RIGHT, 6, OPP_COOLTRAINER_M, 10
	object_event SPRITE_HIKER, 10, 1, STAY, DOWN, 7, OPP_BLACKBELT, 8
	object_event SPRITE_ROCKER, 2, 16, STAY, RIGHT, 8, OPP_TAMER, 4
	object_event SPRITE_COOLTRAINER_M, 6, 5, STAY, DOWN, 9, OPP_COOLTRAINER_M, 1
	object_event SPRITE_GYM_GUIDE, 16, 15, STAY, DOWN, 10 ; person
	object_event SPRITE_POKE_BALL, 16, 9, STAY, NONE, 11, REVIVE

	def_warps_to VIRIDIAN_GYM
