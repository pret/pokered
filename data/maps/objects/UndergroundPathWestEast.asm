UndergroundPathWestEast_Object:
	db $1 ; border block

	def_warps
	warp 2, 5, 2, UNDERGROUND_PATH_ROUTE_7
	warp 47, 2, 2, UNDERGROUND_PATH_ROUTE_8

	def_signs

	def_objects

	; warp-to
	warp_to 2, 5, UNDERGROUND_PATH_WEST_EAST_WIDTH ; UNDERGROUND_PATH_ROUTE_7
	warp_to 47, 2, UNDERGROUND_PATH_WEST_EAST_WIDTH ; UNDERGROUND_PATH_ROUTE_8
