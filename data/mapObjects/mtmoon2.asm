MtMoon2Object:
	db $3 ; border block

	db 8 ; warps
	warp 5, 5, 2, MT_MOON_1
	warp 17, 11, 0, MT_MOON_3
	warp 25, 9, 3, MT_MOON_1
	warp 25, 15, 4, MT_MOON_1
	warp 21, 17, 1, MT_MOON_3
	warp 13, 27, 2, MT_MOON_3
	warp 23, 3, 3, MT_MOON_3
	warp 27, 3, 2, -1

	db 0 ; signs

	db 0 ; objects

	; warp-to
	warp_to 5, 5, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to 17, 11, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 25, 9, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to 25, 15, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to 21, 17, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 13, 27, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 23, 3, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 27, 3, MT_MOON_2_WIDTH
