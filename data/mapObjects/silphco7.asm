SilphCo7Object:
	db $2e ; border block

	db $6 ; warps
	db $0, $10, $1, SILPH_CO_8F
	db $0, $16, $0, SILPH_CO_6F
	db $0, $12, $0, SILPH_CO_ELEVATOR
	db $7, $5, $3, SILPH_CO_11F
	db $3, $5, $8, SILPH_CO_3F
	db $f, $15, $3, SILPH_CO_5F

	db $0 ; signs

	db $b ; objects
	object SPRITE_LAPRAS_GIVER, $1, $5, STAY, NONE, $1 ; person
	object SPRITE_LAPRAS_GIVER, $d, $d, STAY, UP, $2 ; person
	object SPRITE_LAPRAS_GIVER, $7, $a, STAY, NONE, $3 ; person
	object SPRITE_ERIKA, $a, $8, STAY, NONE, $4 ; person
	object SPRITE_ROCKET, $d, $1, STAY, DOWN, $5, OPP_ROCKET, $20
	object SPRITE_OAK_AIDE, $2, $d, STAY, DOWN, $6, OPP_SCIENTIST, $8
	object SPRITE_ROCKET, $14, $2, STAY, LEFT, $7, OPP_ROCKET, $21
	object SPRITE_ROCKET, $13, $e, STAY, RIGHT, $8, OPP_ROCKET, $22
	object SPRITE_BLUE, $3, $7, STAY, UP, $9 ; person
	object SPRITE_BALL, $1, $9, STAY, NONE, $a, CALCIUM
	object SPRITE_BALL, $18, $b, STAY, NONE, $b, TM_03

	; warp-to
	EVENT_DISP SILPH_CO_7F_WIDTH, $0, $10 ; SILPH_CO_8F
	EVENT_DISP SILPH_CO_7F_WIDTH, $0, $16 ; SILPH_CO_6F
	EVENT_DISP SILPH_CO_7F_WIDTH, $0, $12 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_7F_WIDTH, $7, $5 ; SILPH_CO_11F
	EVENT_DISP SILPH_CO_7F_WIDTH, $3, $5 ; SILPH_CO_3F
	EVENT_DISP SILPH_CO_7F_WIDTH, $f, $15 ; SILPH_CO_5F
