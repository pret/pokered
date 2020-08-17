UndergroundPathNorthSouth_Object:
	db $1 ; border block

	def_warps
	warp 5, 4, 2, UNDERGROUND_PATH_ROUTE_5
	warp 2, 41, 2, UNDERGROUND_PATH_ROUTE_6

	def_signs

	def_objects

	; warp-to
	warp_to 5, 4, UNDERGROUND_PATH_NORTH_SOUTH_WIDTH ; UNDERGROUND_PATH_ROUTE_5
	warp_to 2, 41, UNDERGROUND_PATH_NORTH_SOUTH_WIDTH ; UNDERGROUND_PATH_ROUTE_6
