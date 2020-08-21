Route2_Object:
	db $f ; border block

	def_warps
	warp 12,  9, 0, DIGLETTS_CAVE_ROUTE_2
	warp  3, 11, 1, VIRIDIAN_FOREST_NORTH_GATE
	warp 15, 19, 0, ROUTE_2_TRADE_HOUSE
	warp 16, 35, 1, ROUTE_2_GATE
	warp 15, 39, 2, ROUTE_2_GATE
	warp  3, 43, 2, VIRIDIAN_FOREST_SOUTH_GATE

	def_signs
	sign  5, 65, 3 ; Route2Text3
	sign 11, 11, 4 ; Route2Text4

	def_objects
	object SPRITE_POKE_BALL, 13, 54, STAY, NONE, 1, MOON_STONE
	object SPRITE_POKE_BALL, 13, 45, STAY, NONE, 2, HP_UP

	def_warps_to ROUTE_2

	; unused
	warp_to 2, 7, 4
	db $12, $c7, $9, $7
	warp_to 2, 7, 4
	warp_to 2, 7, 4
	warp_to 2, 7, 4
