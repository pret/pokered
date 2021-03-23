BikeShop_Object:
	db $e ; border block

	def_warps
	warp  2,  7, 4, LAST_MAP
	warp  3,  7, 4, LAST_MAP

	def_signs

	def_objects
	object SPRITE_BIKE_SHOP_CLERK, 6, 2, STAY, NONE, 1 ; person
	object SPRITE_MIDDLE_AGED_WOMAN, 5, 6, WALK, UP_DOWN, 2 ; person
	object SPRITE_YOUNGSTER, 1, 3, STAY, UP, 3 ; person

	def_warps_to BIKE_SHOP
