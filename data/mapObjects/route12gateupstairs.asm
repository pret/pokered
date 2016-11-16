Route12GateUpstairsObject:
	db $a ; border block

	db $1 ; warps
	db $7, $7, $4, ROUTE_12_GATE_1F

	db $2 ; signs
	db $2, $1, $2 ; Route12GateUpstairsText2
	db $2, $6, $3 ; Route12GateUpstairsText3

	db $1 ; objects
	object SPRITE_BRUNETTE_GIRL, $3, $4, WALK, $1, $1 ; person

	; warp-to
	EVENT_DISP ROUTE_12_GATE_2F_WIDTH, $7, $7 ; ROUTE_12_GATE_1F
