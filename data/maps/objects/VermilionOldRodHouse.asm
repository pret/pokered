VermilionOldRodHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 8, -1
	warp 3, 7, 8, -1

	db 0 ; signs

	db 1 ; objects
	object SPRITE_FISHER, 2, 4, STAY, RIGHT, 1 ; person

	; warp-to
	warp_to 2, 7, VERMILION_OLD_ROD_HOUSE_WIDTH
	warp_to 3, 7, VERMILION_OLD_ROD_HOUSE_WIDTH
