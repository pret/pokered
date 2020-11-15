Route16FlyHouse_Object:
	db $a ; border block

	def_warps
	warp  2,  7, 8, LAST_MAP
	warp  3,  7, 8, LAST_MAP

	def_signs

	def_objects
	object SPRITE_BRUNETTE_GIRL, 2, 3, STAY, RIGHT, 1 ; person
	object SPRITE_BIRD, 6, 4, WALK, ANY_DIR, 2 ; person

	def_warps_to ROUTE_16_FLY_HOUSE
