LavenderTown_Object:
	db $2c ; border block

	def_warp_events
	warp_event  3,  5, 0, LAVENDER_POKECENTER
	warp_event 14,  5, 0, POKEMON_TOWER_1F
	warp_event  7,  9, 0, MR_FUJIS_HOUSE
	warp_event 15, 13, 0, LAVENDER_MART
	warp_event  3, 13, 0, LAVENDER_CUBONE_HOUSE
	warp_event  7, 13, 0, NAME_RATERS_HOUSE

	def_bg_events
	bg_event 11,  9, 4 ; LavenderTownText4
	bg_event  9,  3, 5 ; LavenderTownText5
	bg_event 16, 13, 6 ; MartSignText
	bg_event  4,  5, 7 ; PokeCenterSignText
	bg_event  5,  9, 8 ; LavenderTownText8
	bg_event 17,  7, 9 ; LavenderTownText9

	def_objects
	object SPRITE_LITTLE_GIRL, 15, 9, WALK, ANY_DIR, 1 ; person
	object SPRITE_COOLTRAINER_M, 9, 10, STAY, NONE, 2 ; person
	object SPRITE_SUPER_NERD, 8, 7, WALK, LEFT_RIGHT, 3 ; person

	def_warps_to LAVENDER_TOWN
