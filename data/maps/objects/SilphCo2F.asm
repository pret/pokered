SilphCo2F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 24,  0, 2, SILPH_CO_1F
	warp_event 26,  0, 0, SILPH_CO_3F
	warp_event 20,  0, 0, SILPH_CO_ELEVATOR
	warp_event  3,  3, 6, SILPH_CO_3F
	warp_event 13,  3, 4, SILPH_CO_8F
	warp_event 27, 15, 5, SILPH_CO_8F
	warp_event  9, 15, 4, SILPH_CO_6F

	def_bg_events

	def_objects
	object SPRITE_ERIKA, 10, 1, STAY, UP, 1 ; person
	object SPRITE_SCIENTIST, 5, 12, STAY, DOWN, 2, OPP_SCIENTIST, 2
	object SPRITE_SCIENTIST, 24, 13, STAY, LEFT, 3, OPP_SCIENTIST, 3
	object SPRITE_ROCKET, 16, 11, STAY, UP, 4, OPP_ROCKET, 23
	object SPRITE_ROCKET, 24, 7, STAY, UP, 5, OPP_ROCKET, 24

	def_warps_to SILPH_CO_2F
