HallOfFame_Object:
	db $3 ; border block

	db 2 ; warps
	warp 4, 7, 2, CHAMPIONS_ROOM
	warp 5, 7, 3, CHAMPIONS_ROOM

	db 0 ; signs

	db 1 ; objects
	object SPRITE_OAK, 5, 2, STAY, DOWN, 1 ; person

	; warp-to
	warp_to 4, 7, HALL_OF_FAME_WIDTH ; CHAMPIONS_ROOM
	warp_to 5, 7, HALL_OF_FAME_WIDTH ; CHAMPIONS_ROOM
