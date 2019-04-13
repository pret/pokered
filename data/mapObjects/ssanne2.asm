SSAnne2Object:
	db $c ; border block

	db 9 ; warps
	warp 9, 11, 0, SS_ANNE_9
	warp 13, 11, 2, SS_ANNE_9
	warp 17, 11, 4, SS_ANNE_9
	warp 21, 11, 6, SS_ANNE_9
	warp 25, 11, 8, SS_ANNE_9
	warp 29, 11, 10, SS_ANNE_9
	warp 2, 4, 8, SS_ANNE_1
	warp 2, 12, 1, SS_ANNE_3
	warp 36, 4, 0, SS_ANNE_7

	db 0 ; signs

	db 2 ; objects
	object SPRITE_WAITER, 3, 7, WALK, 1, 1 ; person
	object SPRITE_BLUE, 36, 4, STAY, DOWN, 2, OPP_SONY1, 1

	; warp-to
	warp_to 9, 11, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to 13, 11, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to 17, 11, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to 21, 11, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to 25, 11, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to 29, 11, SS_ANNE_2_WIDTH ; SS_ANNE_9
	warp_to 2, 4, SS_ANNE_2_WIDTH ; SS_ANNE_1
	warp_to 2, 12, SS_ANNE_2_WIDTH ; SS_ANNE_3
	warp_to 36, 4, SS_ANNE_2_WIDTH ; SS_ANNE_7
