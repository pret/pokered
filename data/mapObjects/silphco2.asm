SilphCo2Object: ; 0x59e66 (size=98)
	db $2e ; border block

	db $7 ; warps
	db $0, $18, $2, SILPH_CO_1F
	db $0, $1a, $0, SILPH_CO_3F
	db $0, $14, $0, SILPH_CO_ELEVATOR
	db $3, $3, $6, SILPH_CO_3F
	db $3, $d, $4, SILPH_CO_8F
	db $f, $1b, $5, SILPH_CO_8F
	db $f, $9, $4, SILPH_CO_6F

	db $0 ; signs

	db $5 ; objects
	object SPRITE_ERIKA, $a, $1, STAY, UP, $1 ; person
	object SPRITE_OAK_AIDE, $5, $c, STAY, DOWN, $2, SCIENTIST + $C8, $2
	object SPRITE_OAK_AIDE, $18, $d, STAY, LEFT, $3, SCIENTIST + $C8, $3
	object SPRITE_ROCKET, $10, $b, STAY, UP, $4, ROCKET + $C8, $17
	object SPRITE_ROCKET, $18, $7, STAY, UP, $5, ROCKET + $C8, $18

	; warp-to
	EVENT_DISP SILPH_CO_2F_WIDTH, $0, $18 ; SILPH_CO_1F
	EVENT_DISP SILPH_CO_2F_WIDTH, $0, $1a ; SILPH_CO_3F
	EVENT_DISP SILPH_CO_2F_WIDTH, $0, $14 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_2F_WIDTH, $3, $3 ; SILPH_CO_3F
	EVENT_DISP SILPH_CO_2F_WIDTH, $3, $d ; SILPH_CO_8F
	EVENT_DISP SILPH_CO_2F_WIDTH, $f, $1b ; SILPH_CO_8F
	EVENT_DISP SILPH_CO_2F_WIDTH, $f, $9 ; SILPH_CO_6F
