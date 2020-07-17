IndigoPlateauLobby_Object:
	db $0 ; border block

	db 3 ; warps
	warp 7, 11, 0, LAST_MAP
	warp 8, 11, 1, LAST_MAP
	warp 8, 0, 0, LORELEIS_ROOM

	db 0 ; signs

	db 5 ; objects
	object SPRITE_NURSE, 7, 5, STAY, DOWN, 1 ; person
	object SPRITE_GYM_GUIDE, 4, 9, STAY, RIGHT, 2 ; person
	object SPRITE_COOLTRAINER_F, 5, 1, STAY, DOWN, 3 ; person
	object SPRITE_CLERK, 0, 5, STAY, RIGHT, 4 ; person
	object SPRITE_LINK_RECEPTIONIST, 13, 6, STAY, DOWN, 5 ; person

	; warp-to
	warp_to 7, 11, INDIGO_PLATEAU_LOBBY_WIDTH
	warp_to 8, 11, INDIGO_PLATEAU_LOBBY_WIDTH
	warp_to 8, 0, INDIGO_PLATEAU_LOBBY_WIDTH ; LORELEIS_ROOM
