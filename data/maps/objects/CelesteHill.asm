CelesteHill_Object:
	db $0 ; border block

	def_warp_events
	warp_event 12, 23, BRUNSWICK_TRAIL, 1
	warp_event 13, 23, BRUNSWICK_TRAIL, 1

	def_bg_events
	bg_event 12, 20, 2
	bg_event 12,  8, 3

	def_object_events
	object_event 12,  7, SPRITE_BIRD, STAY, DOWN, 1 ; person
	object_event 13,  6, SPRITE_BIRD, STAY, DOWN, 1 ; person
	object_event 11,  6, SPRITE_BIRD, STAY, DOWN, 1, MOLTRES_G, 70 | OW_POKEMON ; person

	def_warps_to CELESTE_HILL