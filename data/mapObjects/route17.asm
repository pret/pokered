Route17Object: ; 0x54b42 (size=102)
	db $43 ; border block

	db $0 ; warps

	db $6 ; signs
	db $33, $9, $b ; Route17Text11
	db $3f, $9, $c ; Route17Text12
	db $4b, $9, $d ; Route17Text13
	db $57, $9, $e ; Route17Text14
	db $6f, $9, $f ; Route17Text15
	db $8d, $9, $10 ; Route17Text16

	db $a ; people
	db SPRITE_BIKER, $13 + 4, $c + 4, $ff, $d2, TRAINER | $1, CUE_BALL + $C8, $4
	db SPRITE_BIKER, $10 + 4, $b + 4, $ff, $d3, TRAINER | $2, CUE_BALL + $C8, $5
	db SPRITE_BIKER, $12 + 4, $4 + 4, $ff, $d1, TRAINER | $3, BIKER + $C8, $8
	db SPRITE_BIKER, $20 + 4, $7 + 4, $ff, $d2, TRAINER | $4, BIKER + $C8, $9
	db SPRITE_BIKER, $22 + 4, $e + 4, $ff, $d3, TRAINER | $5, BIKER + $C8, $a
	db SPRITE_BIKER, $3a + 4, $11 + 4, $ff, $d2, TRAINER | $6, CUE_BALL + $C8, $6
	db SPRITE_BIKER, $44 + 4, $2 + 4, $ff, $d3, TRAINER | $7, CUE_BALL + $C8, $7
	db SPRITE_BIKER, $62 + 4, $e + 4, $ff, $d3, TRAINER | $8, CUE_BALL + $C8, $8
	db SPRITE_BIKER, $62 + 4, $5 + 4, $ff, $d2, TRAINER | $9, BIKER + $C8, $b
	db SPRITE_BIKER, $76 + 4, $a + 4, $ff, $d0, TRAINER | $a, BIKER + $C8, $c
