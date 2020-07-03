CeladonMart2F_Object:
	db $f ; border block

	db 3 ; warps
	warp 12, 1, 4, CELADON_MART_1F
	warp 16, 1, 1, CELADON_MART_3F
	warp 1, 1, 0, CELADON_MART_ELEVATOR

	db 1 ; signs
	sign 14, 1, 5 ; CeladonMart2Text5

	db 4 ; objects
	object SPRITE_MART_GUY, 5, 3, STAY, DOWN, 1 ; person
	object SPRITE_MART_GUY, 6, 3, STAY, DOWN, 2 ; person
	object SPRITE_FAT_BALD_GUY, 19, 5, STAY, NONE, 3 ; person
	object SPRITE_GIRL, 14, 4, WALK, 1, 4 ; person

	; warp-to
	warp_to 12, 1, CELADON_MART_2F_WIDTH ; CELADON_MART_1F
	warp_to 16, 1, CELADON_MART_2F_WIDTH ; CELADON_MART_3F
	warp_to 1, 1, CELADON_MART_2F_WIDTH ; CELADON_MART_ELEVATOR
