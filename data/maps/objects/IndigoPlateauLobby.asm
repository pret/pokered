IndigoPlateauLobby_Object:
	db $0 ; border block

	def_warp_events
	warp_event  7, 11, 0, LAST_MAP
	warp_event  8, 11, 1, LAST_MAP
	warp_event  8,  0, 0, LORELEIS_ROOM

	def_bg_events

	def_object_events
	object_event SPRITE_NURSE, 7, 5, STAY, DOWN, 1 ; person
	object_event SPRITE_GYM_GUIDE, 4, 9, STAY, RIGHT, 2 ; person
	object_event SPRITE_COOLTRAINER_F, 5, 1, STAY, DOWN, 3 ; person
	object_event SPRITE_CLERK, 0, 5, STAY, RIGHT, 4 ; person
	object_event SPRITE_LINK_RECEPTIONIST, 13, 6, STAY, DOWN, 5 ; person

	def_warps_to INDIGO_PLATEAU_LOBBY
