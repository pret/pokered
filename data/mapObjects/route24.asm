Route24Object: ; 0x506a4 (size=67)
	db $2c ; border block

	db $0 ; warps

	db $0 ; signs

	db $8 ; people
	db SPRITE_BLACK_HAIR_BOY_1, $f + 4, $b + 4, $ff, $d2, $41, ROCKET + $C8, $6 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $14 + 4, $5 + 4, $ff, $d1, $42, JR__TRAINER_M + $C8, $2 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $13 + 4, $b + 4, $ff, $d2, $43, JR__TRAINER_M + $C8, $3 ; trainer
	db SPRITE_LASS, $16 + 4, $a + 4, $ff, $d3, $44, LASS + $C8, $7 ; trainer
	db SPRITE_BUG_CATCHER, $19 + 4, $b + 4, $ff, $d2, $45, YOUNGSTER + $C8, $4 ; trainer
	db SPRITE_LASS, $1c + 4, $a + 4, $ff, $d3, $46, LASS + $C8, $8 ; trainer
	db SPRITE_BUG_CATCHER, $1f + 4, $b + 4, $ff, $d2, $47, BUG_CATCHER + $C8, $9 ; trainer
	db SPRITE_BALL, $5 + 4, $a + 4, $ff, $ff, $88, TM_45 ; item
