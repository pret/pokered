SilphCo1Object:
	db $2e ; border block

	db $5 ; warps
	warp $a, $11, $5, $ff
	warp $b, $11, $5, $ff
	warp $1a, $0, $0, SILPH_CO_2F
	warp $14, $0, $0, SILPH_CO_ELEVATOR
	warp $10, $a, $6, SILPH_CO_3F

	db $0 ; signs

	db $1 ; objects
	object SPRITE_CABLE_CLUB_WOMAN, $4, $2, STAY, DOWN, $1 ; person

	; warp-to
	warp_to $a, $11, SILPH_CO_1F_WIDTH
	warp_to $b, $11, SILPH_CO_1F_WIDTH
	warp_to $1a, $0, SILPH_CO_1F_WIDTH ; SILPH_CO_2F
	warp_to $14, $0, SILPH_CO_1F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $10, $a, SILPH_CO_1F_WIDTH ; SILPH_CO_3F
