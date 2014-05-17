Route15Object: ; 0x5894e (size=126)
	db $43 ; border block

	db $4 ; warps
	db $8, $7, $0, ROUTE_15_GATE_1F
	db $9, $7, $1, ROUTE_15_GATE_1F
	db $8, $e, $2, ROUTE_15_GATE_1F
	db $9, $e, $3, ROUTE_15_GATE_1F

	db $1 ; signs
	db $9, $27, $c ; Route15Text12

	db $b ; people
	db SPRITE_LASS, $b + 4, $29 + 4, $ff, $d0, $41, JR__TRAINER_F + $C8, $14 ; trainer
	db SPRITE_LASS, $a + 4, $35 + 4, $ff, $d2, $42, JR__TRAINER_F + $C8, $15 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $d + 4, $1f + 4, $ff, $d1, $43, BIRD_KEEPER + $C8, $6 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $d + 4, $23 + 4, $ff, $d1, $44, BIRD_KEEPER + $C8, $7 ; trainer
	db SPRITE_FOULARD_WOMAN, $b + 4, $35 + 4, $ff, $d0, $45, BEAUTY + $C8, $9 ; trainer
	db SPRITE_FOULARD_WOMAN, $a + 4, $29 + 4, $ff, $d3, $46, BEAUTY + $C8, $a ; trainer
	db SPRITE_BIKER, $a + 4, $30 + 4, $ff, $d0, $47, BIKER + $C8, $3 ; trainer
	db SPRITE_BIKER, $a + 4, $2e + 4, $ff, $d0, $48, BIKER + $C8, $4 ; trainer
	db SPRITE_LASS, $5 + 4, $25 + 4, $ff, $d3, $49, JR__TRAINER_F + $C8, $16 ; trainer
	db SPRITE_LASS, $d + 4, $12 + 4, $ff, $d1, $4a, JR__TRAINER_F + $C8, $17 ; trainer
	db SPRITE_BALL, $5 + 4, $12 + 4, $ff, $ff, $8b, TM_20 ; item

	; warp-to
	EVENT_DISP ROUTE_15_WIDTH, $8, $7 ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $9, $7 ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $8, $e ; ROUTE_15_GATE_1F
	EVENT_DISP ROUTE_15_WIDTH, $9, $e ; ROUTE_15_GATE_1F
