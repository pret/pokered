HallofFameRoomObject:
	db $3 ; border block

	db $2 ; warps
	db $7, $4, $2, CHAMPIONS_ROOM
	db $7, $5, $3, CHAMPIONS_ROOM

	db $0 ; signs

	db $1 ; objects
	object SPRITE_OAK, $5, $2, STAY, DOWN, $1 ; person

	; warp-to
	EVENT_DISP HALL_OF_FAME_WIDTH, $7, $4 ; CHAMPIONS_ROOM
	EVENT_DISP HALL_OF_FAME_WIDTH, $7, $5 ; CHAMPIONS_ROOM
