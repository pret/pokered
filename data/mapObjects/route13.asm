Route13Object: ; 0x5482e (size=93)
	db $43 ; border block

	db $0 ; warps

	db $3 ; signs
	db $d, $f, $b ; Route13Text11
	db $5, $21, $c ; Route13Text12
	db $b, $1f, $d ; Route13Text13

	db $a ; people
	db SPRITE_BLACK_HAIR_BOY_1, $a + 4, $31 + 4, $ff, $d3, $41, BIRD_KEEPER + $C8, $1 ; trainer
	db SPRITE_LASS, $a + 4, $30 + 4, $ff, $d0, $42, JR__TRAINER_F + $C8, $c ; trainer
	db SPRITE_LASS, $9 + 4, $1b + 4, $ff, $d0, $43, JR__TRAINER_F + $C8, $d ; trainer
	db SPRITE_LASS, $a + 4, $17 + 4, $ff, $d2, $44, JR__TRAINER_F + $C8, $e ; trainer
	db SPRITE_LASS, $5 + 4, $32 + 4, $ff, $d0, $45, JR__TRAINER_F + $C8, $f ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $4 + 4, $c + 4, $ff, $d3, $46, BIRD_KEEPER + $C8, $2 ; trainer
	db SPRITE_FOULARD_WOMAN, $6 + 4, $21 + 4, $ff, $d0, $47, BEAUTY + $C8, $4 ; trainer
	db SPRITE_FOULARD_WOMAN, $6 + 4, $20 + 4, $ff, $d0, $48, BEAUTY + $C8, $5 ; trainer
	db SPRITE_BIKER, $7 + 4, $a + 4, $ff, $d1, $49, BIKER + $C8, $1 ; trainer
	db SPRITE_BLACK_HAIR_BOY_1, $d + 4, $7 + 4, $ff, $d1, $4a, BIRD_KEEPER + $C8, $3 ; trainer
