Route18Object:
	db $43 ; border block

	db $4 ; warps
	warp $21, $8, $0, ROUTE_18_GATE_1F
	warp $21, $9, $1, ROUTE_18_GATE_1F
	warp $28, $8, $2, ROUTE_18_GATE_1F
	warp $28, $9, $3, ROUTE_18_GATE_1F

	db $2 ; signs
	sign $2b, $7, $4 ; Route18Text4
	sign $21, $5, $5 ; Route18Text5

	db $3 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, $24, $b, STAY, RIGHT, $1, OPP_BIRD_KEEPER, $8
	object SPRITE_BLACK_HAIR_BOY_1, $28, $f, STAY, LEFT, $2, OPP_BIRD_KEEPER, $9
	object SPRITE_BLACK_HAIR_BOY_1, $2a, $d, STAY, LEFT, $3, OPP_BIRD_KEEPER, $a

	; warp-to
	warp_to $21, $8, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to $21, $9, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to $28, $8, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to $28, $9, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
