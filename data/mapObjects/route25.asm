Route25Object: ; 0x507b2 (size=94)
	db $2c ; border block

	db $1 ; warps
	db $3, $2d, $0, BILLS_HOUSE

	db $1 ; signs
	db $3, $2b, $b ; Route25Text11

	db $a ; objects
	object SPRITE_BUG_CATCHER, $e, $2, FACE, DOWN, $1, YOUNGSTER + $C8, $5
	object SPRITE_BUG_CATCHER, $12, $5, FACE, UP, $2, YOUNGSTER + $C8, $6
	object SPRITE_BLACK_HAIR_BOY_1, $18, $4, FACE, DOWN, $3, JR__TRAINER_M + $C8, $2
	object SPRITE_LASS, $12, $8, FACE, LEFT, $4, LASS + $C8, $9
	object SPRITE_BUG_CATCHER, $20, $3, FACE, RIGHT, $5, YOUNGSTER + $C8, $7
	object SPRITE_LASS, $25, $4, FACE, DOWN, $6, LASS + $C8, $a
	object SPRITE_HIKER, $8, $4, FACE, LEFT, $7, HIKER + $C8, $2
	object SPRITE_HIKER, $17, $9, FACE, UP, $8, HIKER + $C8, $3
	object SPRITE_HIKER, $d, $7, FACE, LEFT, $9, HIKER + $C8, $4
	object SPRITE_BALL, $16, $2, FACE, STAY, $a, TM_19

	; warp-to
	EVENT_DISP ROUTE_25_WIDTH, $3, $2d ; BILLS_HOUSE
