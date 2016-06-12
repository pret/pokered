FightingDojoObject:
	db $3 ; border block

	db $2 ; warps
	db $b, $4, $1, $ff
	db $b, $5, $1, $ff

	db $0 ; signs

	db $7 ; objects
	object SPRITE_HIKER, $5, $3, STAY, DOWN, $1, OPP_BLACKBELT, $1
	object SPRITE_HIKER, $3, $4, STAY, RIGHT, $2, OPP_BLACKBELT, $2
	object SPRITE_HIKER, $3, $6, STAY, RIGHT, $3, OPP_BLACKBELT, $3
	object SPRITE_HIKER, $5, $5, STAY, LEFT, $4, OPP_BLACKBELT, $4
	object SPRITE_HIKER, $5, $7, STAY, LEFT, $5, OPP_BLACKBELT, $5
	object SPRITE_BALL, $4, $1, STAY, NONE, $6 ; person
	object SPRITE_BALL, $5, $1, STAY, NONE, $7 ; person

	; warp-to
	EVENT_DISP FIGHTING_DOJO_WIDTH, $b, $4
	EVENT_DISP FIGHTING_DOJO_WIDTH, $b, $5
