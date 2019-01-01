SSAnneB1F_Object:
	db $c ; border block

	db 6 ; warps
	warp 23, 3, 8, SS_ANNE_B1F_ROOMS
	warp 19, 3, 6, SS_ANNE_B1F_ROOMS
	warp 15, 3, 4, SS_ANNE_B1F_ROOMS
	warp 11, 3, 2, SS_ANNE_B1F_ROOMS
	warp 7, 3, 0, SS_ANNE_B1F_ROOMS
	warp 27, 5, 9, SS_ANNE_1F

	db 0 ; signs

	db 0 ; objects

	; warp-to
	warp_to 23, 3, SS_ANNE_B1F_WIDTH ; SS_ANNE_B1F_ROOMS
	warp_to 19, 3, SS_ANNE_B1F_WIDTH ; SS_ANNE_B1F_ROOMS
	warp_to 15, 3, SS_ANNE_B1F_WIDTH ; SS_ANNE_B1F_ROOMS
	warp_to 11, 3, SS_ANNE_B1F_WIDTH ; SS_ANNE_B1F_ROOMS
	warp_to 7, 3, SS_ANNE_B1F_WIDTH ; SS_ANNE_B1F_ROOMS
	warp_to 27, 5, SS_ANNE_B1F_WIDTH ; SS_ANNE_1F
