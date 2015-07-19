CeladonGymObject: ; 0x48b30 (size=84)
	db $3 ; border block

	db $2 ; warps
	db $11, $4, $6, $ff
	db $11, $5, $6, $ff

	db $0 ; signs

	db $8 ; objects
	object SPRITE_ERIKA, $4, $3, STAY, DOWN, $1, ERIKA + $C8, $1
	object SPRITE_LASS, $2, $b, STAY, RIGHT, $2, LASS + $C8, $11
	object SPRITE_FOULARD_WOMAN, $7, $a, STAY, LEFT, $3, BEAUTY + $C8, $1
	object SPRITE_LASS, $9, $5, STAY, DOWN, $4, JR__TRAINER_F + $C8, $b
	object SPRITE_FOULARD_WOMAN, $1, $5, STAY, DOWN, $5, BEAUTY + $C8, $2
	object SPRITE_LASS, $6, $3, STAY, DOWN, $6, LASS + $C8, $12
	object SPRITE_FOULARD_WOMAN, $3, $3, STAY, DOWN, $7, BEAUTY + $C8, $3
	object SPRITE_LASS, $5, $3, STAY, DOWN, $8, COOLTRAINER_F + $C8, $1

	; warp-to
	EVENT_DISP CELADON_GYM_WIDTH, $11, $4
	EVENT_DISP CELADON_GYM_WIDTH, $11, $5
