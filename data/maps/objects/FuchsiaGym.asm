FuchsiaGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 17, LAST_MAP, 6
	warp_event  5, 17, LAST_MAP, 6

	def_bg_events

	def_object_events
	object_event  4, 10, SPRITE_KOGA, STAY, DOWN, 1, OPP_KOGA, 1
	object_event  8, 13, SPRITE_ROCKER, STAY, DOWN, 2, OPP_JUGGLER, 7
	object_event  7,  8, SPRITE_ROCKER, STAY, RIGHT, 3, OPP_JUGGLER, 3
	object_event  1, 12, SPRITE_ROCKER, STAY, DOWN, 4, OPP_JUGGLER, 8
	object_event  3,  5, SPRITE_ROCKER, STAY, UP, 5, OPP_TAMER, 1
	object_event  8,  2, SPRITE_ROCKER, STAY, DOWN, 6, OPP_TAMER, 2
	object_event  2,  7, SPRITE_ROCKER, STAY, LEFT, 7, OPP_JUGGLER, 4
	object_event  7, 15, SPRITE_GYM_GUIDE, STAY, DOWN, 8 ; person

	def_warps_to FUCHSIA_GYM
