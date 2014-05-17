SilphCo7Object: ; 0x51ed7 (size=128)
	db $2e ; border block

	db $6 ; warps
	db $0, $10, $1, SILPH_CO_8F
	db $0, $16, $0, SILPH_CO_6F
	db $0, $12, $0, SILPH_CO_ELEVATOR
	db $7, $5, $3, SILPH_CO_11F
	db $3, $5, $8, SILPH_CO_3F
	db $f, $15, $3, SILPH_CO_5F

	db $0 ; signs

	db $b ; people
	db SPRITE_LAPRAS_GIVER, $5 + 4, $1 + 4, $ff, $ff, $1 ; person
	db SPRITE_LAPRAS_GIVER, $d + 4, $d + 4, $ff, $d1, $2 ; person
	db SPRITE_LAPRAS_GIVER, $a + 4, $7 + 4, $ff, $ff, $3 ; person
	db SPRITE_ERIKA, $8 + 4, $a + 4, $ff, $ff, $4 ; person
	db SPRITE_ROCKET, $1 + 4, $d + 4, $ff, $d0, $45, ROCKET + $C8, $20 ; trainer
	db SPRITE_OAK_AIDE, $d + 4, $2 + 4, $ff, $d0, $46, SCIENTIST + $C8, $8 ; trainer
	db SPRITE_ROCKET, $2 + 4, $14 + 4, $ff, $d2, $47, ROCKET + $C8, $21 ; trainer
	db SPRITE_ROCKET, $e + 4, $13 + 4, $ff, $d3, $48, ROCKET + $C8, $22 ; trainer
	db SPRITE_BLUE, $7 + 4, $3 + 4, $ff, $d1, $9 ; person
	db SPRITE_BALL, $9 + 4, $1 + 4, $ff, $ff, $8a, CALCIUM ; item
	db SPRITE_BALL, $b + 4, $18 + 4, $ff, $ff, $8b, TM_03 ; item

	; warp-to
	EVENT_DISP SILPH_CO_7F_WIDTH, $0, $10 ; SILPH_CO_8F
	EVENT_DISP SILPH_CO_7F_WIDTH, $0, $16 ; SILPH_CO_6F
	EVENT_DISP SILPH_CO_7F_WIDTH, $0, $12 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_7F_WIDTH, $7, $5 ; SILPH_CO_11F
	EVENT_DISP SILPH_CO_7F_WIDTH, $3, $5 ; SILPH_CO_3F
	EVENT_DISP SILPH_CO_7F_WIDTH, $f, $15 ; SILPH_CO_5F
