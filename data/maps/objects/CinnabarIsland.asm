CinnabarIsland_Object:
	db $43 ; border block

	def_warp_events
	warp_event  6,  3, POKEMON_MANSION_1F, 2
	warp_event 18,  3, CINNABAR_GYM, 1
	warp_event  6,  9, CINNABAR_LAB, 1
	warp_event 11, 11, CINNABAR_POKECENTER, 1
	warp_event 15, 11, CINNABAR_MART, 1

	def_bg_events
	bg_event  9,  5, 3 ; CinnabarIslandText3
	bg_event 16, 11, 4 ; MartSignText
	bg_event 12, 11, 5 ; PokeCenterSignText
	bg_event  9, 11, 6 ; CinnabarIslandText6
	bg_event 13,  3, 7 ; CinnabarIslandText7

	def_object_events
	object_event 12,  5, SPRITE_GIRL, WALK, LEFT_RIGHT, 1 ; person
	object_event 14,  6, SPRITE_GAMBLER, STAY, NONE, 2 ; person

	def_warps_to CINNABAR_ISLAND
