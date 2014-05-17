HallofFameRoomObject: ; 0x5a571 (size=26)
	db $3 ; border block

	db $2 ; warps
	db $7, $4, $2, CHAMPIONS_ROOM
	db $7, $5, $3, CHAMPIONS_ROOM

	db $0 ; signs

	db $1 ; people
	db SPRITE_OAK, $2 + 4, $5 + 4, $ff, $d0, $1 ; person

	; warp-to
	EVENT_DISP HALL_OF_FAME_WIDTH, $7, $4 ; CHAMPIONS_ROOM
	EVENT_DISP HALL_OF_FAME_WIDTH, $7, $5 ; CHAMPIONS_ROOM
