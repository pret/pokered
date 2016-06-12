SilphCo6Object:
	db $2e ; border block

	db $5 ; warps
	db $0, $10, $1, SILPH_CO_7F
	db $0, $e, $0, SILPH_CO_5F
	db $0, $12, $0, SILPH_CO_ELEVATOR
	db $3, $3, $4, SILPH_CO_4F
	db $3, $17, $6, SILPH_CO_2F

	db $0 ; signs

	db $a ; objects
	object SPRITE_LAPRAS_GIVER, $a, $6, STAY, NONE, $1 ; person
	object SPRITE_LAPRAS_GIVER, $14, $6, STAY, NONE, $2 ; person
	object SPRITE_ERIKA, $15, $6, STAY, DOWN, $3 ; person
	object SPRITE_ERIKA, $b, $a, STAY, RIGHT, $4 ; person
	object SPRITE_LAPRAS_GIVER, $12, $d, STAY, UP, $5 ; person
	object SPRITE_ROCKET, $11, $3, STAY, RIGHT, $6, OPP_ROCKET, $1e
	object SPRITE_OAK_AIDE, $7, $8, STAY, DOWN, $7, OPP_SCIENTIST, $7
	object SPRITE_ROCKET, $e, $f, STAY, LEFT, $8, OPP_ROCKET, $1f
	object SPRITE_BALL, $3, $c, STAY, NONE, $9, HP_UP
	object SPRITE_BALL, $2, $f, STAY, NONE, $a, X_ACCURACY

	; warp-to
	EVENT_DISP SILPH_CO_6F_WIDTH, $0, $10 ; SILPH_CO_7F
	EVENT_DISP SILPH_CO_6F_WIDTH, $0, $e ; SILPH_CO_5F
	EVENT_DISP SILPH_CO_6F_WIDTH, $0, $12 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_6F_WIDTH, $3, $3 ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_6F_WIDTH, $3, $17 ; SILPH_CO_2F
