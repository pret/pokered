SilphCo7Object:
	db $2e ; border block

	db $6 ; warps
	warp $10, $0, $1, SILPH_CO_8F
	warp $16, $0, $0, SILPH_CO_6F
	warp $12, $0, $0, SILPH_CO_ELEVATOR
	warp $5, $7, $3, SILPH_CO_11F
	warp $5, $3, $8, SILPH_CO_3F
	warp $15, $f, $3, SILPH_CO_5F

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
	warp_to $10, $0, SILPH_CO_7F_WIDTH ; SILPH_CO_8F
	warp_to $16, $0, SILPH_CO_7F_WIDTH ; SILPH_CO_6F
	warp_to $12, $0, SILPH_CO_7F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $5, $7, SILPH_CO_7F_WIDTH ; SILPH_CO_11F
	warp_to $5, $3, SILPH_CO_7F_WIDTH ; SILPH_CO_3F
	warp_to $15, $f, SILPH_CO_7F_WIDTH ; SILPH_CO_5F
