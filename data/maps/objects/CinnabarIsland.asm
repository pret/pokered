CinnabarIsland_Object:
	db $43 ; border block

	def_warp_events
	warp_event  6,  15, POKEMON_MANSION_1F, 2
	warp_event 20,  9, CINNABAR_GYM, 1
	warp_event  6,  21, CINNABAR_LAB, 1
	warp_event 15, 17, CINNABAR_POKECENTER, 1
	warp_event 21, 19, CINNABAR_MART, 1
	warp_event 14, 11, CINNABAR_VOLCANO, 1

	def_bg_events
	bg_event 11,  15, 3 ; CinnabarIslandText3
	bg_event 22, 19, 4 ; MartSignText
	bg_event 16, 17, 5 ; PokeCenterSignText
	bg_event  9, 23, 6 ; CinnabarIslandText6
	bg_event  23,  13, 7 ; CinnabarIslandText7

	def_object_events
	object_event 11, 18,  SPRITE_GIRL, WALK, LEFT_RIGHT, 1 ; person
	object_event 17, 20, SPRITE_GAMBLER, STAY, NONE, 2 ; person

	def_warps_to CINNABAR_ISLAND
