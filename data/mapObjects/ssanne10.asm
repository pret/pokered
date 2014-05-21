SSAnne10Object: ; 0x61e75 (size=165)
	db $c ; border block

	db $a ; warps
	db $5, $2, $4, SS_ANNE_4
	db $5, $3, $4, SS_ANNE_4
	db $5, $c, $3, SS_ANNE_4
	db $5, $d, $3, SS_ANNE_4
	db $5, $16, $2, SS_ANNE_4
	db $5, $17, $2, SS_ANNE_4
	db $f, $2, $1, SS_ANNE_4
	db $f, $3, $1, SS_ANNE_4
	db $f, $c, $0, SS_ANNE_4
	db $f, $d, $0, SS_ANNE_4

	db $0 ; signs

	db $b ; people
	db SPRITE_SAILOR, $d + 4, $0 + 4, $ff, $d0, TRAINER | $1, SAILOR + $C8, $3
	db SPRITE_SAILOR, $b + 4, $2 + 4, $ff, $d0, TRAINER | $2, SAILOR + $C8, $4
	db SPRITE_SAILOR, $3 + 4, $c + 4, $ff, $d2, TRAINER | $3, SAILOR + $C8, $5
	db SPRITE_SAILOR, $2 + 4, $16 + 4, $ff, $d0, TRAINER | $4, SAILOR + $C8, $6
	db SPRITE_SAILOR, $2 + 4, $0 + 4, $ff, $d3, TRAINER | $5, SAILOR + $C8, $7
	db SPRITE_FISHER2, $4 + 4, $0 + 4, $ff, $d3, TRAINER | $6, FISHER + $C8, $2
	db SPRITE_BLACK_HAIR_BOY_2, $d + 4, $a + 4, $ff, $d3, $7 ; person
	db SPRITE_SLOWBRO, $c + 4, $b + 4, $ff, $ff, $8 ; person
	db SPRITE_BALL, $2 + 4, $14 + 4, $ff, $ff, ITEM | $9, ETHER
	db SPRITE_BALL, $2 + 4, $a + 4, $ff, $ff, ITEM | $a, TM_44
	db SPRITE_BALL, $b + 4, $c + 4, $ff, $ff, ITEM | $b, MAX_POTION

	; warp-to
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $2 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $3 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $c ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $d ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $16 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $5, $17 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $2 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $3 ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $c ; SS_ANNE_4
	EVENT_DISP SS_ANNE_10_WIDTH, $f, $d ; SS_ANNE_4
