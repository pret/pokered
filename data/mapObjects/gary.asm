GaryObject: ; 0x7612f (size=48)
	db $3 ; border block

	db $4 ; warps
	db $7, $3, $1, LANCES_ROOM
	db $7, $4, $2, LANCES_ROOM
	db $0, $3, $0, HALL_OF_FAME
	db $0, $4, $0, HALL_OF_FAME

	db $0 ; signs

	db $2 ; people
	db SPRITE_BLUE, $2 + 4, $4 + 4, $ff, $d0, $1 ; person
	db SPRITE_OAK, $7 + 4, $3 + 4, $ff, $d1, $2 ; person

	; warp-to
	EVENT_DISP CHAMPIONS_ROOM_WIDTH, $7, $3 ; LANCES_ROOM
	EVENT_DISP CHAMPIONS_ROOM_WIDTH, $7, $4 ; LANCES_ROOM
	EVENT_DISP CHAMPIONS_ROOM_WIDTH, $0, $3 ; HALL_OF_FAME
	EVENT_DISP CHAMPIONS_ROOM_WIDTH, $0, $4 ; HALL_OF_FAME
