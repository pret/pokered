CeladonMansionRoofHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 2, CELADON_MANSION_ROOF
	warp 3, 7, 2, CELADON_MANSION_ROOF

	db 0 ; signs

	db 2 ; objects
	object SPRITE_HIKER, 2, 2, STAY, DOWN, 1 ; person
	object SPRITE_BALL, 4, 3, STAY, NONE, 2 ; person

	; warp-to
	warp_to 2, 7, CELADON_MANSION_ROOF_HOUSE_WIDTH ; CELADON_MANSION_ROOF
	warp_to 3, 7, CELADON_MANSION_ROOF_HOUSE_WIDTH ; CELADON_MANSION_ROOF
