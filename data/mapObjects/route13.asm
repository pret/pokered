Route13Object: ; 0x5482e (size=93)
	db $43 ; border block

	db $0 ; warps

	db $3 ; signs
	db $d, $f, $b ; Route13Text11
	db $5, $21, $c ; Route13Text12
	db $b, $1f, $d ; Route13Text13

	db $a ; people
	db SPRITE_BLACK_HAIR_BOY_1, $a + 4, $31 + 4, $ff, $d3, TRAINER | $1, BIRD_KEEPER + $C8, $1
	db SPRITE_LASS, $a + 4, $30 + 4, $ff, $d0, TRAINER | $2, JR__TRAINER_F + $C8, $c
	db SPRITE_LASS, $9 + 4, $1b + 4, $ff, $d0, TRAINER | $3, JR__TRAINER_F + $C8, $d
	db SPRITE_LASS, $a + 4, $17 + 4, $ff, $d2, TRAINER | $4, JR__TRAINER_F + $C8, $e
	db SPRITE_LASS, $5 + 4, $32 + 4, $ff, $d0, TRAINER | $5, JR__TRAINER_F + $C8, $f
	db SPRITE_BLACK_HAIR_BOY_1, $4 + 4, $c + 4, $ff, $d3, TRAINER | $6, BIRD_KEEPER + $C8, $2
	db SPRITE_FOULARD_WOMAN, $6 + 4, $21 + 4, $ff, $d0, TRAINER | $7, BEAUTY + $C8, $4
	db SPRITE_FOULARD_WOMAN, $6 + 4, $20 + 4, $ff, $d0, TRAINER | $8, BEAUTY + $C8, $5
	db SPRITE_BIKER, $7 + 4, $a + 4, $ff, $d1, TRAINER | $9, BIKER + $C8, $1
	db SPRITE_BLACK_HAIR_BOY_1, $d + 4, $7 + 4, $ff, $d1, TRAINER | $a, BIRD_KEEPER + $C8, $3
