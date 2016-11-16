Route16GateUpstairsObject:
	db $a ; border block

	db $1 ; warps
	db $7, $7, $8, ROUTE_16_GATE_1F

	db $2 ; signs
	db $2, $1, $3 ; Route16GateUpstairsText3
	db $2, $6, $4 ; Route16GateUpstairsText4

	db $2 ; objects
	object SPRITE_YOUNG_BOY, $4, $2, STAY, NONE, $1 ; person
	object SPRITE_LITTLE_GIRL, $2, $5, WALK, $2, $2 ; person

	; warp-to
	EVENT_DISP ROUTE_16_GATE_2F_WIDTH, $7, $7 ; ROUTE_16_GATE_1F
