UndergroundPathRoute8_Object:
	db $a ; border block

	db 3 ; warps
	warp 3, 7, 4, -1
	warp 4, 7, 4, -1
	warp 4, 4, 1, UNDERGROUND_PATH_WEST_EAST

	db 0 ; signs

	db 1 ; objects
	object SPRITE_GIRL, 3, 4, STAY, NONE, 1 ; person

	; warp-to
	warp_to 3, 7, UNDERGROUND_PATH_ROUTE_8_WIDTH
	warp_to 4, 7, UNDERGROUND_PATH_ROUTE_8_WIDTH
	warp_to 4, 4, UNDERGROUND_PATH_ROUTE_8_WIDTH ; UNDERGROUND_PATH_WEST_EAST
