SilphCo1F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 10, 17, LAST_MAP, 6
	warp_event 11, 17, LAST_MAP, 6
	warp_event 26,  0, SILPH_CO_2F, 1
	warp_event 20,  0, SILPH_CO_ELEVATOR, 1
	warp_event 16, 10, SILPH_CO_3F, 7

	def_bg_events

	def_object_events
	object_event  11, 13, SPRITE_GUARD, STAY, UP, 1, OPP_FIREFIGHTER, 3 ; person
	object_event  10, 14, SPRITE_GUARD, STAY, UP, 2, OPP_FIREFIGHTER, 4 ; person
	object_event  11, 14, SPRITE_GUARD, STAY, UP, 3, OPP_FIREFIGHTER, 5 ; person
	object_event  12, 14, SPRITE_GUARD, STAY, UP, 4, OPP_FIREFIGHTER, 6 ; person
	object_event  4,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 5 ; person

	def_warps_to SILPH_CO_1F
