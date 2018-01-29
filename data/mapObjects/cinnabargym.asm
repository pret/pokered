CinnabarGymObject:
	db $2e ; border block

	db $2 ; warps
	warp $10, $11, $1, $ff
	warp $11, $11, $1, $ff

	db $0 ; signs

	db $9 ; objects
	object SPRITE_FAT_BALD_GUY, $3, $3, STAY, DOWN, $1, OPP_BLAINE, $1
	object SPRITE_BLACK_HAIR_BOY_2, $11, $2, STAY, DOWN, $2, OPP_SUPER_NERD, $9
	object SPRITE_BLACK_HAIR_BOY_2, $11, $8, STAY, DOWN, $3, OPP_BURGLAR, $4
	object SPRITE_BLACK_HAIR_BOY_2, $b, $4, STAY, DOWN, $4, OPP_SUPER_NERD, $a
	object SPRITE_BLACK_HAIR_BOY_2, $b, $8, STAY, DOWN, $5, OPP_BURGLAR, $5
	object SPRITE_BLACK_HAIR_BOY_2, $b, $e, STAY, DOWN, $6, OPP_SUPER_NERD, $b
	object SPRITE_BLACK_HAIR_BOY_2, $3, $e, STAY, DOWN, $7, OPP_BURGLAR, $6
	object SPRITE_BLACK_HAIR_BOY_2, $3, $8, STAY, DOWN, $8, OPP_SUPER_NERD, $c
	object SPRITE_GYM_HELPER, $10, $d, STAY, DOWN, $9 ; person

	; warp-to
	warp_to $10, $11, CINNABAR_GYM_WIDTH
	warp_to $11, $11, CINNABAR_GYM_WIDTH
