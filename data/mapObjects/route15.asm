Route15Object: ; 0x5894e (size=126)
	db $43 ; border block

	db $4 ; warps
	db $8, $7, $0, ROUTE_15_GATE_1F
	db $9, $7, $1, ROUTE_15_GATE_1F
	db $8, $e, $2, ROUTE_15_GATE_1F
	db $9, $e, $3, ROUTE_15_GATE_1F

	db $1 ; signs
	db $9, $27, $c ; Route15Text12

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
	EVENT_DISP ROUTE_15_WIDTH, $8, $7 ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $9, $7 ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $8, $e ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $9, $e ; ROUTE_15_GATE_1F
