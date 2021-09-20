SilphCo3F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 26,  0, 1, SILPH_CO_2F
	warp_event 24,  0, 0, SILPH_CO_4F
	warp_event 20,  0, 0, SILPH_CO_ELEVATOR
	warp_event 23, 11, 9, SILPH_CO_3F
	warp_event  3,  3, 5, SILPH_CO_5F
	warp_event  3, 15, 6, SILPH_CO_5F
	warp_event 27,  3, 3, SILPH_CO_2F
	warp_event  3, 11, 3, SILPH_CO_9F
	warp_event 11, 11, 4, SILPH_CO_7F
	warp_event 27, 15, 3, SILPH_CO_3F

	def_bg_events

	def_object_events
	object_event SPRITE_SILPH_WORKER, 24, 8, STAY, NONE, 1 ; person
	object_event SPRITE_ROCKET, 20, 7, STAY, LEFT, 2, OPP_ROCKET, 25
	object_event SPRITE_SCIENTIST, 7, 9, STAY, DOWN, 3, OPP_SCIENTIST, 4
	object_event SPRITE_POKE_BALL, 8, 5, STAY, NONE, 4, HYPER_POTION

	def_warps_to SILPH_CO_3F
