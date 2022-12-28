SSAnne1FRooms_Object:
	db $c ; border block

	def_warp_events
	warp_event  0,  0, SS_ANNE_1F, 3
	warp_event 10,  0, SS_ANNE_1F, 4
	warp_event 20,  0, SS_ANNE_1F, 5
	warp_event  0, 10, SS_ANNE_1F, 6
	warp_event 10, 10, SS_ANNE_1F, 7
	warp_event 20, 10, SS_ANNE_1F, 8

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GENTLEMAN, STAY, LEFT, 1, OPP_GENTLEMAN, 1
	object_event 11,  4, SPRITE_GENTLEMAN, STAY, UP, 2, OPP_GENTLEMAN, 2
	object_event 11, 14, SPRITE_YOUNGSTER, STAY, UP, 3, OPP_YOUNGSTER, 8
	object_event 13, 11, SPRITE_COOLTRAINER_F, STAY, LEFT, 4, OPP_LASS, 11
	object_event 22,  3, SPRITE_GIRL, WALK, UP_DOWN, 5 ; person
	object_event  0, 14, SPRITE_MIDDLE_AGED_MAN, STAY, NONE, 6 ; person
	object_event  2, 11, SPRITE_LITTLE_GIRL, STAY, DOWN, 7 ; person
	object_event  3, 11, SPRITE_FAIRY, STAY, DOWN, 8 ; person
	object_event 10, 13, SPRITE_GIRL, STAY, RIGHT, 9 ; person
	object_event 12, 15, SPRITE_POKE_BALL, STAY, NONE, 10, TM_BODY_SLAM
	object_event 21, 13, SPRITE_GENTLEMAN, WALK, LEFT_RIGHT, 11 ; person

	def_warps_to SS_ANNE_1F_ROOMS
