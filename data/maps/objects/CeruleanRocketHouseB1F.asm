CeruleanRocketHouseB1F_Object:
	db $17 ; border block

	def_warp_events
	warp_event  14, 14, CERULEAN_ROCKET_HOUSE_1F, 3
	warp_event   2, 10, CERULEAN_ROCKET_HOUSE_B1F, 3
	warp_event   0,  4, CERULEAN_ROCKET_HOUSE_B1F, 2

	def_bg_events
	bg_event 15, 14, 2
	bg_event  3, 10, 3 
	bg_event  1,  4, 4
	bg_event 13, 10, 5

	def_object_events
	object_event  8, 6, SPRITE_ROCKET, STAY, DOWN, 1 ; person

	def_warps_to CERULEAN_ROCKET_HOUSE_B1F
