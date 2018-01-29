SilphCo8Object:
	db $2e ; border block

	db $7 ; warps
	warp $10, $0, $1, SILPH_CO_9F
	warp $e, $0, $0, SILPH_CO_7F
	warp $12, $0, $0, SILPH_CO_ELEVATOR
	warp $3, $b, $6, SILPH_CO_8F
	warp $3, $f, $4, SILPH_CO_2F
	warp $b, $5, $5, SILPH_CO_2F
	warp $b, $9, $3, SILPH_CO_8F

	db $0 ; signs

	db $4 ; objects
	object SPRITE_LAPRAS_GIVER, $4, $2, STAY, NONE, $1 ; person
	object SPRITE_ROCKET, $13, $2, STAY, LEFT, $2, OPP_ROCKET, $23
	object SPRITE_OAK_AIDE, $a, $2, STAY, DOWN, $3, OPP_SCIENTIST, $9
	object SPRITE_ROCKET, $c, $f, STAY, RIGHT, $4, OPP_ROCKET, $24

	; warp-to
	warp_to $10, $0, SILPH_CO_8F_WIDTH ; SILPH_CO_9F
	warp_to $e, $0, SILPH_CO_8F_WIDTH ; SILPH_CO_7F
	warp_to $12, $0, SILPH_CO_8F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $3, $b, SILPH_CO_8F_WIDTH ; SILPH_CO_8F
	warp_to $3, $f, SILPH_CO_8F_WIDTH ; SILPH_CO_2F
	warp_to $b, $5, SILPH_CO_8F_WIDTH ; SILPH_CO_2F
	warp_to $b, $9, SILPH_CO_8F_WIDTH ; SILPH_CO_8F_WIDTH
