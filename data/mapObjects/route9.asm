Route9Object: ; 0x546a8 (size=86)
	db $2c ; border block

	db $0 ; warps

	db $1 ; signs
	db $7, $19, $b ; Route9Text11

	db $a ; people
	db SPRITE_LASS, $a + 4, $d + 4, $ff, $d2, TRAINER | $1, JR__TRAINER_F + $C8, $5
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $18 + 4, $ff, $d2, TRAINER | $2, JR__TRAINER_M + $C8, $7
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $1f + 4, $ff, $d3, TRAINER | $3, JR__TRAINER_M + $C8, $8
	db SPRITE_LASS, $8 + 4, $30 + 4, $ff, $d3, TRAINER | $4, JR__TRAINER_F + $C8, $6
	db SPRITE_HIKER, $f + 4, $10 + 4, $ff, $d2, TRAINER | $5, HIKER + $C8, $b
	db SPRITE_HIKER, $3 + 4, $2b + 4, $ff, $d2, TRAINER | $6, HIKER + $C8, $6
	db SPRITE_BUG_CATCHER, $2 + 4, $16 + 4, $ff, $d0, TRAINER | $7, BUG_CATCHER + $C8, $d
	db SPRITE_HIKER, $f + 4, $2d + 4, $ff, $d3, TRAINER | $8, HIKER + $C8, $5
	db SPRITE_BUG_CATCHER, $8 + 4, $28 + 4, $ff, $d3, TRAINER | $9, BUG_CATCHER + $C8, $e
	db SPRITE_BALL, $f + 4, $a + 4, $ff, $ff, ITEM | $a, TM_30
