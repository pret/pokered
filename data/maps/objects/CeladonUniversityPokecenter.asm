CeladonUniversityPokecenter_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, CELADON_UNIVERSITY_OUTSIDE, 2
	warp_event  4,  7, CELADON_UNIVERSITY_OUTSIDE, 2

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, STAY, DOWN, 1 ; person
	object_event  8,  3, SPRITE_SCIENTIST, STAY, LEFT_RIGHT, 2 ; person
	object_event 10,  5, SPRITE_MIDDLE_AGED_MAN, WALK, ANY_DIR, 3 ; spamton
	object_event  3,  5, SPRITE_SUPER_NERD, STAY, DOWN, 4 ; person
	object_event 11,  2, SPRITE_LINK_RECEPTIONIST, STAY, DOWN, 4 ; person

	def_warps_to CELADON_UNIVERSITY_POKECENTER
