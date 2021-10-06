SilphCo6F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 16,  0, SILPH_CO_7F, 2
	warp_event 14,  0, SILPH_CO_5F, 1
	warp_event 18,  0, SILPH_CO_ELEVATOR, 1
	warp_event  3,  3, SILPH_CO_4F, 5
	warp_event 23,  3, SILPH_CO_2F, 7

	def_bg_events

	def_object_events
	object_event 10,  6, SPRITE_SILPH_WORKER, STAY, NONE, 1 ; person
	object_event 20,  6, SPRITE_SILPH_WORKER, STAY, NONE, 2 ; person
	object_event 21,  6, SPRITE_ERIKA, STAY, DOWN, 3 ; person
	object_event 11, 10, SPRITE_ERIKA, STAY, RIGHT, 4 ; person
	object_event 18, 13, SPRITE_SILPH_WORKER, STAY, UP, 5 ; person
	object_event 17,  3, SPRITE_ROCKET, STAY, RIGHT, 6, OPP_ROCKET, 30
	object_event  7,  8, SPRITE_SCIENTIST, STAY, DOWN, 7, OPP_SCIENTIST, 7
	object_event 14, 15, SPRITE_ROCKET, STAY, LEFT, 8, OPP_ROCKET, 31
	object_event  3, 12, SPRITE_POKE_BALL, STAY, NONE, 9, HP_UP
	object_event  2, 15, SPRITE_POKE_BALL, STAY, NONE, 10, X_ACCURACY

	def_warps_to SILPH_CO_6F
