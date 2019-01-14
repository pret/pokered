SSAnne1FRooms_Object:
	db $c ; border block

	db 6 ; warps
	warp 0, 0, 2, SS_ANNE_1F
	warp 10, 0, 3, SS_ANNE_1F
	warp 20, 0, 4, SS_ANNE_1F
	warp 0, 10, 5, SS_ANNE_1F
	warp 10, 10, 6, SS_ANNE_1F
	warp 20, 10, 7, SS_ANNE_1F

	db 0 ; signs

	db 11 ; objects
	object SPRITE_GENTLEMAN, 2, 3, STAY, LEFT, 1, OPP_GENTLEMAN, 1
	object SPRITE_GENTLEMAN, 11, 4, STAY, UP, 2, OPP_GENTLEMAN, 2
	object SPRITE_BUG_CATCHER, 11, 14, STAY, UP, 3, OPP_YOUNGSTER, 8
	object SPRITE_LASS, 13, 11, STAY, LEFT, 4, OPP_LASS, 11
	object SPRITE_GIRL, 22, 3, WALK, 1, 5 ; person
	object SPRITE_FAT_BALD_GUY, 0, 14, STAY, NONE, 6 ; person
	object SPRITE_LITTLE_GIRL, 2, 11, STAY, DOWN, 7 ; person
	object SPRITE_CLEFAIRY, 3, 11, STAY, DOWN, 8 ; person
	object SPRITE_GIRL, 10, 13, STAY, RIGHT, 9 ; person
	object SPRITE_BALL, 12, 15, STAY, NONE, 10, TM_08
	object SPRITE_GENTLEMAN, 21, 13, WALK, 2, 11 ; person

	; warp-to
	warp_to 0, 0, SS_ANNE_1F_ROOMS_WIDTH ; SS_ANNE_1F
	warp_to 10, 0, SS_ANNE_1F_ROOMS_WIDTH ; SS_ANNE_1F
	warp_to 20, 0, SS_ANNE_1F_ROOMS_WIDTH ; SS_ANNE_1F
	warp_to 0, 10, SS_ANNE_1F_ROOMS_WIDTH ; SS_ANNE_1F
	warp_to 10, 10, SS_ANNE_1F_ROOMS_WIDTH ; SS_ANNE_1F
	warp_to 20, 10, SS_ANNE_1F_ROOMS_WIDTH ; SS_ANNE_1F
