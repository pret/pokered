PewterNidoranHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 3, LAST_MAP
	warp 3, 7, 3, LAST_MAP

	db 0 ; signs

	db 3 ; objects
	object SPRITE_MONSTER, 4, 5, STAY, LEFT, 1 ; person
	object SPRITE_LITTLE_BOY, 3, 5, STAY, RIGHT, 2 ; person
	object SPRITE_MIDDLE_AGED_MAN, 1, 2, STAY, NONE, 3 ; person

	; warp-to
	warp_to 2, 7, PEWTER_NIDORAN_HOUSE_WIDTH
	warp_to 3, 7, PEWTER_NIDORAN_HOUSE_WIDTH
