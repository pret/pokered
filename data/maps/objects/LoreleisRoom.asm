LoreleisRoom_Object:
	db $3 ; border block

	db 4 ; warps
	warp 4, 11, 2, INDIGO_PLATEAU_LOBBY
	warp 5, 11, 2, INDIGO_PLATEAU_LOBBY
	warp 4, 0, 0, BRUNOS_ROOM
	warp 5, 0, 1, BRUNOS_ROOM

	db 0 ; signs

	db 1 ; objects
	object SPRITE_LORELEI, 5, 2, STAY, DOWN, 1, OPP_LORELEI, 1

	; warp-to
	warp_to 4, 11, LORELEIS_ROOM_WIDTH ; INDIGO_PLATEAU_LOBBY
	warp_to 5, 11, LORELEIS_ROOM_WIDTH ; INDIGO_PLATEAU_LOBBY
	warp_to 4, 0, LORELEIS_ROOM_WIDTH ; BRUNOS_ROOM
	warp_to 5, 0, LORELEIS_ROOM_WIDTH ; BRUNOS_ROOM
