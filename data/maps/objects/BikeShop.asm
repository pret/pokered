BikeShop_Object:
	db $e ; border block

	db 2 ; warps
	warp 2, 7, 4, LAST_MAP
	warp 3, 7, 4, LAST_MAP

	db 0 ; signs

	db 3 ; objects
	object SPRITE_BIKE_SHOP_CLERK, 6, 2, STAY, NONE, 1 ; person
	object SPRITE_MIDDLE_AGED_WOMAN, 5, 6, WALK, 1, 2 ; person
	object SPRITE_YOUNGSTER, 1, 3, STAY, UP, 3 ; person

	; warp-to
	warp_to 2, 7, BIKE_SHOP_WIDTH
	warp_to 3, 7, BIKE_SHOP_WIDTH
