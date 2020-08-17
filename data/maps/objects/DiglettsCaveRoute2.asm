DiglettsCaveRoute2_Object:
	db $7d ; border block

	def_warps
	warp 2, 7, 0, LAST_MAP
	warp 3, 7, 0, LAST_MAP
	warp 4, 4, 0, DIGLETTS_CAVE

	def_signs

	def_objects
	object SPRITE_FISHING_GURU, 3, 3, STAY, NONE, 1 ; person

	; warp-to
	warp_to 2, 7, DIGLETTS_CAVE_ROUTE_2_WIDTH
	warp_to 3, 7, DIGLETTS_CAVE_ROUTE_2_WIDTH
	warp_to 4, 4, DIGLETTS_CAVE_ROUTE_2_WIDTH ; DIGLETTS_CAVE
