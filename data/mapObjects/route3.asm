Route3Object: ; 0x54208 (size=77)
	db $2c ; border block

	db $0 ; warps

	db $1 ; signs
	db $9, $3b, $a ; Route3Text10

	db $9 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $b + 4, $39 + 4, $ff, $ff, $1 ; person
	db SPRITE_BUG_CATCHER, $6 + 4, $a + 4, $ff, $d3, $42, BUG_CATCHER + $C8, $4 ; trainer
	db SPRITE_BUG_CATCHER, $4 + 4, $e + 4, $ff, $d0, $43, YOUNGSTER + $C8, $1 ; trainer
	db SPRITE_LASS, $9 + 4, $10 + 4, $ff, $d2, $44, LASS + $C8, $1 ; trainer
	db SPRITE_BUG_CATCHER, $5 + 4, $13 + 4, $ff, $d0, $45, BUG_CATCHER + $C8, $5 ; trainer
	db SPRITE_LASS, $4 + 4, $17 + 4, $ff, $d2, $46, LASS + $C8, $2 ; trainer
	db SPRITE_BUG_CATCHER, $9 + 4, $16 + 4, $ff, $d2, $47, YOUNGSTER + $C8, $2 ; trainer
	db SPRITE_BUG_CATCHER, $6 + 4, $18 + 4, $ff, $d3, $48, BUG_CATCHER + $C8, $6 ; trainer
	db SPRITE_LASS, $a + 4, $21 + 4, $ff, $d1, $49, LASS + $C8, $3 ; trainer
