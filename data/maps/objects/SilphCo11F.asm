SilphCo11F_Object:
	db $d ; border block

	def_warp_events
	warp_event  9,  0, 1, SILPH_CO_10F
	warp_event 13,  0, 0, SILPH_CO_ELEVATOR
	warp_event  5,  5, 9, LAST_MAP
	warp_event  3,  2, 3, SILPH_CO_7F

	def_bg_events

	def_object_events
	object_event SPRITE_SILPH_PRESIDENT, 7, 5, STAY, DOWN, 1 ; person
	object_event SPRITE_BEAUTY, 10, 5, STAY, DOWN, 2 ; person
	object_event SPRITE_GIOVANNI, 6, 9, STAY, DOWN, 3, OPP_GIOVANNI, 2
	object_event SPRITE_ROCKET, 3, 16, STAY, UP, 4, OPP_ROCKET, 41
	object_event SPRITE_ROCKET, 15, 9, STAY, UP, 5, OPP_ROCKET, 40

	def_warps_to SILPH_CO_11F
