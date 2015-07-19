MtMoon1Object: ; 0x49b06 (size=145)
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
	object SPRITE_HIKER, $5, $6, FACE, DOWN, $1, HIKER + $C8, $1
	object SPRITE_BUG_CATCHER, $c, $10, FACE, LEFT, $2, YOUNGSTER + $C8, $3
	object SPRITE_LASS, $1e, $4, FACE, DOWN, $3, LASS + $C8, $5
	object SPRITE_BLACK_HAIR_BOY_2, $18, $1f, FACE, UP, $4, SUPER_NERD + $C8, $1
	object SPRITE_LASS, $10, $17, FACE, DOWN, $5, LASS + $C8, $6
	object SPRITE_BUG_CATCHER, $7, $16, FACE, DOWN, $6, BUG_CATCHER + $C8, $7
	object SPRITE_BUG_CATCHER, $1e, $1b, FACE, LEFT, $7, BUG_CATCHER + $C8, $8
	object SPRITE_BALL, $2, $14, FACE, STAY, $8, POTION
	object SPRITE_BALL, $2, $2, FACE, STAY, $9, MOON_STONE
	object SPRITE_BALL, $23, $1f, FACE, STAY, $a, RARE_CANDY
	object SPRITE_BALL, $24, $17, FACE, STAY, $b, ESCAPE_ROPE
	object SPRITE_BALL, $14, $21, FACE, STAY, $c, POTION
	object SPRITE_BALL, $5, $20, FACE, STAY, $d, TM_12

	; warp-to
	EVENT_DISP MT_MOON_1_WIDTH, $23, $e
	EVENT_DISP MT_MOON_1_WIDTH, $23, $f
	EVENT_DISP MT_MOON_1_WIDTH, $5, $5 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $b, $11 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $f, $19 ; MT_MOON_2
