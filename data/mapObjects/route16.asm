Route16Object:
	db $f ; border block

	db $9 ; warps
	warp $11, $a, $0, ROUTE_16_GATE_1F
	warp $11, $b, $1, ROUTE_16_GATE_1F
	warp $18, $a, $2, ROUTE_16_GATE_1F
	warp $18, $b, $3, ROUTE_16_GATE_1F
	warp $11, $4, $4, ROUTE_16_GATE_1F
	warp $11, $5, $5, ROUTE_16_GATE_1F
	warp $18, $4, $6, ROUTE_16_GATE_1F
	warp $18, $5, $7, ROUTE_16_GATE_1F
	warp $7, $5, $0, ROUTE_16_HOUSE

	db $2 ; signs
	sign $1b, $b, $8 ; Route16Text8
	sign $5, $11, $9 ; Route16Text9

	db $7 ; objects
	object SPRITE_BIKER, $11, $c, STAY, LEFT, $1, OPP_BIKER, $5
	object SPRITE_BIKER, $e, $d, STAY, RIGHT, $2, OPP_CUE_BALL, $1
	object SPRITE_BIKER, $b, $c, STAY, UP, $3, OPP_CUE_BALL, $2
	object SPRITE_BIKER, $9, $b, STAY, LEFT, $4, OPP_BIKER, $6
	object SPRITE_BIKER, $6, $a, STAY, RIGHT, $5, OPP_CUE_BALL, $3
	object SPRITE_BIKER, $3, $c, STAY, RIGHT, $6, OPP_BIKER, $7
	object SPRITE_SNORLAX, $1a, $a, STAY, DOWN, $7 ; person

	; warp-to
	warp_to $11, $a, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $11, $b, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $18, $a, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $18, $b, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $11, $4, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $11, $5, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $18, $4, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $18, $5, ROUTE_16_WIDTH ; ROUTE_16_GATE_1F
	warp_to $7, $5, ROUTE_16_WIDTH ; ROUTE_16_HOUSE
