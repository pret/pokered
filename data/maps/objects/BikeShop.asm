	object_const_def
	const_export BIKESHOP_CLERK
	const_export BIKESHOP_MIDDLE_AGED_WOMAN
	const_export BIKESHOP_YOUNGSTER

BikeShop_Object:
	db $e ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 5
	warp_event  3,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  6,  2, SPRITE_BIKE_SHOP_CLERK, STAY, NONE, TEXT_BIKESHOP_CLERK
	object_event  5,  6, SPRITE_MIDDLE_AGED_WOMAN, WALK, UP_DOWN, TEXT_BIKESHOP_MIDDLE_AGED_WOMAN
	object_event  1,  3, SPRITE_YOUNGSTER, STAY, UP, TEXT_BIKESHOP_YOUNGSTER

	def_warps_to BIKE_SHOP
