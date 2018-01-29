SilphCo11Object:
	db $d ; border block

	db $4 ; warps
	warp $9, $0, $1, SILPH_CO_10F
	warp $d, $0, $0, SILPH_CO_ELEVATOR
	warp $5, $5, $9, $ff
	warp $3, $2, $3, SILPH_CO_7F

	db $0 ; signs

	db $5 ; objects
	object SPRITE_MR_MASTERBALL, $7, $5, STAY, DOWN, $1 ; person
	object SPRITE_FOULARD_WOMAN, $a, $5, STAY, DOWN, $2 ; person
	object SPRITE_GIOVANNI, $6, $9, STAY, DOWN, $3, OPP_GIOVANNI, $2
	object SPRITE_ROCKET, $3, $10, STAY, UP, $4, OPP_ROCKET, $29
	object SPRITE_ROCKET, $f, $9, STAY, UP, $5, OPP_ROCKET, $28

	; warp-to
	warp_to $9, $0, SILPH_CO_11F_WIDTH ; SILPH_CO_10F
	warp_to $d, $0, SILPH_CO_11F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $5, $5, SILPH_CO_11F_WIDTH
	warp_to $3, $2, SILPH_CO_11F_WIDTH ; SILPH_CO_7F
