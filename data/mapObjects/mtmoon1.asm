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

	db $d ; people
	db SPRITE_HIKER, $6 + 4, $5 + 4, $ff, $d0, TRAINER | $1, HIKER + $C8, $1
	db SPRITE_BUG_CATCHER, $10 + 4, $c + 4, $ff, $d3, TRAINER | $2, YOUNGSTER + $C8, $3
	db SPRITE_LASS, $4 + 4, $1e + 4, $ff, $d0, TRAINER | $3, LASS + $C8, $5
	db SPRITE_BLACK_HAIR_BOY_2, $1f + 4, $18 + 4, $ff, $d1, TRAINER | $4, SUPER_NERD + $C8, $1
	db SPRITE_LASS, $17 + 4, $10 + 4, $ff, $d0, TRAINER | $5, LASS + $C8, $6
	db SPRITE_BUG_CATCHER, $16 + 4, $7 + 4, $ff, $d0, TRAINER | $6, BUG_CATCHER + $C8, $7
	db SPRITE_BUG_CATCHER, $1b + 4, $1e + 4, $ff, $d3, TRAINER | $7, BUG_CATCHER + $C8, $8
	db SPRITE_BALL, $14 + 4, $2 + 4, $ff, $ff, ITEM | $8, POTION
	db SPRITE_BALL, $2 + 4, $2 + 4, $ff, $ff, ITEM | $9, MOON_STONE
	db SPRITE_BALL, $1f + 4, $23 + 4, $ff, $ff, ITEM | $a, RARE_CANDY
	db SPRITE_BALL, $17 + 4, $24 + 4, $ff, $ff, ITEM | $b, ESCAPE_ROPE
	db SPRITE_BALL, $21 + 4, $14 + 4, $ff, $ff, ITEM | $c, POTION
	db SPRITE_BALL, $20 + 4, $5 + 4, $ff, $ff, ITEM | $d, TM_12

	; warp-to
	EVENT_DISP MT_MOON_1_WIDTH, $23, $e
	EVENT_DISP MT_MOON_1_WIDTH, $23, $f
	EVENT_DISP MT_MOON_1_WIDTH, $5, $5 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $b, $11 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $f, $19 ; MT_MOON_2
