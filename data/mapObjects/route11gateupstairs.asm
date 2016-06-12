Route11GateUpstairsObject:
	db $a ; border block

	db $1 ; warps
	db $7, $7, $4, ROUTE_11_GATE_1F

	db $2 ; signs
	db $2, $1, $3 ; Route11GateUpstairsText3
	db $2, $6, $4 ; Route11GateUpstairsText4

	db $2 ; objects
	object SPRITE_BUG_CATCHER, $4, $2, WALK, $2, $1 ; person
	object SPRITE_OAK_AIDE, $2, $6, STAY, NONE, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_11_GATE_2F_WIDTH, $7, $7 ; ROUTE_11_GATE_1F
