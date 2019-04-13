SSAnne2F_Object:
	db $c ; border block

	db 9 ; warps
	warp 9, 11, 0, SS_ANNE_2F_ROOMS
	warp 13, 11, 2, SS_ANNE_2F_ROOMS
	warp 17, 11, 4, SS_ANNE_2F_ROOMS
	warp 21, 11, 6, SS_ANNE_2F_ROOMS
	warp 25, 11, 8, SS_ANNE_2F_ROOMS
	warp 29, 11, 10, SS_ANNE_2F_ROOMS
	warp 2, 4, 8, SS_ANNE_1F
	warp 2, 12, 1, SS_ANNE_3F
	warp 36, 4, 0, SS_ANNE_CAPTAINS_ROOM

	db 0 ; signs

	db 2 ; objects
	object SPRITE_WAITER, 3, 7, WALK, 1, 1 ; person
	object SPRITE_BLUE, 36, 4, STAY, DOWN, 2, OPP_SONY1, 1

	; warp-to
	warp_to 9, 11, SS_ANNE_2F_WIDTH ; SS_ANNE_2F_ROOMS
	warp_to 13, 11, SS_ANNE_2F_WIDTH ; SS_ANNE_2F_ROOMS
	warp_to 17, 11, SS_ANNE_2F_WIDTH ; SS_ANNE_2F_ROOMS
	warp_to 21, 11, SS_ANNE_2F_WIDTH ; SS_ANNE_2F_ROOMS
	warp_to 25, 11, SS_ANNE_2F_WIDTH ; SS_ANNE_2F_ROOMS
	warp_to 29, 11, SS_ANNE_2F_WIDTH ; SS_ANNE_2F_ROOMS
	warp_to 2, 4, SS_ANNE_2F_WIDTH ; SS_ANNE_1F
	warp_to 2, 12, SS_ANNE_2F_WIDTH ; SS_ANNE_3F
	warp_to 36, 4, SS_ANNE_2F_WIDTH ; SS_ANNE_CAPTAINS_ROOM
