MtMoon3Object: ; 0x49fdb (size=102)
	db $3 ; border block

	db $4 ; warps
	db $9, $19, $1, MT_MOON_2
	db $11, $15, $4, MT_MOON_2
	db $1b, $f, $5, MT_MOON_2
	db $7, $5, $6, MT_MOON_2

	db $0 ; signs

	db $9 ; people
	db SPRITE_BLACK_HAIR_BOY_2, $8 + 4, $c + 4, $ff, $d3, TRAINER | $1, SUPER_NERD + $C8, $2
	db SPRITE_ROCKET, $10 + 4, $b + 4, $ff, $d0, TRAINER | $2, ROCKET + $C8, $1
	db SPRITE_ROCKET, $16 + 4, $f + 4, $ff, $d0, TRAINER | $3, ROCKET + $C8, $2
	db SPRITE_ROCKET, $b + 4, $1d + 4, $ff, $d1, TRAINER | $4, ROCKET + $C8, $3
	db SPRITE_ROCKET, $11 + 4, $1d + 4, $ff, $d2, TRAINER | $5, ROCKET + $C8, $4
	db SPRITE_OMANYTE, $6 + 4, $c + 4, $ff, $ff, $6 ; person
	db SPRITE_OMANYTE, $6 + 4, $d + 4, $ff, $ff, $7 ; person
	db SPRITE_BALL, $15 + 4, $19 + 4, $ff, $ff, ITEM | $8, HP_UP
	db SPRITE_BALL, $5 + 4, $1d + 4, $ff, $ff, ITEM | $9, TM_01

	; warp-to
	EVENT_DISP MT_MOON_3_WIDTH, $9, $19 ; MT_MOON_2
	EVENT_DISP MT_MOON_3_WIDTH, $11, $15 ; MT_MOON_2
	EVENT_DISP MT_MOON_3_WIDTH, $1b, $f ; MT_MOON_2
	EVENT_DISP MT_MOON_3_WIDTH, $7, $5 ; MT_MOON_2
