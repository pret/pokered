CinnabarGymObject:
	db $2e ; border block

	db $2 ; warps
	db $11, $10, $1, $ff
	db $11, $11, $1, $ff

	db $0 ; signs

	db $9 ; objects
	object SPRITE_FAT_BALD_GUY, $3, $3, STAY, DOWN, $1, BLAINE, $1
	object SPRITE_BLACK_HAIR_BOY_2, $11, $2, STAY, DOWN, $2, SUPER_NERD, $9
	object SPRITE_BLACK_HAIR_BOY_2, $11, $8, STAY, DOWN, $3, BURGLAR, $4
	object SPRITE_BLACK_HAIR_BOY_2, $b, $4, STAY, DOWN, $4, SUPER_NERD, $a
	object SPRITE_BLACK_HAIR_BOY_2, $b, $8, STAY, DOWN, $5, BURGLAR, $5
	object SPRITE_BLACK_HAIR_BOY_2, $b, $e, STAY, DOWN, $6, SUPER_NERD, $b
	object SPRITE_BLACK_HAIR_BOY_2, $3, $e, STAY, DOWN, $7, BURGLAR, $6
	object SPRITE_BLACK_HAIR_BOY_2, $3, $8, STAY, DOWN, $8, SUPER_NERD, $c
	object SPRITE_GYM_HELPER, $10, $d, STAY, DOWN, $9 ; person

	; warp-to
	EVENT_DISP CINNABAR_GYM_WIDTH, $11, $10
	EVENT_DISP CINNABAR_GYM_WIDTH, $11, $11
