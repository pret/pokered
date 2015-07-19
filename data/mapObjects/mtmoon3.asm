MtMoon3Object: ; 0x49fdb (size=102)
	db $3 ; border block

	db $4 ; warps
	db $9, $19, $1, MT_MOON_2
	db $11, $15, $4, MT_MOON_2
	db $1b, $f, $5, MT_MOON_2
	db $7, $5, $6, MT_MOON_2

	db $0 ; signs

	db $9 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, $c, $8, FACE, LEFT, $1, SUPER_NERD + $C8, $2
	object SPRITE_ROCKET, $b, $10, FACE, DOWN, $2, ROCKET + $C8, $1
	object SPRITE_ROCKET, $f, $16, FACE, DOWN, $3, ROCKET + $C8, $2
	object SPRITE_ROCKET, $1d, $b, FACE, UP, $4, ROCKET + $C8, $3
	object SPRITE_ROCKET, $1d, $11, FACE, RIGHT, $5, ROCKET + $C8, $4
	object SPRITE_OMANYTE, $c, $6, FACE, STAY, $6 ; person
	object SPRITE_OMANYTE, $d, $6, FACE, STAY, $7 ; person
	object SPRITE_BALL, $19, $15, FACE, STAY, $8, HP_UP
	object SPRITE_BALL, $1d, $5, FACE, STAY, $9, TM_01

	; warp-to
	EVENT_DISP MT_MOON_3_WIDTH, $9, $19 ; MT_MOON_2
	EVENT_DISP MT_MOON_3_WIDTH, $11, $15 ; MT_MOON_2
	EVENT_DISP MT_MOON_3_WIDTH, $1b, $f ; MT_MOON_2
	EVENT_DISP MT_MOON_3_WIDTH, $7, $5 ; MT_MOON_2
