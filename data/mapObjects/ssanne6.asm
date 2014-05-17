SSAnne6Object: ; 0x6181b (size=54)
	db $c ; border block

	db $1 ; warps
	db $0, $6, $a, SS_ANNE_1

	db $0 ; signs

	db $7 ; people
	db SPRITE_COOK, $8 + 4, $1 + 4, $fe, $1, $1 ; person
	db SPRITE_COOK, $8 + 4, $5 + 4, $fe, $1, $2 ; person
	db SPRITE_COOK, $7 + 4, $9 + 4, $fe, $1, $3 ; person
	db SPRITE_COOK, $6 + 4, $d + 4, $ff, $ff, $4 ; person
	db SPRITE_COOK, $8 + 4, $d + 4, $ff, $ff, $5 ; person
	db SPRITE_COOK, $a + 4, $d + 4, $ff, $ff, $6 ; person
	db SPRITE_COOK, $d + 4, $b + 4, $ff, $d1, $7 ; person

	; warp-to
	EVENT_DISP SS_ANNE_6_WIDTH, $0, $6 ; SS_ANNE_1
