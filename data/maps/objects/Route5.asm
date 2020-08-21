Route5_Object:
	db $a ; border block

	def_warps
	warp 10, 29, 3, ROUTE_5_GATE
	warp  9, 29, 2, ROUTE_5_GATE
	warp 10, 33, 0, ROUTE_5_GATE
	warp 17, 27, 0, UNDERGROUND_PATH_ROUTE_5
	warp 10, 21, 0, DAYCARE

	def_signs
	sign 17, 29, 1 ; Route5Text1

	def_objects

	def_warps_to ROUTE_5
