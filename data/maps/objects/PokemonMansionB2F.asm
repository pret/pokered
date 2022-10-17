PokemonMansionB2F_Object:
	db $0D ; border block

	def_warp_events
	warp_event 26, 22, CINNABAR_ISLAND, 1 ; this should not be accessible, only something the player arrives at.
	warp_event 27,  2, CINNABAR_ISLAND, 6

	def_bg_events
	bg_event 23,  0, 14  ; photo
	bg_event 18,  2, 15 ; starter pod
	bg_event 14,  2, 16 ; starter pod
	bg_event 10,  2, 17 ; starter pod
	bg_event  6,  2, 18 ; amber's pod
	bg_event  1,  2, 19 ; mewtwo's pod
	bg_event 12,  6, 20 ; computer 1
	bg_event 14,  6, 21 ; computer 2
	bg_event 16,  6, 22 ; computer 3, missingno

	def_object_events
	object_event  7,  8, SPRITE_POKEDEX, STAY, NONE, 1 ; Book 1
	object_event 26,  6, SPRITE_POKEDEX, STAY, NONE, 2 ; Book 2
	object_event  8,  8, SPRITE_POKE_BALL, STAY, NONE, 3, TM_PSYCHIC_M
	object_event 25,  6, SPRITE_POKE_BALL, STAY, NONE, 4, RARE_CANDY
	object_event  6, 17, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 5 ; person
	object_event  9, 18, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 6 ; person
	object_event  5, 22, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 7 ; person
	object_event 17, 22, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 8 ; person
	object_event 11, 21, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 9 ; person
	object_event  8, 19, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 10 ; person
	object_event  5, 17, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 11 ; person
	object_event  7, 18, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 12 ; person
	object_event 12, 22, SPRITE_BOULDER, STAY, BOULDER_MOVEMENT_BYTE_2, 13 ; person

	def_warps_to POKEMON_MANSION_B2F