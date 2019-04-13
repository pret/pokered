SSAnne4Object:
	db $c ; border block

	db 6 ; warps
	warp 23, 3, 8, SS_ANNE_10
	warp 19, 3, 6, SS_ANNE_10
	warp 15, 3, 4, SS_ANNE_10
	warp 11, 3, 2, SS_ANNE_10
	warp 7, 3, 0, SS_ANNE_10
	warp 27, 5, 9, SS_ANNE_1

	db 0 ; signs

	db 0 ; objects

	; warp-to
	warp_to 23, 3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to 19, 3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to 15, 3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to 11, 3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to 7, 3, SS_ANNE_4_WIDTH ; SS_ANNE_10
	warp_to 27, 5, SS_ANNE_4_WIDTH ; SS_ANNE_1
