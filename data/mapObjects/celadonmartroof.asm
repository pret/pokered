CeladonMartRoofObject:
	db 66 ; border block

	db 1 ; warps
	warp 15, 2, 0, CELADON_MART_5

	db 4 ; signs
	sign 10, 1, 3 ; CeladonMartRoofText3
	sign 11, 1, 4 ; CeladonMartRoofText4
	sign 12, 2, 5 ; CeladonMartRoofText5
	sign 13, 2, 6 ; CeladonMartRoofText6

	db 2 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, 10, 4, STAY, LEFT, 1 ; person
	object SPRITE_LITTLE_GIRL, 5, 5, WALK, 0, 2 ; person

	; warp-to
	warp_to 15, 2, CELADON_MART_ROOF_WIDTH ; CELADON_MART_5
