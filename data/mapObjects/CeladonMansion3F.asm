CeladonMansion3F_Object:
	db $f ; border block

	db 4 ; warps
	warp 6, 1, 0, CELADON_MANSION_2F
	warp 7, 1, 0, CELADON_MANSION_ROOF
	warp 2, 1, 1, CELADON_MANSION_ROOF
	warp 4, 1, 3, CELADON_MANSION_2F

	db 4 ; signs
	sign 1, 3, 5 ; CeladonMansion3Text5
	sign 4, 3, 6 ; CeladonMansion3Text6
	sign 1, 6, 7 ; CeladonMansion3Text7
	sign 4, 9, 8 ; CeladonMansion3Text8

	db 4 ; objects
	object SPRITE_BIKE_SHOP_GUY, 0, 4, STAY, UP, 1 ; person
	object SPRITE_MART_GUY, 3, 4, STAY, UP, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 0, 7, STAY, UP, 3 ; person
	object SPRITE_LAPRAS_GIVER, 2, 3, STAY, NONE, 4 ; person

	; warp-to
	warp_to 6, 1, CELADON_MANSION_3F_WIDTH ; CELADON_MANSION_2F
	warp_to 7, 1, CELADON_MANSION_3F_WIDTH ; CELADON_MANSION_ROOF
	warp_to 2, 1, CELADON_MANSION_3F_WIDTH ; CELADON_MANSION_ROOF
	warp_to 4, 1, CELADON_MANSION_3F_WIDTH ; CELADON_MANSION_2F
