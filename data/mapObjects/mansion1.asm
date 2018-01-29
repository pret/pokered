Mansion1Object:
	db $2e ; border block

	db $8 ; warps
	warp $4, $1b, $0, $ff
	warp $5, $1b, $0, $ff
	warp $6, $1b, $0, $ff
	warp $7, $1b, $0, $ff
	warp $5, $a, $0, MANSION_2
	warp $15, $17, $0, MANSION_4
	warp $1a, $1b, $0, $ff
	warp $1b, $1b, $0, $ff

	db $0 ; signs

	db $3 ; objects
	object SPRITE_OAK_AIDE, $11, $11, STAY, LEFT, $1, OPP_SCIENTIST, $4
	object SPRITE_BALL, $e, $3, STAY, NONE, $2, ESCAPE_ROPE
	object SPRITE_BALL, $12, $15, STAY, NONE, $3, CARBOS

	; warp-to
	warp_to $4, $1b, MANSION_1_WIDTH
	warp_to $5, $1b, MANSION_1_WIDTH
	warp_to $6, $1b, MANSION_1_WIDTH
	warp_to $7, $1b, MANSION_1_WIDTH
	warp_to $5, $a, MANSION_1_WIDTH ; MANSION_2
	warp_to $15, $17, MANSION_1_WIDTH ; MANSION_4
	warp_to $1a, $1b, MANSION_1_WIDTH
	warp_to $1b, $1b, MANSION_1_WIDTH
