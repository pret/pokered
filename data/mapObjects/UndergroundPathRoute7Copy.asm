UndergroundPathRoute7Copy_Object:
	db $a ; border block

	db 3 ; warps
	warp 3, 7, 5, -1
	warp 4, 7, 5, -1
	warp 4, 4, 0, UNDERGROUND_PATH_WEST_EAST

	db 0 ; signs

	db 2 ; objects
	object SPRITE_GIRL, 3, 2, STAY, NONE, 1 ; person
	object SPRITE_FAT_BALD_GUY, 2, 4, STAY, NONE, 2 ; person

	; warp-to
	warp_to 3, 7, UNDERGROUND_PATH_ROUTE_7_COPY_WIDTH
	warp_to 4, 7, UNDERGROUND_PATH_ROUTE_7_COPY_WIDTH
	warp_to 4, 4, UNDERGROUND_PATH_ROUTE_7_COPY_WIDTH ; UNDERGROUND_PATH_WEST_EAST
