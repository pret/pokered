SilphCo9Object:
	db $2e ; border block

	db $5 ; warps
	warp $e, $0, $0, SILPH_CO_10F
	warp $10, $0, $0, SILPH_CO_8F
	warp $12, $0, $0, SILPH_CO_ELEVATOR
	warp $9, $3, $7, SILPH_CO_3F
	warp $11, $f, $4, SILPH_CO_5F

	db $0 ; signs

	db $4 ; objects
	object SPRITE_NURSE, $3, $e, STAY, DOWN, $1 ; person
	object SPRITE_ROCKET, $2, $4, STAY, UP, $2, OPP_ROCKET, $25
	object SPRITE_OAK_AIDE, $15, $d, STAY, DOWN, $3, OPP_SCIENTIST, $a
	object SPRITE_ROCKET, $d, $10, STAY, UP, $4, OPP_ROCKET, $26

	; warp-to
	warp_to $e, $0, SILPH_CO_9F_WIDTH ; SILPH_CO_10F
	warp_to $10, $0, SILPH_CO_9F_WIDTH ; SILPH_CO_8F
	warp_to $12, $0, SILPH_CO_9F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $9, $3, SILPH_CO_9F_WIDTH ; SILPH_CO_3F
	warp_to $11, $f, SILPH_CO_9F_WIDTH ; SILPH_CO_5F
