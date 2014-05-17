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
	db SPRITE_HIKER, $6 + 4, $5 + 4, $ff, $d0, $41, HIKER + $C8, $1 ; trainer
	db SPRITE_BUG_CATCHER, $10 + 4, $c + 4, $ff, $d3, $42, YOUNGSTER + $C8, $3 ; trainer
	db SPRITE_LASS, $4 + 4, $1e + 4, $ff, $d0, $43, LASS + $C8, $5 ; trainer
	db SPRITE_BLACK_HAIR_BOY_2, $1f + 4, $18 + 4, $ff, $d1, $44, SUPER_NERD + $C8, $1 ; trainer
	db SPRITE_LASS, $17 + 4, $10 + 4, $ff, $d0, $45, LASS + $C8, $6 ; trainer
	db SPRITE_BUG_CATCHER, $16 + 4, $7 + 4, $ff, $d0, $46, BUG_CATCHER + $C8, $7 ; trainer
	db SPRITE_BUG_CATCHER, $1b + 4, $1e + 4, $ff, $d3, $47, BUG_CATCHER + $C8, $8 ; trainer
	db SPRITE_BALL, $14 + 4, $2 + 4, $ff, $ff, $88, POTION ; item
	db SPRITE_BALL, $2 + 4, $2 + 4, $ff, $ff, $89, MOON_STONE ; item
	db SPRITE_BALL, $1f + 4, $23 + 4, $ff, $ff, $8a, RARE_CANDY ; item
	db SPRITE_BALL, $17 + 4, $24 + 4, $ff, $ff, $8b, ESCAPE_ROPE ; item
	db SPRITE_BALL, $21 + 4, $14 + 4, $ff, $ff, $8c, POTION ; item
	db SPRITE_BALL, $20 + 4, $5 + 4, $ff, $ff, $8d, TM_12 ; item

	; warp-to
	EVENT_DISP MT_MOON_1_WIDTH, $23, $e
	EVENT_DISP MT_MOON_1_WIDTH, $23, $f
	EVENT_DISP MT_MOON_1_WIDTH, $5, $5 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $b, $11 ; MT_MOON_2
	EVENT_DISP MT_MOON_1_WIDTH, $f, $19 ; MT_MOON_2
