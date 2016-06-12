SilphCo10Object:
	db $2e ; border block

	db $6 ; warps
	db $0, $8, $0, SILPH_CO_9F
	db $0, $a, $0, SILPH_CO_11F
	db $0, $c, $0, SILPH_CO_ELEVATOR
	db $b, $9, $3, SILPH_CO_4F
	db $f, $d, $5, SILPH_CO_4F
	db $7, $d, $6, SILPH_CO_4F

	db $0 ; signs

	db $6 ; objects
	object SPRITE_ROCKET, $1, $9, STAY, RIGHT, $1, OPP_ROCKET, $27
	object SPRITE_OAK_AIDE, $a, $2, STAY, LEFT, $2, OPP_SCIENTIST, $b
	object SPRITE_ERIKA, $9, $f, WALK, $0, $3 ; person
	object SPRITE_BALL, $2, $c, STAY, NONE, $4, TM_26
	object SPRITE_BALL, $4, $e, STAY, NONE, $5, RARE_CANDY
	object SPRITE_BALL, $5, $b, STAY, NONE, $6, CARBOS

	; warp-to
	EVENT_DISP SILPH_CO_10F_WIDTH, $0, $8 ; SILPH_CO_9F
	EVENT_DISP SILPH_CO_10F_WIDTH, $0, $a ; SILPH_CO_11F
	EVENT_DISP SILPH_CO_10F_WIDTH, $0, $c ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_10F_WIDTH, $b, $9 ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_10F_WIDTH, $f, $d ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_10F_WIDTH, $7, $d ; SILPH_CO_4F
