BikeShop_Object:
	db $e ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_BIKE_SHOP_CLERK, STAY, NONE, 1 ; person
	object_event  5,  6, SPRITE_MIDDLE_AGED_WOMAN, WALK, UP_DOWN, 2 ; person
	object_event  1,  3, SPRITE_YOUNGSTER, STAY, UP, 3 ; person

	def_warps_to BIKE_SHOP
