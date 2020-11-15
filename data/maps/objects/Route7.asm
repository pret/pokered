Route7_Object:
	db $f ; border block

	def_warps
	warp 18,  9, 2, ROUTE_7_GATE
	warp 18, 10, 3, ROUTE_7_GATE
	warp 11,  9, 0, ROUTE_7_GATE
	warp 11, 10, 1, ROUTE_7_GATE
	warp  5, 13, 0, UNDERGROUND_PATH_ROUTE_7

	def_signs
	sign  3, 13, 1 ; Route7Text1

	def_objects

	def_warps_to ROUTE_7
