SSAnne5Object: ; 0x6172b (size=54)
	db $23 ; border block

	db $2 ; warps
	db $6, $d, $0, SS_ANNE_3
	db $7, $d, $0, SS_ANNE_3

	db $0 ; signs

	db $5 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $2 + 4, $5 + 4, $ff, $d1, $1 ; person
	db SPRITE_SAILOR, $9 + 4, $4 + 4, $ff, $ff, $2 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $b + 4, $7 + 4, $ff, $ff, $3 ; person
	db SPRITE_SAILOR, $4 + 4, $4 + 4, $ff, $d0, TRAINER | $4, SAILOR + $C8, $1
	db SPRITE_SAILOR, $8 + 4, $a + 4, $ff, $d1, TRAINER | $5, SAILOR + $C8, $2

	; warp-to
	EVENT_DISP SS_ANNE_5_WIDTH, $6, $d ; SS_ANNE_3
	EVENT_DISP SS_ANNE_5_WIDTH, $7, $d ; SS_ANNE_3
