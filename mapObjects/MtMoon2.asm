MtMoon2Object: ; 0x51a4d (size=68)
	db $3 ; border tile

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

	db $0 ; people

	; warp-to
	EVENT_DISP $e, $5, $5 ; MT_MOON_1
	EVENT_DISP $e, $b, $11 ; MT_MOON_3
	EVENT_DISP $e, $9, $19 ; MT_MOON_1
	EVENT_DISP $e, $f, $19 ; MT_MOON_1
	EVENT_DISP $e, $11, $15 ; MT_MOON_3
	EVENT_DISP $e, $1b, $d ; MT_MOON_3
	EVENT_DISP $e, $3, $17 ; MT_MOON_3
	EVENT_DISP $e, $3, $1b
