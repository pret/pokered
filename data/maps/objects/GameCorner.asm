GameCorner_Object:
	db $f ; border block

	db 3 ; warps
	warp 15, 17, 7, -1
	warp 16, 17, 7, -1
	warp 17, 4, 1, ROCKET_HIDEOUT_B1F

	db 1 ; signs
	sign 9, 4, 12 ; CeladonGameCornerText12

	db 11 ; objects
	object SPRITE_FOULARD_WOMAN, 2, 6, STAY, DOWN, 1 ; person
	object SPRITE_MART_GUY, 5, 6, STAY, DOWN, 2 ; person
	object SPRITE_FAT_BALD_GUY, 2, 10, STAY, LEFT, 3 ; person
	object SPRITE_FOULARD_WOMAN, 2, 13, STAY, LEFT, 4 ; person
	object SPRITE_FISHER, 5, 11, STAY, RIGHT, 5 ; person
	object SPRITE_MOM_GEISHA, 8, 11, STAY, LEFT, 6 ; person
	object SPRITE_GYM_HELPER, 8, 14, STAY, LEFT, 7 ; person
	object SPRITE_GAMBLER, 11, 15, STAY, RIGHT, 8 ; person
	object SPRITE_MART_GUY, 14, 11, STAY, LEFT, 9 ; person
	object SPRITE_GENTLEMAN, 17, 13, STAY, RIGHT, 10 ; person
	object SPRITE_ROCKET, 9, 5, STAY, UP, 11, OPP_ROCKET, 7

	; warp-to
	warp_to 15, 17, GAME_CORNER_WIDTH
	warp_to 16, 17, GAME_CORNER_WIDTH
	warp_to 17, 4, GAME_CORNER_WIDTH ; ROCKET_HIDEOUT_B1F
