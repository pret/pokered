SilphCo11F_Object:
	db $d ; border block

	def_warp_events
	warp_event  9,  0, SILPH_CO_10F, 2
	warp_event 13,  0, SILPH_CO_ELEVATOR, 1
	warp_event  5,  5, LAST_MAP, 10
	warp_event  3,  2, SILPH_CO_7F, 4

	def_bg_events

	def_object_events
	object_event  7,  5, SPRITE_SILPH_PRESIDENT, STAY, DOWN, 1 ; person
	object_event 10,  5, SPRITE_BEAUTY, STAY, DOWN, 2 ; person
	object_event  6,  9, SPRITE_GIOVANNI, STAY, DOWN, 3, OPP_GIOVANNI, 2
	object_event  3, 16, SPRITE_ROCKET, STAY, UP, 4, OPP_ROCKET, 41
	object_event 15,  9, SPRITE_ROCKET, STAY, UP, 5, OPP_ROCKET, 40

	def_warps_to SILPH_CO_11F
