SilphCo1F_Object:
	db $2e ; border block

	def_warp_events
	warp_event 10, 17, 5, LAST_MAP
	warp_event 11, 17, 5, LAST_MAP
	warp_event 26,  0, 0, SILPH_CO_2F
	warp_event 20,  0, 0, SILPH_CO_ELEVATOR
	warp_event 16, 10, 6, SILPH_CO_3F

	def_bg_events

	def_objects
	object SPRITE_LINK_RECEPTIONIST, 4, 2, STAY, DOWN, 1 ; person

	def_warps_to SILPH_CO_1F
