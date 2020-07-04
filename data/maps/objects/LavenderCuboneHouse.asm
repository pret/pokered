LavenderCuboneHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 4, -1
	warp 3, 7, 4, -1

	db 0 ; signs

	db 2 ; objects
	object SPRITE_SLOWBRO, 3, 5, STAY, UP, 1 ; person
	object SPRITE_BRUNETTE_GIRL, 2, 4, STAY, RIGHT, 2 ; person

	; warp-to
	warp_to 2, 7, LAVENDER_CUBONE_HOUSE_WIDTH
	warp_to 3, 7, LAVENDER_CUBONE_HOUSE_WIDTH
