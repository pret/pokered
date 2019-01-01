PewterNidoranHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 3, -1
	warp 3, 7, 3, -1

	db 0 ; signs

	db 3 ; objects
	object SPRITE_SLOWBRO, 4, 5, STAY, LEFT, 1 ; person
	object SPRITE_YOUNG_BOY, 3, 5, STAY, RIGHT, 2 ; person
	object SPRITE_FAT_BALD_GUY, 1, 2, STAY, NONE, 3 ; person

	; warp-to
	warp_to 2, 7, PEWTER_NIDORAN_HOUSE_WIDTH
	warp_to 3, 7, PEWTER_NIDORAN_HOUSE_WIDTH
