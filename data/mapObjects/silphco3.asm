SilphCo3Object:
	db $2e ; border block

	db $a ; warps
	warp $1a, $0, $1, SILPH_CO_2F
	warp $18, $0, $0, SILPH_CO_4F
	warp $14, $0, $0, SILPH_CO_ELEVATOR
	warp $17, $b, $9, SILPH_CO_3F
	warp $3, $3, $5, SILPH_CO_5F
	warp $3, $f, $6, SILPH_CO_5F
	warp $1b, $3, $3, SILPH_CO_2F
	warp $3, $b, $3, SILPH_CO_9F
	warp $b, $b, $4, SILPH_CO_7F
	warp $1b, $f, $3, SILPH_CO_3F

	db $0 ; signs

	db $4 ; objects
	object SPRITE_LAPRAS_GIVER, $18, $8, STAY, NONE, $1 ; person
	object SPRITE_ROCKET, $14, $7, STAY, LEFT, $2, OPP_ROCKET, $19
	object SPRITE_OAK_AIDE, $7, $9, STAY, DOWN, $3, OPP_SCIENTIST, $4
	object SPRITE_BALL, $8, $5, STAY, NONE, $4, HYPER_POTION

	; warp-to
	warp_to $1a, $0, SILPH_CO_3F_WIDTH ; SILPH_CO_2F
	warp_to $18, $0, SILPH_CO_3F_WIDTH ; SILPH_CO_4F
	warp_to $14, $0, SILPH_CO_3F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $17, $b, SILPH_CO_3F_WIDTH ; SILPH_CO_3F
	warp_to $3, $3, SILPH_CO_3F_WIDTH ; SILPH_CO_5F
	warp_to $3, $f, SILPH_CO_3F_WIDTH ; SILPH_CO_5F
	warp_to $1b, $3, SILPH_CO_3F_WIDTH ; SILPH_CO_2F
	warp_to $3, $b, SILPH_CO_3F_WIDTH ; SILPH_CO_9F
	warp_to $b, $b, SILPH_CO_3F_WIDTH ; SILPH_CO_7F
	warp_to $1b, $f, SILPH_CO_3F_WIDTH ; SILPH_CO_3F
