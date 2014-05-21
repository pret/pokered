SilphCo10Object: ; 0x5a1fb (size=95)
	db $2e ; border block

	db $6 ; warps
	db $0, $8, $0, SILPH_CO_9F
	db $0, $a, $0, SILPH_CO_11F
	db $0, $c, $0, SILPH_CO_ELEVATOR
	db $b, $9, $3, SILPH_CO_4F
	db $f, $d, $5, SILPH_CO_4F
	db $7, $d, $6, SILPH_CO_4F

	db $0 ; signs

	db $6 ; people
	db SPRITE_ROCKET, $9 + 4, $1 + 4, $ff, $d3, TRAINER | $1, ROCKET + $C8, $27
	db SPRITE_OAK_AIDE, $2 + 4, $a + 4, $ff, $d2, TRAINER | $2, SCIENTIST + $C8, $b
	db SPRITE_ERIKA, $f + 4, $9 + 4, $fe, $0, $3 ; person
	db SPRITE_BALL, $c + 4, $2 + 4, $ff, $ff, ITEM | $4, TM_26
	db SPRITE_BALL, $e + 4, $4 + 4, $ff, $ff, ITEM | $5, RARE_CANDY
	db SPRITE_BALL, $b + 4, $5 + 4, $ff, $ff, ITEM | $6, CARBOS

	; warp-to
	EVENT_DISP SILPH_CO_10F_WIDTH, $0, $8 ; SILPH_CO_9F
	EVENT_DISP SILPH_CO_10F_WIDTH, $0, $a ; SILPH_CO_11F
	EVENT_DISP SILPH_CO_10F_WIDTH, $0, $c ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_10F_WIDTH, $b, $9 ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_10F_WIDTH, $f, $d ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_10F_WIDTH, $7, $d ; SILPH_CO_4F
