CeladonMart1F_Object:
	db $f ; border block

	db 6 ; warps
	warp 2, 7, 0, LAST_MAP
	warp 3, 7, 0, LAST_MAP
	warp 16, 7, 1, LAST_MAP
	warp 17, 7, 1, LAST_MAP
	warp 12, 1, 0, CELADON_MART_2F
	warp 1, 1, 0, CELADON_MART_ELEVATOR

	db 2 ; signs
	sign 11, 4, 2 ; CeladonMart1Text2
	sign 14, 1, 3 ; CeladonMart1Text3

	db 1 ; objects
	object SPRITE_LINK_RECEPTIONIST, 8, 3, STAY, DOWN, 1 ; person

	; warp-to
	warp_to 2, 7, CELADON_MART_1F_WIDTH
	warp_to 3, 7, CELADON_MART_1F_WIDTH
	warp_to 16, 7, CELADON_MART_1F_WIDTH
	warp_to 17, 7, CELADON_MART_1F_WIDTH
	warp_to 12, 1, CELADON_MART_1F_WIDTH ; CELADON_MART_2F
	warp_to 1, 1, CELADON_MART_1F_WIDTH ; CELADON_MART_ELEVATOR
