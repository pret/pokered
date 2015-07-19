VermilionGymObject: ; 0x5cbfe (size=58)
	db $3 ; border block

	db $2 ; warps
	db $11, $4, $3, $ff
	db $11, $5, $3, $ff

	db $0 ; signs

	db $5 ; objects
	object SPRITE_ROCKER, $5, $1, STAY, DOWN, $1, LT__SURGE + $C8, $1
	object SPRITE_GENTLEMAN, $9, $6, STAY, LEFT, $2, GENTLEMAN + $C8, $3
	object SPRITE_BLACK_HAIR_BOY_2, $3, $8, STAY, LEFT, $3, ROCKER + $C8, $1
	object SPRITE_SAILOR, $0, $a, STAY, RIGHT, $4, SAILOR + $C8, $8
	object SPRITE_GYM_HELPER, $4, $e, STAY, DOWN, $5 ; person

	; warp-to
	EVENT_DISP VERMILION_GYM_WIDTH, $11, $4
	EVENT_DISP VERMILION_GYM_WIDTH, $11, $5
