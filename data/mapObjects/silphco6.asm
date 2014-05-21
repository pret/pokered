SilphCo6Object: ; 0x1a2fb (size=112)
	db $2e ; border block

	db $5 ; warps
	db $0, $10, $1, SILPH_CO_7F
	db $0, $e, $0, SILPH_CO_5F
	db $0, $12, $0, SILPH_CO_ELEVATOR
	db $3, $3, $4, SILPH_CO_4F
	db $3, $17, $6, SILPH_CO_2F

	db $0 ; signs

	db $a ; people
	db SPRITE_LAPRAS_GIVER, $6 + 4, $a + 4, $ff, $ff, $1 ; person
	db SPRITE_LAPRAS_GIVER, $6 + 4, $14 + 4, $ff, $ff, $2 ; person
	db SPRITE_ERIKA, $6 + 4, $15 + 4, $ff, $d0, $3 ; person
	db SPRITE_ERIKA, $a + 4, $b + 4, $ff, $d3, $4 ; person
	db SPRITE_LAPRAS_GIVER, $d + 4, $12 + 4, $ff, $d1, $5 ; person
	db SPRITE_ROCKET, $3 + 4, $11 + 4, $ff, $d3, TRAINER | $6, ROCKET + $C8, $1e
	db SPRITE_OAK_AIDE, $8 + 4, $7 + 4, $ff, $d0, TRAINER | $7, SCIENTIST + $C8, $7
	db SPRITE_ROCKET, $f + 4, $e + 4, $ff, $d2, TRAINER | $8, ROCKET + $C8, $1f
	db SPRITE_BALL, $c + 4, $3 + 4, $ff, $ff, ITEM | $9, HP_UP
	db SPRITE_BALL, $f + 4, $2 + 4, $ff, $ff, ITEM | $a, X_ACCURACY

	; warp-to
	EVENT_DISP SILPH_CO_6F_WIDTH, $0, $10 ; SILPH_CO_7F
	EVENT_DISP SILPH_CO_6F_WIDTH, $0, $e ; SILPH_CO_5F
	EVENT_DISP SILPH_CO_6F_WIDTH, $0, $12 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_6F_WIDTH, $3, $3 ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_6F_WIDTH, $3, $17 ; SILPH_CO_2F
