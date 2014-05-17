Route15GateUpstairsObject: ; 4969d (12:569d)
	db $a ; border block

	db $1 ; warps
	db $7, $7, $4, ROUTE_15_GATE_1F

	db $1 ; signs
	db $2, $6, $2 ; Route15GateUpstairsText2

	db $1 ; people
	db SPRITE_OAK_AIDE, $2 + 4, $4 + 4, $ff, $d0, $1

	; warp-to
	EVENT_DISP ROUTE_15_GATE_2F_WIDTH, $7, $7 ; ROUTE_15_GATE_1F
