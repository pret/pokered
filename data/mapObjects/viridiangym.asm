ViridianGymObject:
	db $3 ; border block

	db $2 ; warps
	db $11, $10, $4, $ff
	db $11, $11, $4, $ff

	db $0 ; signs

	db $b ; objects
	object SPRITE_GIOVANNI, $2, $1, STAY, DOWN, $1, OPP_GIOVANNI, $3
	object SPRITE_BLACK_HAIR_BOY_1, $c, $7, STAY, DOWN, $2, OPP_COOLTRAINER_M, $9
	object SPRITE_HIKER, $b, $b, STAY, UP, $3, OPP_BLACKBELT, $6
	object SPRITE_ROCKER, $a, $7, STAY, DOWN, $4, OPP_TAMER, $3
	object SPRITE_HIKER, $3, $7, STAY, LEFT, $5, OPP_BLACKBELT, $7
	object SPRITE_BLACK_HAIR_BOY_1, $d, $5, STAY, RIGHT, $6, OPP_COOLTRAINER_M, $a
	object SPRITE_HIKER, $a, $1, STAY, DOWN, $7, OPP_BLACKBELT, $8
	object SPRITE_ROCKER, $2, $10, STAY, RIGHT, $8, OPP_TAMER, $4
	object SPRITE_BLACK_HAIR_BOY_1, $6, $5, STAY, DOWN, $9, OPP_COOLTRAINER_M, $1
	object SPRITE_GYM_HELPER, $10, $f, STAY, DOWN, $a ; person
	object SPRITE_BALL, $10, $9, STAY, NONE, $b, REVIVE

	; warp-to
	EVENT_DISP VIRIDIAN_GYM_WIDTH, $11, $10
	EVENT_DISP VIRIDIAN_GYM_WIDTH, $11, $11
