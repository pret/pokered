MtMoon2Object:
	db $3 ; border block

	db $8 ; warps
	warp $5, $5, $2, MT_MOON_1
	warp $11, $b, $0, MT_MOON_3
	warp $19, $9, $3, MT_MOON_1
	warp $19, $f, $4, MT_MOON_1
	warp $15, $11, $1, MT_MOON_3
	warp $d, $1b, $2, MT_MOON_3
	warp $17, $3, $3, MT_MOON_3
	warp $1b, $3, $2, $ff

	db $0 ; signs

	db $0 ; objects

	; warp-to
	warp_to $5, $5, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to $11, $b, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to $19, $9, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to $19, $f, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to $15, $11, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to $d, $1b, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to $17, $3, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to $1b, $3, MT_MOON_2_WIDTH
