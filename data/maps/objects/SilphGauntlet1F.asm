SilphGauntlet1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  14,  1, SILPH_CO_1F, 4
	warp_event  8,  9, SILPH_GAUNTLET_2F, 1

	def_bg_events

	def_object_events
	object_event  3,  3, SPRITE_YOUNGSTER, STAY, UP, 1, OPP_YOUNGSTER, 13
	object_event  3, 14, SPRITE_YOUNGSTER, STAY, LEFT, 2, OPP_BUG_CATCHER, 12
	object_event 16, 14, SPRITE_GIRL, STAY, DOWN, 3, OPP_STUDENT, 3
	object_event 16,  5, SPRITE_COOLTRAINER_M, STAY, RIGHT, 4, OPP_JR_TRAINER_M, 6
	object_event  5,  7, SPRITE_COOLTRAINER_F, STAY, LEFT, 5, OPP_JR_TRAINER_F, 25
	object_event  5, 12, SPRITE_COOLTRAINER_M, STAY, DOWN, 6, OPP_BIRD_KEEPER, 13

	def_warps_to SILPH_GAUNTLET_1F
