SilphCo9Object: ; 0x5d93f (size=74)
	db $2e ; border block

	db $5 ; warps
	db $0, $e, $0, SILPH_CO_10F
	db $0, $10, $0, SILPH_CO_8F
	db $0, $12, $0, SILPH_CO_ELEVATOR
	db $3, $9, $7, SILPH_CO_3F
	db $f, $11, $4, SILPH_CO_5F

	db $0 ; signs

	db $4 ; people
	db SPRITE_NURSE, $e + 4, $3 + 4, $ff, $d0, $1 ; person
	db SPRITE_ROCKET, $4 + 4, $2 + 4, $ff, $d1, $42, ROCKET + $C8, $25 ; trainer
	db SPRITE_OAK_AIDE, $d + 4, $15 + 4, $ff, $d0, $43, SCIENTIST + $C8, $a ; trainer
	db SPRITE_ROCKET, $10 + 4, $d + 4, $ff, $d1, $44, ROCKET + $C8, $26 ; trainer

	; warp-to
	EVENT_DISP SILPH_CO_9F_WIDTH, $0, $e ; SILPH_CO_10F
	EVENT_DISP SILPH_CO_9F_WIDTH, $0, $10 ; SILPH_CO_8F
	EVENT_DISP SILPH_CO_9F_WIDTH, $0, $12 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_9F_WIDTH, $3, $9 ; SILPH_CO_3F
	EVENT_DISP SILPH_CO_9F_WIDTH, $f, $11 ; SILPH_CO_5F
