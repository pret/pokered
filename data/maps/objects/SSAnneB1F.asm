SSAnneB1F_Object:
	db $c ; border block

	def_warp_events
	warp_event 23,  3, 8, SS_ANNE_B1F_ROOMS
	warp_event 19,  3, 6, SS_ANNE_B1F_ROOMS
	warp_event 15,  3, 4, SS_ANNE_B1F_ROOMS
	warp_event 11,  3, 2, SS_ANNE_B1F_ROOMS
	warp_event  7,  3, 0, SS_ANNE_B1F_ROOMS
	warp_event 27,  5, 9, SS_ANNE_1F

	def_bg_events

	def_objects

	def_warps_to SS_ANNE_B1F
