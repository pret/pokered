DiglettsCaveRoute11_Object:
	db $7d ; border block

	def_warps
	warp  2,  7, 4, LAST_MAP
	warp  3,  7, 4, LAST_MAP
	warp  4,  4, 1, DIGLETTS_CAVE

	def_signs

	def_objects
	object SPRITE_GAMBLER, 2, 3, STAY, NONE, 1 ; person

	def_warps_to DIGLETTS_CAVE_ROUTE_11
