Route3Object: ; 0x54208 (size=77)
	db $2c ; border block

	db $0 ; warps

	db $1 ; signs
	db $9, $3b, $a ; Route3Text10

	db $9 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $b + 4, $39 + 4, $ff, $ff, $1 ; person
	db SPRITE_BUG_CATCHER, $6 + 4, $a + 4, $ff, $d3, TRAINER | $2, BUG_CATCHER + $C8, $4
	db SPRITE_BUG_CATCHER, $4 + 4, $e + 4, $ff, $d0, TRAINER | $3, YOUNGSTER + $C8, $1
	db SPRITE_LASS, $9 + 4, $10 + 4, $ff, $d2, TRAINER | $4, LASS + $C8, $1
	db SPRITE_BUG_CATCHER, $5 + 4, $13 + 4, $ff, $d0, TRAINER | $5, BUG_CATCHER + $C8, $5
	db SPRITE_LASS, $4 + 4, $17 + 4, $ff, $d2, TRAINER | $6, LASS + $C8, $2
	db SPRITE_BUG_CATCHER, $9 + 4, $16 + 4, $ff, $d2, TRAINER | $7, YOUNGSTER + $C8, $2
	db SPRITE_BUG_CATCHER, $6 + 4, $18 + 4, $ff, $d3, TRAINER | $8, BUG_CATCHER + $C8, $6
	db SPRITE_LASS, $a + 4, $21 + 4, $ff, $d1, TRAINER | $9, LASS + $C8, $3
