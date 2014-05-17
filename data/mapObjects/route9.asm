Route9Object: ; 0x546a8 (size=86)
	db $2c ; border block

	db $0 ; warps

	db $1 ; signs
	db $7, $19, $b ; Route9Text11

	db $a ; people
	db SPRITE_LASS, $a + 4, $d + 4, $ff, $d2, $41, JR__TRAINER_F + $C8, $5 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $18 + 4, $ff, $d2, $42, JR__TRAINER_M + $C8, $7 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $7 + 4, $1f + 4, $ff, $d3, $43, JR__TRAINER_M + $C8, $8 ; trainer
	db SPRITE_LASS, $8 + 4, $30 + 4, $ff, $d3, $44, JR__TRAINER_F + $C8, $6 ; trainer
	db SPRITE_HIKER, $f + 4, $10 + 4, $ff, $d2, $45, HIKER + $C8, $b ; trainer
	db SPRITE_HIKER, $3 + 4, $2b + 4, $ff, $d2, $46, HIKER + $C8, $6 ; trainer
	db SPRITE_BUG_CATCHER, $2 + 4, $16 + 4, $ff, $d0, $47, BUG_CATCHER + $C8, $d ; trainer
	db SPRITE_HIKER, $f + 4, $2d + 4, $ff, $d3, $48, HIKER + $C8, $5 ; trainer
	db SPRITE_BUG_CATCHER, $8 + 4, $28 + 4, $ff, $d3, $49, BUG_CATCHER + $C8, $e ; trainer
	db SPRITE_BALL, $f + 4, $a + 4, $ff, $ff, $8a, TM_30 ; item
