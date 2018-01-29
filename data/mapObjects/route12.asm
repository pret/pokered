Route12Object:
	db $43 ; border block

	db $4 ; warps
	warp $a, $f, $0, ROUTE_12_GATE_1F
	warp $b, $f, $1, ROUTE_12_GATE_1F
	warp $a, $15, $2, ROUTE_12_GATE_1F
	warp $b, $4d, $0, ROUTE_12_HOUSE

	db $2 ; signs
	sign $d, $d, $b ; Route12Text11
	sign $b, $3f, $c ; Route12Text12

	db $a ; objects
	object SPRITE_SNORLAX, $a, $3e, STAY, DOWN, $1 ; person
	object SPRITE_FISHER2, $e, $1f, STAY, LEFT, $2, OPP_FISHER, $3
	object SPRITE_FISHER2, $5, $27, STAY, UP, $3, OPP_FISHER, $4
	object SPRITE_BLACK_HAIR_BOY_1, $b, $5c, STAY, LEFT, $4, OPP_JR_TRAINER_M, $9
	object SPRITE_BLACK_HAIR_BOY_2, $e, $4c, STAY, UP, $5, OPP_ROCKER, $2
	object SPRITE_FISHER2, $c, $28, STAY, LEFT, $6, OPP_FISHER, $5
	object SPRITE_FISHER2, $9, $34, STAY, RIGHT, $7, OPP_FISHER, $6
	object SPRITE_FISHER2, $6, $57, STAY, DOWN, $8, OPP_FISHER, $b
	object SPRITE_BALL, $e, $23, STAY, NONE, $9, TM_16
	object SPRITE_BALL, $5, $59, STAY, NONE, $a, IRON

	; warp-to
	warp_to $a, $f, ROUTE_12_WIDTH ; ROUTE_12_GATE_1F
	warp_to $b, $f, ROUTE_12_WIDTH ; ROUTE_12_GATE_1F
	warp_to $a, $15, ROUTE_12_WIDTH ; ROUTE_12_GATE_1F
	warp_to $b, $4d, ROUTE_12_WIDTH ; ROUTE_12_HOUSE
