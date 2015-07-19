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
	object SPRITE_LASS, $29, $b, FACE, DOWN, $1, JR__TRAINER_F + $C8, $14
	object SPRITE_LASS, $35, $a, FACE, RIGHT, $2, JR__TRAINER_F + $C8, $15
	object SPRITE_BLACK_HAIR_BOY_1, $1f, $d, FACE, UP, $3, BIRD_KEEPER + $C8, $6
	object SPRITE_BLACK_HAIR_BOY_1, $23, $d, FACE, UP, $4, BIRD_KEEPER + $C8, $7
	object SPRITE_FOULARD_WOMAN, $35, $b, FACE, DOWN, $5, BEAUTY + $C8, $9
	object SPRITE_FOULARD_WOMAN, $29, $a, FACE, LEFT, $6, BEAUTY + $C8, $a
	object SPRITE_BIKER, $30, $a, FACE, DOWN, $7, BIKER + $C8, $3
	object SPRITE_BIKER, $2e, $a, FACE, DOWN, $8, BIKER + $C8, $4
	object SPRITE_LASS, $25, $5, FACE, LEFT, $9, JR__TRAINER_F + $C8, $16
	object SPRITE_LASS, $12, $d, FACE, UP, $a, JR__TRAINER_F + $C8, $17
	object SPRITE_BALL, $12, $5, FACE, STAY, $b, TM_20

	; warp-to
	EVENT_DISP ROUTE_15_WIDTH, $8, $7 ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $9, $7 ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $8, $e ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $9, $e ; ROUTE_15_GATE_1F
