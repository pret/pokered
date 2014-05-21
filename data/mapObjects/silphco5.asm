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
	db SPRITE_ROCKET, $10 + 4, $8 + 4, $ff, $d3, TRAINER | $2, ROCKET + $C8, $1c
	db SPRITE_OAK_AIDE, $3 + 4, $8 + 4, $ff, $d3, TRAINER | $3, SCIENTIST + $C8, $6
	db SPRITE_ROCKER, $a + 4, $12 + 4, $ff, $d1, TRAINER | $4, JUGGLER + $C8, $1
	db SPRITE_ROCKET, $4 + 4, $1c + 4, $ff, $d1, TRAINER | $5, ROCKET + $C8, $1d
	db SPRITE_BALL, $d + 4, $2 + 4, $ff, $ff, ITEM | $6, TM_09
	db SPRITE_BALL, $6 + 4, $4 + 4, $ff, $ff, ITEM | $7, PROTEIN
	db SPRITE_BALL, $10 + 4, $15 + 4, $ff, $ff, ITEM | $8, CARD_KEY
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
