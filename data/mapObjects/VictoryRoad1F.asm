VictoryRoad1F_Object:
	db $7d ; border block

	db 3 ; warps
	warp 8, 17, 2, -1
	warp 9, 17, 2, -1
	warp 1, 1, 0, VICTORY_ROAD_2F

	db 0 ; signs

	db 7 ; objects
	object SPRITE_LASS, 7, 5, STAY, RIGHT, 1, OPP_COOLTRAINER_F, 5
	object SPRITE_BLACK_HAIR_BOY_1, 3, 2, STAY, DOWN, 2, OPP_COOLTRAINER_M, 5
	object SPRITE_BALL, 11, 0, STAY, NONE, 3, TM_43
	object SPRITE_BALL, 9, 2, STAY, NONE, 4, RARE_CANDY
	object SPRITE_BOULDER, 5, 15, STAY, BOULDER_MOVEMENT_BYTE_2, 5 ; person
	object SPRITE_BOULDER, 14, 2, STAY, BOULDER_MOVEMENT_BYTE_2, 6 ; person
	object SPRITE_BOULDER, 2, 10, STAY, BOULDER_MOVEMENT_BYTE_2, 7 ; person

	; warp-to
	warp_to 8, 17, VICTORY_ROAD_1F_WIDTH
	warp_to 9, 17, VICTORY_ROAD_1F_WIDTH
	warp_to 1, 1, VICTORY_ROAD_1F_WIDTH ; VICTORY_ROAD_2F
