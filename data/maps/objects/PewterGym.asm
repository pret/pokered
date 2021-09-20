PewterGym_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 13, 2, LAST_MAP
	warp_event  5, 13, 2, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_SUPER_NERD, 4, 1, STAY, DOWN, 1, OPP_BROCK, 1
	object_event SPRITE_COOLTRAINER_M, 3, 6, STAY, RIGHT, 2, OPP_JR_TRAINER_M, 1
	object_event SPRITE_GYM_GUIDE, 7, 10, STAY, DOWN, 3 ; person

	def_warps_to PEWTER_GYM
