SilphCo5Object: ; 0x1a08d (size=137)
	db $2e ; border block

	db $7 ; warps
	db $0, $18, $1, SILPH_CO_6F
	db $0, $1a, $1, SILPH_CO_4F
	db $0, $14, $0, SILPH_CO_ELEVATOR
	db $3, $1b, $5, SILPH_CO_7F
	db $f, $9, $4, SILPH_CO_9F
	db $5, $b, $4, SILPH_CO_3F
	db $f, $3, $5, SILPH_CO_3F

	db $0 ; signs

	db $b ; people
	db SPRITE_LAPRAS_GIVER, $9 + 4, $d + 4, $ff, $ff, $1 ; person
	db SPRITE_ROCKET, $10 + 4, $8 + 4, $ff, $d3, $42, ROCKET + $C8, $1c ; trainer
	db SPRITE_OAK_AIDE, $3 + 4, $8 + 4, $ff, $d3, $43, SCIENTIST + $C8, $6 ; trainer
	db SPRITE_ROCKER, $a + 4, $12 + 4, $ff, $d1, $44, JUGGLER + $C8, $1 ; trainer
	db SPRITE_ROCKET, $4 + 4, $1c + 4, $ff, $d1, $45, ROCKET + $C8, $1d ; trainer
	db SPRITE_BALL, $d + 4, $2 + 4, $ff, $ff, $86, TM_09 ; item
	db SPRITE_BALL, $6 + 4, $4 + 4, $ff, $ff, $87, PROTEIN ; item
	db SPRITE_BALL, $10 + 4, $15 + 4, $ff, $ff, $88, CARD_KEY ; item
	db SPRITE_CLIPBOARD, $c + 4, $16 + 4, $ff, $ff, $9 ; person
	db SPRITE_CLIPBOARD, $a + 4, $19 + 4, $ff, $ff, $a ; person
	db SPRITE_CLIPBOARD, $6 + 4, $18 + 4, $ff, $ff, $b ; person

	; warp-to
	EVENT_DISP SILPH_CO_5F_WIDTH, $0, $18 ; SILPH_CO_6F
	EVENT_DISP SILPH_CO_5F_WIDTH, $0, $1a ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_5F_WIDTH, $0, $14 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_5F_WIDTH, $3, $1b ; SILPH_CO_7F
	EVENT_DISP SILPH_CO_5F_WIDTH, $f, $9 ; SILPH_CO_9F
	EVENT_DISP SILPH_CO_5F_WIDTH, $5, $b ; SILPH_CO_3F
	EVENT_DISP SILPH_CO_5F_WIDTH, $f, $3 ; SILPH_CO_3F
