FuchsiaMeetingRoom_Object:
	db $17 ; border block

	db 2 ; warps
	warp 4, 7, 6, -1
	warp 5, 7, 6, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_WHITE_PLAYER, 4, 1, STAY, DOWN, 1 ; person
	object SPRITE_WHITE_PLAYER, 0, 2, STAY, UP, 2 ; person
	object SPRITE_WHITE_PLAYER, 10, 1, STAY, DOWN, 3 ; person

	; warp-to
	warp_to 4, 7, FUCHSIA_MEETING_ROOM_WIDTH
	warp_to 5, 7, FUCHSIA_MEETING_ROOM_WIDTH
