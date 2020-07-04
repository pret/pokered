CeladonMart3F_Object:
	db $f ; border block

	db 3 ; warps
	warp 12, 1, 0, CELADON_MART_4F
	warp 16, 1, 1, CELADON_MART_2F
	warp 1, 1, 0, CELADON_MART_ELEVATOR

	db 12 ; signs
	sign 2, 4, 6 ; CeladonMart3Text6
	sign 3, 4, 7 ; CeladonMart3Text7
	sign 5, 4, 8 ; CeladonMart3Text8
	sign 6, 4, 9 ; CeladonMart3Text9
	sign 2, 6, 10 ; CeladonMart3Text10
	sign 3, 6, 11 ; CeladonMart3Text11
	sign 5, 6, 12 ; CeladonMart3Text12
	sign 6, 6, 13 ; CeladonMart3Text13
	sign 14, 1, 14 ; CeladonMart3Text14
	sign 4, 1, 15 ; CeladonMart3Text15
	sign 6, 1, 16 ; CeladonMart3Text16
	sign 10, 1, 17 ; CeladonMart3Text17

	db 5 ; objects
	object SPRITE_MART_GUY, 16, 5, STAY, NONE, 1 ; person
	object SPRITE_GAMEBOY_KID_COPY, 11, 6, STAY, RIGHT, 2 ; person
	object SPRITE_GAMEBOY_KID_COPY, 7, 2, STAY, DOWN, 3 ; person
	object SPRITE_GAMEBOY_KID_COPY, 8, 2, STAY, DOWN, 4 ; person
	object SPRITE_YOUNG_BOY, 2, 5, STAY, UP, 5 ; person

	; warp-to
	warp_to 12, 1, CELADON_MART_3F_WIDTH ; CELADON_MART_4F
	warp_to 16, 1, CELADON_MART_3F_WIDTH ; CELADON_MART_2F
	warp_to 1, 1, CELADON_MART_3F_WIDTH ; CELADON_MART_ELEVATOR
