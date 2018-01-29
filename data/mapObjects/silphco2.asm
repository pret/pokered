SilphCo2Object:
	db $2e ; border block

	db $7 ; warps
	warp $18, $0, $2, SILPH_CO_1F
	warp $1a, $0, $0, SILPH_CO_3F
	warp $14, $0, $0, SILPH_CO_ELEVATOR
	warp $3, $3, $6, SILPH_CO_3F
	warp $d, $3, $4, SILPH_CO_8F
	warp $1b, $f, $5, SILPH_CO_8F
	warp $9, $f, $4, SILPH_CO_6F

	db $0 ; signs

	db $5 ; objects
	object SPRITE_ERIKA, $a, $1, STAY, UP, $1 ; person
	object SPRITE_OAK_AIDE, $5, $c, STAY, DOWN, $2, OPP_SCIENTIST, $2
	object SPRITE_OAK_AIDE, $18, $d, STAY, LEFT, $3, OPP_SCIENTIST, $3
	object SPRITE_ROCKET, $10, $b, STAY, UP, $4, OPP_ROCKET, $17
	object SPRITE_ROCKET, $18, $7, STAY, UP, $5, OPP_ROCKET, $18

	; warp-to
	warp_to $18, $0, SILPH_CO_2F_WIDTH ; SILPH_CO_1F
	warp_to $1a, $0, SILPH_CO_2F_WIDTH ; SILPH_CO_3F
	warp_to $14, $0, SILPH_CO_2F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $3, $3, SILPH_CO_2F_WIDTH ; SILPH_CO_3F
	warp_to $d, $3, SILPH_CO_2F_WIDTH ; SILPH_CO_8F
	warp_to $1b, $f, SILPH_CO_2F_WIDTH ; SILPH_CO_8F
	warp_to $9, $f, SILPH_CO_2F_WIDTH ; SILPH_CO_6F
