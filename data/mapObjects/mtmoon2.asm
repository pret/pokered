MtMoon2Object:
	db $3 ; border block

	db $8 ; warps
	db $5, $5, $2, MT_MOON_1
	db $b, $11, $0, MT_MOON_3
	db $9, $19, $3, MT_MOON_1
	db $f, $19, $4, MT_MOON_1
	db $11, $15, $1, MT_MOON_3
	db $1b, $d, $2, MT_MOON_3
	db $3, $17, $3, MT_MOON_3
	db $3, $1b, $2, $ff

	db $0 ; signs

	db $0 ; objects

	; warp-to
	EVENT_DISP MT_MOON_2_WIDTH, $5, $5 ; MT_MOON_1
	EVENT_DISP MT_MOON_2_WIDTH, $b, $11 ; MT_MOON_3
	EVENT_DISP MT_MOON_2_WIDTH, $9, $19 ; MT_MOON_1
	EVENT_DISP MT_MOON_2_WIDTH, $f, $19 ; MT_MOON_1
	EVENT_DISP MT_MOON_2_WIDTH, $11, $15 ; MT_MOON_3
	EVENT_DISP MT_MOON_2_WIDTH, $1b, $d ; MT_MOON_3
	EVENT_DISP MT_MOON_2_WIDTH, $3, $17 ; MT_MOON_3
	EVENT_DISP MT_MOON_2_WIDTH, $3, $1b
