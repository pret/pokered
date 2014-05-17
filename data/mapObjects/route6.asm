Route6Object: ; 0x58022 (size=87)
	db $f ; border block

	db $4 ; warps
	db $1, $9, $2, ROUTE_6_GATE
	db $1, $a, $2, ROUTE_6_GATE
	db $7, $a, $0, ROUTE_6_GATE
	db $d, $11, $0, PATH_ENTRANCE_ROUTE_6

	db $1 ; signs
	db $f, $13, $7 ; Route6Text7

	db $6 ; people
	db SPRITE_BLACK_HAIR_BOY_1, $15 + 4, $a + 4, $ff, $d3, $41, JR__TRAINER_M + $C8, $4 ; trainer
	db SPRITE_LASS, $15 + 4, $b + 4, $ff, $d2, $42, JR__TRAINER_F + $C8, $2 ; trainer
	db SPRITE_BUG_CATCHER, $f + 4, $0 + 4, $ff, $d3, $43, BUG_CATCHER + $C8, $a ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $1f + 4, $b + 4, $ff, $d2, $44, JR__TRAINER_M + $C8, $5 ; trainer
	db SPRITE_LASS, $1e + 4, $b + 4, $ff, $d2, $45, JR__TRAINER_F + $C8, $3 ; trainer
	db SPRITE_BUG_CATCHER, $1a + 4, $13 + 4, $ff, $d2, $46, BUG_CATCHER + $C8, $b ; trainer

	; warp-to
	EVENT_DISP ROUTE_6_WIDTH, $1, $9 ; ROUTE_6_GATE
	EVENT_DISP ROUTE_6_WIDTH, $1, $a ; ROUTE_6_GATE
	EVENT_DISP ROUTE_6_WIDTH, $7, $a ; ROUTE_6_GATE
	EVENT_DISP ROUTE_6_WIDTH, $d, $11 ; PATH_ENTRANCE_ROUTE_6
