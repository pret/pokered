UndergroundPathRoute5_Object:
	db $a ; border block

	db 3 ; warps
	warp 3, 7, 3, -1
	warp 4, 7, 3, -1
	warp 4, 4, 0, UNDERGROUND_PATH_NORTH_SOUTH

	db 0 ; signs

	db 1 ; objects
	object SPRITE_LITTLE_GIRL, 2, 3, STAY, NONE, 1 ; person

	; warp-to
	warp_to 3, 7, UNDERGROUND_PATH_ROUTE_5_WIDTH
	warp_to 4, 7, UNDERGROUND_PATH_ROUTE_5_WIDTH
	warp_to 4, 4, UNDERGROUND_PATH_ROUTE_5_WIDTH ; UNDERGROUND_PATH_NORTH_SOUTH
