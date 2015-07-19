FuchsiaMeetingRoomObject: ; 0x756fc (size=38)
	db $17 ; border block

	db $2 ; warps
	db $7, $4, $6, $ff
	db $7, $5, $6, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_WHITE_PLAYER, $4, $1, FACE, DOWN, $1 ; person
	object SPRITE_WHITE_PLAYER, $0, $2, FACE, UP, $2 ; person
	object SPRITE_WHITE_PLAYER, $a, $1, FACE, DOWN, $3 ; person

	; warp-to
	EVENT_DISP FUCHSIA_MEETING_ROOM_WIDTH, $7, $4
	EVENT_DISP FUCHSIA_MEETING_ROOM_WIDTH, $7, $5
