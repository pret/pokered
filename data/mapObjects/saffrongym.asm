SaffronGymObject:
	db $2e ; border block

	db $20 ; warps
	warp $8, $11, $2, $ff
	warp $9, $11, $2, $ff
	warp $1, $3, $16, SAFFRON_GYM
	warp $5, $3, $f, SAFFRON_GYM
	warp $1, $5, $12, SAFFRON_GYM
	warp $5, $5, $8, SAFFRON_GYM
	warp $1, $9, $1b, SAFFRON_GYM
	warp $5, $9, $10, SAFFRON_GYM
	warp $1, $b, $5, SAFFRON_GYM
	warp $5, $b, $d, SAFFRON_GYM
	warp $1, $f, $17, SAFFRON_GYM
	warp $5, $f, $1e, SAFFRON_GYM
	warp $1, $11, $11, SAFFRON_GYM
	warp $5, $11, $9, SAFFRON_GYM
	warp $9, $3, $1a, SAFFRON_GYM
	warp $b, $3, $3, SAFFRON_GYM
	warp $9, $5, $7, SAFFRON_GYM
	warp $b, $5, $c, SAFFRON_GYM
	warp $b, $b, $4, SAFFRON_GYM
	warp $b, $f, $1f, SAFFRON_GYM
	warp $f, $3, $18, SAFFRON_GYM
	warp $13, $3, $1c, SAFFRON_GYM
	warp $f, $5, $2, SAFFRON_GYM
	warp $13, $5, $a, SAFFRON_GYM
	warp $f, $9, $14, SAFFRON_GYM
	warp $13, $9, $1d, SAFFRON_GYM
	warp $f, $b, $e, SAFFRON_GYM
	warp $13, $b, $6, SAFFRON_GYM
	warp $f, $f, $15, SAFFRON_GYM
	warp $13, $f, $19, SAFFRON_GYM
	warp $f, $11, $b, SAFFRON_GYM
	warp $13, $11, $13, SAFFRON_GYM

	db $0 ; signs

	db $9 ; objects
	object SPRITE_GIRL, $9, $8, STAY, DOWN, $1, OPP_SABRINA, $1
	object SPRITE_MEDIUM, $a, $1, STAY, DOWN, $2, OPP_CHANNELER, $16
	object SPRITE_BUG_CATCHER, $11, $1, STAY, DOWN, $3, OPP_PSYCHIC_TR, $1
	object SPRITE_MEDIUM, $3, $7, STAY, DOWN, $4, OPP_CHANNELER, $17
	object SPRITE_BUG_CATCHER, $11, $7, STAY, DOWN, $5, OPP_PSYCHIC_TR, $2
	object SPRITE_MEDIUM, $3, $d, STAY, DOWN, $6, OPP_CHANNELER, $18
	object SPRITE_BUG_CATCHER, $11, $d, STAY, DOWN, $7, OPP_PSYCHIC_TR, $3
	object SPRITE_BUG_CATCHER, $3, $1, STAY, DOWN, $8, OPP_PSYCHIC_TR, $4
	object SPRITE_GYM_HELPER, $a, $f, STAY, DOWN, $9 ; person

	; warp-to
	warp_to $8, $11, SAFFRON_GYM_WIDTH
	warp_to $9, $11, SAFFRON_GYM_WIDTH
	warp_to $1, $3, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $5, $3, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $1, $5, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $5, $5, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $1, $9, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $5, $9, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $1, $b, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $5, $b, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $1, $f, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $5, $f, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $1, $11, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $5, $11, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $9, $3, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $b, $3, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $9, $5, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $b, $5, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $b, $b, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $b, $f, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $f, $3, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $13, $3, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $f, $5, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $13, $5, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $f, $9, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $13, $9, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $f, $b, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $13, $b, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $f, $f, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $13, $f, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $f, $11, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to $13, $11, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
