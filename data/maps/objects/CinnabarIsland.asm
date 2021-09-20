CinnabarIsland_Object:
	db $43 ; border block

	def_warp_events
	warp_event  6,  3, 1, POKEMON_MANSION_1F
	warp_event 18,  3, 0, CINNABAR_GYM
	warp_event  6,  9, 0, CINNABAR_LAB
	warp_event 11, 11, 0, CINNABAR_POKECENTER
	warp_event 15, 11, 0, CINNABAR_MART

	def_bg_events
	bg_event  9,  5, 3 ; CinnabarIslandText3
	bg_event 16, 11, 4 ; MartSignText
	bg_event 12, 11, 5 ; PokeCenterSignText
	bg_event  9, 11, 6 ; CinnabarIslandText6
	bg_event 13,  3, 7 ; CinnabarIslandText7

	def_object_events
	object_event SPRITE_GIRL, 12, 5, WALK, LEFT_RIGHT, 1 ; person
	object_event SPRITE_GAMBLER, 14, 6, STAY, NONE, 2 ; person

	def_warps_to CINNABAR_ISLAND
