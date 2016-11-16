CeladonGymObject:
	db $3 ; border block

	db $2 ; warps
	db $11, $4, $6, $ff
	db $11, $5, $6, $ff

	db $0 ; signs

	db $8 ; objects
	object SPRITE_ERIKA, $4, $3, STAY, DOWN, $1, ERIKA, $1
	object SPRITE_LASS, $2, $b, STAY, RIGHT, $2, LASS, $11
	object SPRITE_FOULARD_WOMAN, $7, $a, STAY, LEFT, $3, BEAUTY, $1
	object SPRITE_LASS, $9, $5, STAY, DOWN, $4, JR_TRAINER_F, $b
	object SPRITE_FOULARD_WOMAN, $1, $5, STAY, DOWN, $5, BEAUTY, $2
	object SPRITE_LASS, $6, $3, STAY, DOWN, $6, LASS, $12
	object SPRITE_FOULARD_WOMAN, $3, $3, STAY, DOWN, $7, BEAUTY, $3
	object SPRITE_LASS, $5, $3, STAY, DOWN, $8, COOLTRAINER_F, $1

	; warp-to
	EVENT_DISP CELADON_GYM_WIDTH, $11, $4
	EVENT_DISP CELADON_GYM_WIDTH, $11, $5
