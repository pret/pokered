LanceObject: ; 0x5a3c5 (size=36)
	db $3 ; border block

	db $3 ; warps
	db $10, $18, $2, AGATHAS_ROOM
	db $0, $5, $0, CHAMPIONS_ROOM
	db $0, $6, $0, CHAMPIONS_ROOM

	db $0 ; signs

	db $1 ; people
	db SPRITE_LANCE, $1 + 4, $6 + 4, $ff, $d0, TRAINER | $1, LANCE + $C8, $1

	; warp-to
	EVENT_DISP LANCES_ROOM_WIDTH, $10, $18 ; AGATHAS_ROOM
	EVENT_DISP LANCES_ROOM_WIDTH, $0, $5 ; CHAMPIONS_ROOM
	EVENT_DISP LANCES_ROOM_WIDTH, $0, $6 ; CHAMPIONS_ROOM
