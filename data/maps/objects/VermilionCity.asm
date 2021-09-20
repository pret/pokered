VermilionCity_Object:
	db $43 ; border block

	def_warps
	warp 11,  3, 0, VERMILION_POKECENTER
	warp  9, 13, 0, POKEMON_FAN_CLUB
	warp 23, 13, 0, VERMILION_MART
	warp 12, 19, 0, VERMILION_GYM
	warp 23, 19, 0, VERMILION_PIDGEY_HOUSE
	warp 18, 31, 0, VERMILION_DOCK
	warp 19, 31, 0, VERMILION_DOCK
	warp 15, 13, 0, VERMILION_TRADE_HOUSE
	warp  7,  3, 0, VERMILION_OLD_ROD_HOUSE

	def_bg_events
	bg_event 27,  3,  7 ; VermilionCityText7
	bg_event 37, 13,  8 ; VermilionCityText8
	bg_event 24, 13,  9 ; MartSignText
	bg_event 12,  3, 10 ; PokeCenterSignText
	bg_event  7, 13, 11 ; VermilionCityText11
	bg_event  7, 19, 12 ; VermilionCityText12
	bg_event 29, 15, 13 ; VermilionCityText13

	def_objects
	object SPRITE_BEAUTY, 19, 7, WALK, LEFT_RIGHT, 1 ; person
	object SPRITE_GAMBLER, 14, 6, STAY, NONE, 2 ; person
	object SPRITE_SAILOR, 19, 30, STAY, UP, 3 ; person
	object SPRITE_GAMBLER, 30, 7, STAY, NONE, 4 ; person
	object SPRITE_MONSTER, 29, 9, WALK, UP_DOWN, 5 ; person
	object SPRITE_SAILOR, 25, 27, WALK, LEFT_RIGHT, 6 ; person

	def_warps_to VERMILION_CITY
