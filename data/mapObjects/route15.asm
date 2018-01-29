Route15Object:
	db $43 ; border block

	db $4 ; warps
	warp $7, $8, $0, ROUTE_15_GATE_1F
	warp $7, $9, $1, ROUTE_15_GATE_1F
	warp $e, $8, $2, ROUTE_15_GATE_1F
	warp $e, $9, $3, ROUTE_15_GATE_1F

	db $1 ; signs
	sign $27, $9, $c ; Route15Text12

	db $b ; objects
	object SPRITE_LASS, $29, $b, STAY, DOWN, $1, OPP_JR_TRAINER_F, $14
	object SPRITE_LASS, $35, $a, STAY, LEFT, $2, OPP_JR_TRAINER_F, $15
	object SPRITE_BLACK_HAIR_BOY_1, $1f, $d, STAY, UP, $3, OPP_BIRD_KEEPER, $6
	object SPRITE_BLACK_HAIR_BOY_1, $23, $d, STAY, UP, $4, OPP_BIRD_KEEPER, $7
	object SPRITE_FOULARD_WOMAN, $35, $b, STAY, DOWN, $5, OPP_BEAUTY, $9
	object SPRITE_FOULARD_WOMAN, $29, $a, STAY, RIGHT, $6, OPP_BEAUTY, $a
	object SPRITE_BIKER, $30, $a, STAY, DOWN, $7, OPP_BIKER, $3
	object SPRITE_BIKER, $2e, $a, STAY, DOWN, $8, OPP_BIKER, $4
	object SPRITE_LASS, $25, $5, STAY, RIGHT, $9, OPP_JR_TRAINER_F, $16
	object SPRITE_LASS, $12, $d, STAY, UP, $a, OPP_JR_TRAINER_F, $17
	object SPRITE_BALL, $12, $5, STAY, NONE, $b, TM_20

	; warp-to
	warp_to $7, $8, ROUTE_15_WIDTH ; ROUTE_15_GATE_1F
	warp_to $7, $9, ROUTE_15_WIDTH ; ROUTE_15_GATE_1F
	warp_to $e, $8, ROUTE_15_WIDTH ; ROUTE_15_GATE_1F
	warp_to $e, $9, ROUTE_15_WIDTH ; ROUTE_15_GATE_1F
