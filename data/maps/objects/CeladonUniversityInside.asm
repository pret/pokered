CeladonUniversityInside_Object:
	db $17 ; border block

	def_warp_events
	warp_event 10, 19, CELADON_UNIVERSITY_OUTSIDE, 1
	warp_event 11, 19, CELADON_UNIVERSITY_OUTSIDE, 1

	def_bg_events
	bg_event  9,  3, 11 ; Magikarp
	bg_event 19,  4, 12 ; PC Screen

	def_object_events
	object_event 18,  5, SPRITE_MIDDLE_AGED_MAN, STAY, ANY_DIR, 1 ; person
	object_event  3, 15, SPRITE_PAPER, STAY, NONE, 2 ; person
	object_event 17,  5, SPRITE_POKEDEX, STAY, NONE, 3 ; person
	object_event 10,  5, SPRITE_SCIENTIST, STAY, NONE, 4 ; person
	object_event  3,  8, SPRITE_PAPER, STAY, NONE, 5 ; Book 1
	object_event  5,  4, SPRITE_PAPER, STAY, NONE, 6 ; Book 2
	object_event  1,  4, SPRITE_PAPER, STAY, NONE, 7 ; Book 3
	object_event 20,  7, SPRITE_MONSTER, STAY, NONE, 8 ; Slowbro
	object_event  1, 17, SPRITE_GAMEBOY_KID, STAY, DOWN, 9
	object_event  3, 17, SPRITE_GAMEBOY_KID, STAY, DOWN, 10

	def_warps_to CELADON_UNIVERSITY_INSIDE