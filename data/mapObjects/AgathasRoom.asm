AgathasRoom_Object:
	db $0 ; border block

	db 4 ; warps
	warp 4, 11, 2, BRUNOS_ROOM
	warp 5, 11, 3, BRUNOS_ROOM
	warp 4, 0, 0, LANCES_ROOM
	warp 5, 0, 0, LANCES_ROOM

	db 0 ; signs

	db 1 ; objects
	object SPRITE_AGATHA, 5, 2, STAY, DOWN, 1, OPP_AGATHA, 1

	; warp-to
	warp_to 4, 11, AGATHAS_ROOM_WIDTH ; BRUNOS_ROOM
	warp_to 5, 11, AGATHAS_ROOM_WIDTH ; BRUNOS_ROOM
	warp_to 4, 0, AGATHAS_ROOM_WIDTH ; LANCES_ROOM
	warp_to 5, 0, AGATHAS_ROOM_WIDTH ; LANCES_ROOM
