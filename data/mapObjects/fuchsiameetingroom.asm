FuchsiaMeetingRoomObject: ; 0x756fc (size=38)
	db $17 ; border block

	db $2 ; warps
	db $7, $4, $6, $ff
	db $7, $5, $6, $ff

	db $0 ; signs

	db $3 ; people
	db SPRITE_WHITE_PLAYER, $1 + 4, $4 + 4, $ff, $d0, $1 ; person
	db SPRITE_WHITE_PLAYER, $2 + 4, $0 + 4, $ff, $d1, $2 ; person
	db SPRITE_WHITE_PLAYER, $1 + 4, $a + 4, $ff, $d0, $3 ; person

	; warp-to
	EVENT_DISP FUCHSIA_MEETING_ROOM_WIDTH, $7, $4
	EVENT_DISP FUCHSIA_MEETING_ROOM_WIDTH, $7, $5
