IndigoPlateauLobby_Object:
	db $0 ; border block

	db 3 ; warps
	warp 7, 11, 0, -1
	warp 8, 11, 1, -1
	warp 8, 0, 0, LORELEIS_ROOM

	db 0 ; signs

	db 5 ; objects
	object SPRITE_NURSE, 7, 5, STAY, DOWN, 1 ; person
	object SPRITE_GYM_HELPER, 4, 9, STAY, RIGHT, 2 ; person
	object SPRITE_LASS, 5, 1, STAY, DOWN, 3 ; person
	object SPRITE_MART_GUY, 0, 5, STAY, RIGHT, 4 ; person
	object SPRITE_CABLE_CLUB_WOMAN, 13, 6, STAY, DOWN, 5 ; person

	; warp-to
	warp_to 7, 11, INDIGO_PLATEAU_LOBBY_WIDTH
	warp_to 8, 11, INDIGO_PLATEAU_LOBBY_WIDTH
	warp_to 8, 0, INDIGO_PLATEAU_LOBBY_WIDTH ; LORELEIS_ROOM
