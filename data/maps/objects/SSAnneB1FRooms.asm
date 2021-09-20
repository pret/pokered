SSAnneB1FRooms_Object:
	db $c ; border block

	def_warp_events
	warp_event  2,  5, 4, SS_ANNE_B1F
	warp_event  3,  5, 4, SS_ANNE_B1F
	warp_event 12,  5, 3, SS_ANNE_B1F
	warp_event 13,  5, 3, SS_ANNE_B1F
	warp_event 22,  5, 2, SS_ANNE_B1F
	warp_event 23,  5, 2, SS_ANNE_B1F
	warp_event  2, 15, 1, SS_ANNE_B1F
	warp_event  3, 15, 1, SS_ANNE_B1F
	warp_event 12, 15, 0, SS_ANNE_B1F
	warp_event 13, 15, 0, SS_ANNE_B1F

	def_bg_events

	def_object_events
	object_event SPRITE_SAILOR, 0, 13, STAY, DOWN, 1, OPP_SAILOR, 3
	object_event SPRITE_SAILOR, 2, 11, STAY, DOWN, 2, OPP_SAILOR, 4
	object_event SPRITE_SAILOR, 12, 3, STAY, LEFT, 3, OPP_SAILOR, 5
	object_event SPRITE_SAILOR, 22, 2, STAY, DOWN, 4, OPP_SAILOR, 6
	object_event SPRITE_SAILOR, 0, 2, STAY, RIGHT, 5, OPP_SAILOR, 7
	object_event SPRITE_FISHER, 0, 4, STAY, RIGHT, 6, OPP_FISHER, 2
	object_event SPRITE_SUPER_NERD, 10, 13, STAY, RIGHT, 7 ; person
	object_event SPRITE_MONSTER, 11, 12, STAY, NONE, 8 ; person
	object_event SPRITE_POKE_BALL, 20, 2, STAY, NONE, 9, ETHER
	object_event SPRITE_POKE_BALL, 10, 2, STAY, NONE, 10, TM_REST
	object_event SPRITE_POKE_BALL, 12, 11, STAY, NONE, 11, MAX_POTION

	def_warps_to SS_ANNE_B1F_ROOMS
