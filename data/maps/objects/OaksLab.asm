OaksLab_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, 2, LAST_MAP
	warp_event  5, 11, 2, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_BLUE, 4, 3, STAY, NONE, 1, OPP_RIVAL1, 1
	object_event SPRITE_POKE_BALL, 6, 3, STAY, NONE, 2 ; person
	object_event SPRITE_POKE_BALL, 7, 3, STAY, NONE, 3 ; person
	object_event SPRITE_POKE_BALL, 8, 3, STAY, NONE, 4 ; person
	object_event SPRITE_OAK, 5, 2, STAY, DOWN, 5 ; person
	object_event SPRITE_POKEDEX, 2, 1, STAY, NONE, 6 ; person
	object_event SPRITE_POKEDEX, 3, 1, STAY, NONE, 7 ; person
	object_event SPRITE_OAK, 5, 10, STAY, UP, 8 ; person
	object_event SPRITE_GIRL, 1, 9, WALK, UP_DOWN, 9 ; person
	object_event SPRITE_SCIENTIST, 2, 10, STAY, NONE, 10 ; person
	object_event SPRITE_SCIENTIST, 8, 10, STAY, NONE, 11 ; person

	def_warps_to OAKS_LAB
