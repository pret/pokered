SSAnne2F_Object:
	db $c ; border block

	def_warp_events
	warp_event  9, 11,  0, SS_ANNE_2F_ROOMS
	warp_event 13, 11,  2, SS_ANNE_2F_ROOMS
	warp_event 17, 11,  4, SS_ANNE_2F_ROOMS
	warp_event 21, 11,  6, SS_ANNE_2F_ROOMS
	warp_event 25, 11,  8, SS_ANNE_2F_ROOMS
	warp_event 29, 11, 10, SS_ANNE_2F_ROOMS
	warp_event  2,  4,  8, SS_ANNE_1F
	warp_event  2, 12,  1, SS_ANNE_3F
	warp_event 36,  4,  0, SS_ANNE_CAPTAINS_ROOM

	def_bg_events

	def_object_events
	object_event SPRITE_WAITER, 3, 7, WALK, UP_DOWN, 1 ; person
	object_event SPRITE_BLUE, 36, 4, STAY, DOWN, 2, OPP_RIVAL1, 1

	def_warps_to SS_ANNE_2F
