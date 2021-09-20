MtMoonB1F_Object:
	db $3 ; border block

	def_warp_events
	warp_event  5,  5, 2, MT_MOON_1F
	warp_event 17, 11, 0, MT_MOON_B2F
	warp_event 25,  9, 3, MT_MOON_1F
	warp_event 25, 15, 4, MT_MOON_1F
	warp_event 21, 17, 1, MT_MOON_B2F
	warp_event 13, 27, 2, MT_MOON_B2F
	warp_event 23,  3, 3, MT_MOON_B2F
	warp_event 27,  3, 2, LAST_MAP

	def_bg_events

	def_objects

	def_warps_to MT_MOON_B1F
