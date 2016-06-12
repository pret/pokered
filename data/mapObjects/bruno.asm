BrunoObject:
	db $3 ; border block

	db $4 ; warps
	db $b, $4, $2, LORELEIS_ROOM
	db $b, $5, $3, LORELEIS_ROOM
	db $0, $4, $0, AGATHAS_ROOM
	db $0, $5, $1, AGATHAS_ROOM

	db $0 ; signs

	db $1 ; objects
	object SPRITE_BRUNO, $5, $2, STAY, DOWN, $1, OPP_BRUNO, $1

	; warp-to
	EVENT_DISP BRUNOS_ROOM_WIDTH, $b, $4 ; LORELEIS_ROOM
	EVENT_DISP BRUNOS_ROOM_WIDTH, $b, $5 ; LORELEIS_ROOM
	EVENT_DISP BRUNOS_ROOM_WIDTH, $0, $4 ; AGATHAS_ROOM
	EVENT_DISP BRUNOS_ROOM_WIDTH, $0, $5 ; AGATHAS_ROOM
