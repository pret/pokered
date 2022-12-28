LavenderTown_Object:
	db $2c ; border block

	def_warp_events
	warp_event  3,  5, LAVENDER_POKECENTER, 1
	warp_event 14,  5, POKEMON_TOWER_1F, 1
	warp_event  7,  9, MR_FUJIS_HOUSE, 1
	warp_event 15, 13, LAVENDER_MART, 1
	warp_event  3, 13, LAVENDER_CUBONE_HOUSE, 1
	warp_event  7, 13, NAME_RATERS_HOUSE, 1

	def_bg_events
	bg_event 11,  9, 4 ; LavenderTownText4
	bg_event  9,  3, 5 ; LavenderTownText5
	bg_event 16, 13, 6 ; MartSignText
	bg_event  4,  5, 7 ; PokeCenterSignText
	bg_event  5,  9, 8 ; LavenderTownText8
	bg_event 17,  7, 9 ; LavenderTownText9

	def_object_events
	object_event 15,  9, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, 1 ; person
	object_event  9, 10, SPRITE_COOLTRAINER_M, STAY, NONE, 2 ; person
	object_event  8,  7, SPRITE_SUPER_NERD, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to LAVENDER_TOWN
