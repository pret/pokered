Route18Object: ; 0x58c5a (size=66)
	db $43 ; border block

	db $4 ; warps
	db $8, $21, $0, ROUTE_18_GATE_1F
	db $9, $21, $1, ROUTE_18_GATE_1F
	db $8, $28, $2, ROUTE_18_GATE_1F
	db $9, $28, $3, ROUTE_18_GATE_1F

	db $2 ; signs
	db $7, $2b, $4 ; Route18Text4
	db $5, $21, $5 ; Route18Text5

	db $3 ; people
	db SPRITE_BLACK_HAIR_BOY_1, $b + 4, $24 + 4, $ff, $d3, TRAINER | $1, BIRD_KEEPER + $C8, $8
	db SPRITE_BLACK_HAIR_BOY_1, $f + 4, $28 + 4, $ff, $d2, TRAINER | $2, BIRD_KEEPER + $C8, $9
	db SPRITE_BLACK_HAIR_BOY_1, $d + 4, $2a + 4, $ff, $d2, TRAINER | $3, BIRD_KEEPER + $C8, $a

	; warp-to
	EVENT_DISP ROUTE_18_WIDTH, $8, $21 ; ROUTE_18_GATE_1F
	EVENT_DISP ROUTE_18_WIDTH, $9, $21 ; ROUTE_18_GATE_1F
	EVENT_DISP ROUTE_18_WIDTH, $8, $28 ; ROUTE_18_GATE_1F
	EVENT_DISP ROUTE_18_WIDTH, $9, $28 ; ROUTE_18_GATE_1F
