Mansion1Object:
	db $2e ; border block

	db $8 ; warps
	db $1b, $4, $0, $ff
	db $1b, $5, $0, $ff
	db $1b, $6, $0, $ff
	db $1b, $7, $0, $ff
	db $a, $5, $0, MANSION_2
	db $17, $15, $0, MANSION_4
	db $1b, $1a, $0, $ff
	db $1b, $1b, $0, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_OAK_AIDE, $11, $11, STAY, LEFT, $1, OPP_SCIENTIST, $4
	object SPRITE_BALL, $e, $3, STAY, NONE, $2, ESCAPE_ROPE
	object SPRITE_BALL, $12, $15, STAY, NONE, $3, CARBOS

	; warp-to
	EVENT_DISP MANSION_1_WIDTH, $1b, $4
	EVENT_DISP MANSION_1_WIDTH, $1b, $5
	EVENT_DISP MANSION_1_WIDTH, $1b, $6
	EVENT_DISP MANSION_1_WIDTH, $1b, $7
	EVENT_DISP MANSION_1_WIDTH, $a, $5 ; MANSION_2
	EVENT_DISP MANSION_1_WIDTH, $17, $15 ; MANSION_4
	EVENT_DISP MANSION_1_WIDTH, $1b, $1a
	EVENT_DISP MANSION_1_WIDTH, $1b, $1b
