VermilionCity_Object:
	db $43 ; border block

	def_warp_events
	warp_event 11,  3, 0, VERMILION_POKECENTER
	warp_event  9, 13, 0, POKEMON_FAN_CLUB
	warp_event 23, 13, 0, VERMILION_MART
	warp_event 12, 19, 0, VERMILION_GYM
	warp_event 23, 19, 0, VERMILION_PIDGEY_HOUSE
	warp_event 18, 31, 0, VERMILION_DOCK
	warp_event 19, 31, 0, VERMILION_DOCK
	warp_event 15, 13, 0, VERMILION_TRADE_HOUSE
	warp_event  7,  3, 0, VERMILION_OLD_ROD_HOUSE

	def_bg_events
	bg_event 27,  3,  7 ; VermilionCityText7
	bg_event 37, 13,  8 ; VermilionCityText8
	bg_event 24, 13,  9 ; MartSignText
	bg_event 12,  3, 10 ; PokeCenterSignText
	bg_event  7, 13, 11 ; VermilionCityText11
	bg_event  7, 19, 12 ; VermilionCityText12
	bg_event 29, 15, 13 ; VermilionCityText13

	def_object_events
	object_event SPRITE_BEAUTY, 19, 7, WALK, LEFT_RIGHT, 1 ; person
	object_event SPRITE_GAMBLER, 14, 6, STAY, NONE, 2 ; person
	object_event SPRITE_SAILOR, 19, 30, STAY, UP, 3 ; person
	object_event SPRITE_GAMBLER, 30, 7, STAY, NONE, 4 ; person
	object_event SPRITE_MONSTER, 29, 9, WALK, UP_DOWN, 5 ; person
	object_event SPRITE_SAILOR, 25, 27, WALK, LEFT_RIGHT, 6 ; person

	def_warps_to VERMILION_CITY
