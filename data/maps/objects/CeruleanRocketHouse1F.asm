CeruleanRocketHouse1F_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  5, LAST_MAP, 13
	warp_event  3,  5, LAST_MAP, 13
	warp_event  3,  1, CERULEAN_ROCKET_HOUSE_B1F, 1

	def_bg_events

	def_object_events
	object_event  4,  3, SPRITE_ROCKET, STAY, LEFT, 1 ; person

	def_warps_to CERULEAN_ROCKET_HOUSE_1F
