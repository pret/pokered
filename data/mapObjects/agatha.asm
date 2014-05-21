AgathaObject: ; 0x76534 (size=44)
	db $0 ; border block

	db $4 ; warps
	db $b, $4, $2, BRUNOS_ROOM
	db $b, $5, $3, BRUNOS_ROOM
	db $0, $4, $0, LANCES_ROOM
	db $0, $5, $0, LANCES_ROOM

	db $0 ; signs

	db $1 ; people
	db SPRITE_AGATHA, $2 + 4, $5 + 4, $ff, $d0, TRAINER | $1, AGATHA + $C8, $1

	; warp-to
	EVENT_DISP AGATHAS_ROOM_WIDTH, $b, $4 ; BRUNOS_ROOM
	EVENT_DISP AGATHAS_ROOM_WIDTH, $b, $5 ; BRUNOS_ROOM
	EVENT_DISP AGATHAS_ROOM_WIDTH, $0, $4 ; LANCES_ROOM
	EVENT_DISP AGATHAS_ROOM_WIDTH, $0, $5 ; LANCES_ROOM
