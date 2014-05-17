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
	db SPRITE_BIKER, $13 + 4, $c + 4, $ff, $d2, $41, CUE_BALL + $C8, $4 ; trainer
	db SPRITE_BIKER, $10 + 4, $b + 4, $ff, $d3, $42, CUE_BALL + $C8, $5 ; trainer
	db SPRITE_BIKER, $12 + 4, $4 + 4, $ff, $d1, $43, BIKER + $C8, $8 ; trainer
	db SPRITE_BIKER, $20 + 4, $7 + 4, $ff, $d2, $44, BIKER + $C8, $9 ; trainer
	db SPRITE_BIKER, $22 + 4, $e + 4, $ff, $d3, $45, BIKER + $C8, $a ; trainer
	db SPRITE_BIKER, $3a + 4, $11 + 4, $ff, $d2, $46, CUE_BALL + $C8, $6 ; trainer
	db SPRITE_BIKER, $44 + 4, $2 + 4, $ff, $d3, $47, CUE_BALL + $C8, $7 ; trainer
	db SPRITE_BIKER, $62 + 4, $e + 4, $ff, $d3, $48, CUE_BALL + $C8, $8 ; trainer
	db SPRITE_BIKER, $62 + 4, $5 + 4, $ff, $d2, $49, BIKER + $C8, $b ; trainer
	db SPRITE_BIKER, $76 + 4, $a + 4, $ff, $d0, $4a, BIKER + $C8, $c ; trainer
