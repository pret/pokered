Route25Object: ; 0x507b2 (size=94)
	db $2c ; border block

	db $1 ; warps
	db $3, $2d, $0, BILLS_HOUSE

	db $1 ; signs
	db $3, $2b, $b ; Route25Text11

	db $a ; people
	db SPRITE_BUG_CATCHER, $2 + 4, $e + 4, $ff, $d0, TRAINER | $1, YOUNGSTER + $C8, $5
	db SPRITE_BUG_CATCHER, $5 + 4, $12 + 4, $ff, $d1, TRAINER | $2, YOUNGSTER + $C8, $6
	db SPRITE_BLACK_HAIR_BOY_1, $4 + 4, $18 + 4, $ff, $d0, TRAINER | $3, JR__TRAINER_M + $C8, $2
	db SPRITE_LASS, $8 + 4, $12 + 4, $ff, $d3, TRAINER | $4, LASS + $C8, $9
	db SPRITE_BUG_CATCHER, $3 + 4, $20 + 4, $ff, $d2, TRAINER | $5, YOUNGSTER + $C8, $7
	db SPRITE_LASS, $4 + 4, $25 + 4, $ff, $d0, TRAINER | $6, LASS + $C8, $a
	db SPRITE_HIKER, $4 + 4, $8 + 4, $ff, $d3, TRAINER | $7, HIKER + $C8, $2
	db SPRITE_HIKER, $9 + 4, $17 + 4, $ff, $d1, TRAINER | $8, HIKER + $C8, $3
	db SPRITE_HIKER, $7 + 4, $d + 4, $ff, $d3, TRAINER | $9, HIKER + $C8, $4
	db SPRITE_BALL, $2 + 4, $16 + 4, $ff, $ff, ITEM | $a, TM_19

	; warp-to
	EVENT_DISP ROUTE_25_WIDTH, $3, $2d ; BILLS_HOUSE
