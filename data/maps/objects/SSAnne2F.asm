SSAnne2F_Object:
	db $c ; border block

	def_warp_events
	warp_event  9, 11, SS_ANNE_2F_ROOMS, 1
	warp_event 13, 11, SS_ANNE_2F_ROOMS, 3
	warp_event 17, 11, SS_ANNE_2F_ROOMS, 5
	warp_event 21, 11, SS_ANNE_2F_ROOMS, 7
	warp_event 25, 11, SS_ANNE_2F_ROOMS, 9
	warp_event 29, 11, SS_ANNE_2F_ROOMS, 11
	warp_event  2,  4, SS_ANNE_1F, 9
	warp_event  2, 12, SS_ANNE_3F, 2
	warp_event 36,  4, SS_ANNE_CAPTAINS_ROOM, 1

	def_bg_events

	def_object_events
	object_event  3,  7, SPRITE_WAITER, WALK, UP_DOWN, 1 ; person
	object_event 36,  4, SPRITE_BLUE, STAY, DOWN, 2, OPP_RIVAL1, 1

	def_warps_to SS_ANNE_2F
