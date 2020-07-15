Daycare_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 4, LAST_MAP
	warp 3, 7, 4, LAST_MAP

	db 0 ; signs

	db 1 ; objects
	object SPRITE_GENTLEMAN, 2, 3, STAY, RIGHT, 1 ; person

	; warp-to
	warp_to 2, 7, DAYCARE_WIDTH
	warp_to 3, 7, DAYCARE_WIDTH
