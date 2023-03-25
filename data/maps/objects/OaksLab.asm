OaksLab_Object:
	db $3 ; border block

	def_warp_events
	warp_event  6, 11, LAST_MAP, 3
	warp_event  7, 11, LAST_MAP, 3

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_BLUE, STAY, NONE, 1, OPP_RIVAL1, 1
	object_event  8,  3, SPRITE_POKE_BALL, STAY, NONE, 2 ; person
	object_event  9,  3, SPRITE_POKE_BALL, STAY, NONE, 3 ; person
	object_event 10,  3, SPRITE_POKE_BALL, STAY, NONE, 4 ; person
	object_event  7,  2, SPRITE_OAK, STAY, DOWN, 5 ; person
	;object_event  4,  1, SPRITE_POKEDEX, STAY, NONE, 6 ; person - remove these
	;object_event  5,  1, SPRITE_POKEDEX, STAY, NONE, 7 ; person
	object_event  7, 10, SPRITE_OAK, STAY, UP, 6 ; person
	;object_event  2, 11, SPRITE_GIRL, WALK, UP_DOWN, 9 ; person
	;object_event  4, 11, SPRITE_SCIENTIST, STAY, NONE, 10 ; person
	;object_event 11, 11, SPRITE_SCIENTIST, STAY, NONE, 11 ; person
	object_event  4,  3, SPRITE_POKE_BALL, STAY, NONE, 28 ; person, Pikachu
	object_event  5,  3, SPRITE_POKE_BALL, STAY, NONE, 29 ; person, Eevee

	def_warps_to OAKS_LAB
