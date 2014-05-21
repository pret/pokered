Route12Object: ; 0x5869a (size=118)
	db $43 ; border block

	db $4 ; warps
	db $f, $a, $0, ROUTE_12_GATE_1F
	db $f, $b, $1, ROUTE_12_GATE_1F
	db $15, $a, $2, ROUTE_12_GATE_1F
	db $4d, $b, $0, ROUTE_12_HOUSE

	db $2 ; signs
	db $d, $d, $b ; Route12Text11
	db $3f, $b, $c ; Route12Text12

	db $a ; people
	db SPRITE_SNORLAX, $3e + 4, $a + 4, $ff, $d0, $1 ; person
	db SPRITE_FISHER2, $1f + 4, $e + 4, $ff, $d2, TRAINER | $2, FISHER + $C8, $3
	db SPRITE_FISHER2, $27 + 4, $5 + 4, $ff, $d1, TRAINER | $3, FISHER + $C8, $4
	db SPRITE_BLACK_HAIR_BOY_1, $5c + 4, $b + 4, $ff, $d2, TRAINER | $4, JR__TRAINER_M + $C8, $9
	db SPRITE_BLACK_HAIR_BOY_2, $4c + 4, $e + 4, $ff, $d1, TRAINER | $5, ROCKER + $C8, $2
	db SPRITE_FISHER2, $28 + 4, $c + 4, $ff, $d2, TRAINER | $6, FISHER + $C8, $5
	db SPRITE_FISHER2, $34 + 4, $9 + 4, $ff, $d3, TRAINER | $7, FISHER + $C8, $6
	db SPRITE_FISHER2, $57 + 4, $6 + 4, $ff, $d0, TRAINER | $8, FISHER + $C8, $b
	db SPRITE_BALL, $23 + 4, $e + 4, $ff, $ff, ITEM | $9, TM_16
	db SPRITE_BALL, $59 + 4, $5 + 4, $ff, $ff, ITEM | $a, IRON

	; warp-to
	EVENT_DISP ROUTE_12_WIDTH, $f, $a ; ROUTE_12_GATE_1F
	EVENT_DISP ROUTE_12_WIDTH, $f, $b ; ROUTE_12_GATE_1F
	EVENT_DISP ROUTE_12_WIDTH, $15, $a ; ROUTE_12_GATE_1F
	EVENT_DISP ROUTE_12_WIDTH, $4d, $b ; ROUTE_12_HOUSE
