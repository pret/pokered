MtMoon1Object:
	db $3 ; border block

	db $5 ; warps
	db $23, $e, $1, $ff
	db $23, $f, $1, $ff
	db $5, $5, $0, MT_MOON_2
	db $b, $11, $2, MT_MOON_2
	db $f, $19, $3, MT_MOON_2

	db $1 ; signs
	db $17, $f, $e ; MtMoon1Text14

	db $d ; objects
	object SPRITE_HIKER, $5, $6, STAY, DOWN, $1, OPP_HIKER, $1
	object SPRITE_BUG_CATCHER, $c, $10, STAY, RIGHT, $2, OPP_YOUNGSTER, $3
	object SPRITE_LASS, $1e, $4, STAY, DOWN, $3, OPP_LASS, $5
	object SPRITE_BLACK_HAIR_BOY_2, $18, $1f, STAY, UP, $4, OPP_SUPER_NERD, $1
	object SPRITE_LASS, $10, $17, STAY, DOWN, $5, OPP_LASS, $6
	object SPRITE_BUG_CATCHER, $7, $16, STAY, DOWN, $6, OPP_BUG_CATCHER, $7
	object SPRITE_BUG_CATCHER, $1e, $1b, STAY, RIGHT, $7, OPP_BUG_CATCHER, $8
	object SPRITE_BALL, $2, $14, STAY, NONE, $8, POTION
	object SPRITE_BALL, $2, $2, STAY, NONE, $9, MOON_STONE
	object SPRITE_BALL, $23, $1f, STAY, NONE, $a, RARE_CANDY
	object SPRITE_BALL, $24, $17, STAY, NONE, $b, ESCAPE_ROPE
	object SPRITE_BALL, $14, $21, STAY, NONE, $c, POTION
	object SPRITE_BALL, $5, $20, STAY, NONE, $d, TM_12

	; warp-to
	EVENT_DISP MT_MOON_1_WIDTH, $23, $e
	EVENT_DISP MT_MOON_1_WIDTH, $23, $f
	EVENT_DISP MT_MOON_1_WIDTH, $5, $5 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $b, $11 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $f, $19 ; MT_MOON_2
