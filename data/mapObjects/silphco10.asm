SilphCo10Object:
	db $2e ; border block

	db $6 ; warps
	warp $8, $0, $0, SILPH_CO_9F
	warp $a, $0, $0, SILPH_CO_11F
	warp $c, $0, $0, SILPH_CO_ELEVATOR
	warp $9, $b, $3, SILPH_CO_4F
	warp $d, $f, $5, SILPH_CO_4F
	warp $d, $7, $6, SILPH_CO_4F

	db $0 ; signs

	db $6 ; objects
	object SPRITE_ROCKET, $1, $9, STAY, RIGHT, $1, OPP_ROCKET, $27
	object SPRITE_OAK_AIDE, $a, $2, STAY, LEFT, $2, OPP_SCIENTIST, $b
	object SPRITE_ERIKA, $9, $f, WALK, $0, $3 ; person
	object SPRITE_BALL, $2, $c, STAY, NONE, $4, TM_26
	object SPRITE_BALL, $4, $e, STAY, NONE, $5, RARE_CANDY
	object SPRITE_BALL, $5, $b, STAY, NONE, $6, CARBOS

	; warp-to
	warp_to $8, $0, SILPH_CO_10F_WIDTH ; SILPH_CO_9F
	warp_to $a, $0, SILPH_CO_10F_WIDTH ; SILPH_CO_11F
	warp_to $c, $0, SILPH_CO_10F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to $9, $b, SILPH_CO_10F_WIDTH ; SILPH_CO_4F
	warp_to $d, $f, SILPH_CO_10F_WIDTH ; SILPH_CO_4F
	warp_to $d, $7, SILPH_CO_10F_WIDTH ; SILPH_CO_4F
