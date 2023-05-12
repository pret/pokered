CitrineCity_Object:
	db $43 ; border block

	def_warp_events
	warp_event  9, 27, CITRINE_ROCKET_HOUSE, 1
	warp_event  9, 17, CITRINE_TRADEBACK_HOUSE, 1
	warp_event 15, 17, CITRINE_POKECENTER, 1
	warp_event 15, 27, CITRINE_MART, 1
	warp_event 22,  5, GARNET_CAVERN_1F, 1
	warp_event 35, 31, VERMILION_CITY, 6
	warp_event 35, 30, VERMILION_CITY, 6

	def_bg_events
	bg_event 16, 27,  5 ; Citrine Shop
	bg_event 16, 17,  6 ; Pokecenter
	bg_event 20, 22,  7 ; Billboard 1
	bg_event  5, 18,  8 ; Billboard 2
	bg_event  9,  7,  9 ; Battle Tower
	bg_event 25, 23, 10 ; City Sign
	bg_event 21, 26, 11 ; Directions
	bg_event 23,  7, 12 ; Garnet Cavern Sign

	def_object_events
	object_event 12, 18, SPRITE_BEAUTY, WALK, LEFT_RIGHT, 1 ; person
	object_event  6,  9, SPRITE_HIKER,  WALK, LEFT_RIGHT, 2 ; person
	object_event 20, 26, SPRITE_GENTLEMAN, STAY, UP, 3 ; person
	object_event 10, 30, SPRITE_ROCKER, WALK, ANY_DIR, 4 ; person

	def_warps_to CITRINE_CITY
