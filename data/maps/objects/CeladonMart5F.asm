CeladonMart5F_Object:
	db $f ; border block

	db 3 ; warps
	warp 12, 1, 0, CELADON_MART_ROOF
	warp 16, 1, 1, CELADON_MART_4F
	warp 1, 1, 0, CELADON_MART_ELEVATOR

	db 1 ; signs
	sign 14, 1, 5 ; CeladonMart5Text5

	db 4 ; objects
	object SPRITE_GENTLEMAN, 14, 5, WALK, 1, 1 ; person
	object SPRITE_SAILOR, 2, 6, STAY, NONE, 2 ; person
	object SPRITE_MART_GUY, 5, 3, STAY, DOWN, 3 ; person
	object SPRITE_MART_GUY, 6, 3, STAY, DOWN, 4 ; person

	; warp-to
	warp_to 12, 1, CELADON_MART_5F_WIDTH ; CELADON_MART_ROOF
	warp_to 16, 1, CELADON_MART_5F_WIDTH ; CELADON_MART_4F
	warp_to 1, 1, CELADON_MART_5F_WIDTH ; CELADON_MART_ELEVATOR
