GarnetCavernB1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event  3,  6, GARNET_CAVERN_1F, 9
	
	def_bg_events

	def_object_events
	object_event  5, 11, SPRITE_BIRD, STAY, DOWN, 1, ARTICUNO_G, 70 | OW_POKEMON ; person

	def_warps_to GARNET_CAVERN_B1F
