SilphCo4Object:
	db $2e ; border block

	db $7 ; warps
	warp $18, $0, $1, SILPH_CO_3F
	warp $1a, $0, $1, SILPH_CO_5F
	warp $14, $0, $0, SILPH_CO_ELEVATOR
	warp $b, $7, $3, SILPH_CO_10F
	warp $11, $3, $3, SILPH_CO_6F
	warp $3, $f, $4, SILPH_CO_10F
	warp $11, $b, $5, SILPH_CO_10F

	db $0 ; signs

	db $7 ; objects
	object SPRITE_LAPRAS_GIVER, $6, $2, STAY, NONE, $1 ; person
	object SPRITE_ROCKET, $9, $e, STAY, RIGHT, $2, OPP_ROCKET, $1a
	object SPRITE_OAK_AIDE, $e, $6, STAY, LEFT, $3, OPP_SCIENTIST, $5
	object SPRITE_ROCKET, $1a, $a, STAY, UP, $4, OPP_ROCKET, $1b
	object SPRITE_BALL, $3, $9, STAY, NONE, $5, FULL_HEAL
	object SPRITE_BALL, $4, $7, STAY, NONE, $6, MAX_REVIVE
	object SPRITE_BALL, $5, $8, STAY, NONE, $7, ESCAPE_ROPE

	; warp-to
	warp_to $18, $0, SILPH_CO_4F_WIDTH ; SILPH_CO_3F
	warp_to $1a, $0, SILPH_CO_4F_WIDTH ; SILPH_CO_5F
	warp_to $14, $0, SILPH_CO_4F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $b, $7, SILPH_CO_4F_WIDTH ; SILPH_CO_10F
	warp_to $11, $3, SILPH_CO_4F_WIDTH ; SILPH_CO_6F
	warp_to $3, $f, SILPH_CO_4F_WIDTH ; SILPH_CO_10F
	warp_to $11, $b, SILPH_CO_4F_WIDTH ; SILPH_CO_10F
