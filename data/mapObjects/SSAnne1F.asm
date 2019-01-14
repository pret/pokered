SSAnne1F_Object:
	db $c ; border block

	db 11 ; warps
	warp 26, 0, 1, VERMILION_DOCK
	warp 27, 0, 1, VERMILION_DOCK
	warp 31, 8, 0, SS_ANNE_1F_ROOMS
	warp 23, 8, 1, SS_ANNE_1F_ROOMS
	warp 19, 8, 2, SS_ANNE_1F_ROOMS
	warp 15, 8, 3, SS_ANNE_1F_ROOMS
	warp 11, 8, 4, SS_ANNE_1F_ROOMS
	warp 7, 8, 5, SS_ANNE_1F_ROOMS
	warp 2, 6, 6, SS_ANNE_2F
	warp 37, 15, 5, SS_ANNE_B1F
	warp 3, 16, 0, SS_ANNE_KITCHEN

	db 0 ; signs

	db 2 ; objects
	object SPRITE_WAITER, 12, 6, WALK, 2, 1 ; person
	object SPRITE_SAILOR, 27, 5, STAY, NONE, 2 ; person

	; warp-to
	warp_to 26, 0, SS_ANNE_1F_WIDTH ; VERMILION_DOCK
	warp_to 27, 0, SS_ANNE_1F_WIDTH ; VERMILION_DOCK
	warp_to 31, 8, SS_ANNE_1F_WIDTH ; SS_ANNE_1F_ROOMS
	warp_to 23, 8, SS_ANNE_1F_WIDTH ; SS_ANNE_1F_ROOMS
	warp_to 19, 8, SS_ANNE_1F_WIDTH ; SS_ANNE_1F_ROOMS
	warp_to 15, 8, SS_ANNE_1F_WIDTH ; SS_ANNE_1F_ROOMS
	warp_to 11, 8, SS_ANNE_1F_WIDTH ; SS_ANNE_1F_ROOMS
	warp_to 7, 8, SS_ANNE_1F_WIDTH ; SS_ANNE_1F_ROOMS
	warp_to 2, 6, SS_ANNE_1F_WIDTH ; SS_ANNE_2F
	warp_to 37, 15, SS_ANNE_1F_WIDTH ; SS_ANNE_B1F
	warp_to 3, 16, SS_ANNE_1F_WIDTH ; SS_ANNE_KITCHEN
