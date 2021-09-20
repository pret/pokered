SSAnne1F_Object:
	db $c ; border block

	def_warp_events
	warp_event 26,  0, 1, VERMILION_DOCK
	warp_event 27,  0, 1, VERMILION_DOCK
	warp_event 31,  8, 0, SS_ANNE_1F_ROOMS
	warp_event 23,  8, 1, SS_ANNE_1F_ROOMS
	warp_event 19,  8, 2, SS_ANNE_1F_ROOMS
	warp_event 15,  8, 3, SS_ANNE_1F_ROOMS
	warp_event 11,  8, 4, SS_ANNE_1F_ROOMS
	warp_event  7,  8, 5, SS_ANNE_1F_ROOMS
	warp_event  2,  6, 6, SS_ANNE_2F
	warp_event 37, 15, 5, SS_ANNE_B1F
	warp_event  3, 16, 0, SS_ANNE_KITCHEN

	def_bg_events

	def_objects
	object SPRITE_WAITER, 12, 6, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_SAILOR, 27, 5, STAY, NONE, 2 ; person

	def_warps_to SS_ANNE_1F
