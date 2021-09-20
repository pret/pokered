SilphCo4F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 24,  0, 1, SILPH_CO_3F
	warp_event 26,  0, 1, SILPH_CO_5F
	warp_event 20,  0, 0, SILPH_CO_ELEVATOR
	warp_event 11,  7, 3, SILPH_CO_10F
	warp_event 17,  3, 3, SILPH_CO_6F
	warp_event  3, 15, 4, SILPH_CO_10F
	warp_event 17, 11, 5, SILPH_CO_10F

	def_bg_events

	def_object_events
	object_event SPRITE_SILPH_WORKER, 6, 2, STAY, NONE, 1 ; person
	object_event SPRITE_ROCKET, 9, 14, STAY, RIGHT, 2, OPP_ROCKET, 26
	object_event SPRITE_SCIENTIST, 14, 6, STAY, LEFT, 3, OPP_SCIENTIST, 5
	object_event SPRITE_ROCKET, 26, 10, STAY, UP, 4, OPP_ROCKET, 27
	object_event SPRITE_POKE_BALL, 3, 9, STAY, NONE, 5, FULL_HEAL
	object_event SPRITE_POKE_BALL, 4, 7, STAY, NONE, 6, MAX_REVIVE
	object_event SPRITE_POKE_BALL, 5, 8, STAY, NONE, 7, ESCAPE_ROPE

	def_warps_to SILPH_CO_4F
