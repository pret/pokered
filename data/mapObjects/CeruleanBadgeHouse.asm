CeruleanBadgeHouse_Object:
	db $c ; border block

	db 3 ; warps
	warp 2, 0, 9, -1
	warp 2, 7, 8, -1
	warp 3, 7, 8, -1

	db 0 ; signs

	db 1 ; objects
	object SPRITE_FAT_BALD_GUY, 5, 3, STAY, RIGHT, 1 ; person

	; warp-to
	warp_to 2, 0, CERULEAN_BADGE_HOUSE_WIDTH
	warp_to 2, 7, CERULEAN_BADGE_HOUSE_WIDTH
	warp_to 3, 7, CERULEAN_BADGE_HOUSE_WIDTH
