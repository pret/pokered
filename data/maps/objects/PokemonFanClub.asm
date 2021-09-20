PokemonFanClub_Object:
	db $d ; border block

	def_warp_events
	warp_event  2,  7, 1, LAST_MAP
	warp_event  3,  7, 1, LAST_MAP

	def_bg_events
	bg_event  1,  0, 7 ; FanClubText7
	bg_event  6,  0, 8 ; FanClubText8

	def_object_events
	object_event SPRITE_FISHER, 6, 3, STAY, LEFT, 1 ; person
	object_event SPRITE_GIRL, 1, 3, STAY, RIGHT, 2 ; person
	object_event SPRITE_FAIRY, 6, 4, STAY, LEFT, 3 ; person
	object_event SPRITE_SEEL, 1, 4, STAY, RIGHT, 4 ; person
	object_event SPRITE_GENTLEMAN, 3, 1, STAY, DOWN, 5 ; person
	object_event SPRITE_LINK_RECEPTIONIST, 5, 1, STAY, DOWN, 6 ; person

	def_warps_to POKEMON_FAN_CLUB
