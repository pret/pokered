PewterGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 13, LAST_MAP, 3
	warp_event  5, 13, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  4,  1, SPRITE_SUPER_NERD, STAY, DOWN, 1, OPP_BROCK, 1
	object_event  3,  5, SPRITE_COOLTRAINER_M, STAY, RIGHT, 2, OPP_JR_TRAINER_M, 1
	object_event  6,  7, SPRITE_COOLTRAINER_F, STAY, LEFT, 3, OPP_LASS, 19
	object_event  7, 10, SPRITE_GYM_GUIDE, STAY, DOWN, 4 ; person

	def_warps_to PEWTER_GYM
