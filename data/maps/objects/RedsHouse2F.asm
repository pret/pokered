RedsHouse2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  1, REDS_HOUSE_1F, 3
	;warp_event  5,  1, SILPH_GAUNTLET_7F, 1 ; - Test Chief 
	;warp_event  5,  1, SILPH_CO_11F, 1 ; - Test Omega & Giovanni
	;warp_event  5,  1, ROCKET_HIDEOUT_B4F, 2 ; - Test Giovanni 1
	;warp_event  5,  1, MT_MOON_SQUARE, 1 ; - Test Shop, NPCs, and Crater
	;warp_event  5,  1, CELESTE_HILL, 2 ; - Test Birds
	warp_event	 5,  1, INDIGO_PLATEAU_LOBBY, 1 ; easy league access

	def_bg_events

	def_object_events

	def_warps_to REDS_HOUSE_2F
