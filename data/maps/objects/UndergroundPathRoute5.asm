UndergroundPathRoute5_Object:
	db $a ; border block

	def_warps
	warp 3, 7, 3, LAST_MAP
	warp 4, 7, 3, LAST_MAP
	warp 4, 4, 0, UNDERGROUND_PATH_NORTH_SOUTH

	def_signs

	def_objects
	object SPRITE_LITTLE_GIRL, 2, 3, STAY, NONE, 1 ; person

	; warp-to
	warp_to 3, 7, UNDERGROUND_PATH_ROUTE_5_WIDTH
	warp_to 4, 7, UNDERGROUND_PATH_ROUTE_5_WIDTH
	warp_to 4, 4, UNDERGROUND_PATH_ROUTE_5_WIDTH ; UNDERGROUND_PATH_NORTH_SOUTH
