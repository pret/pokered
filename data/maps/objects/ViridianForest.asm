ViridianForest_Object:
	db $3 ; border block

	def_warp_events
	warp_event  1,  0, 2, VIRIDIAN_FOREST_NORTH_GATE
	warp_event  2,  0, 3, VIRIDIAN_FOREST_NORTH_GATE
	warp_event 15, 47, 1, VIRIDIAN_FOREST_SOUTH_GATE
	warp_event 16, 47, 1, VIRIDIAN_FOREST_SOUTH_GATE
	warp_event 17, 47, 1, VIRIDIAN_FOREST_SOUTH_GATE
	warp_event 18, 47, 1, VIRIDIAN_FOREST_SOUTH_GATE

	def_bg_events
	bg_event 24, 40,  9 ; ViridianForestText9
	bg_event 16, 32, 10 ; ViridianForestText10
	bg_event 26, 17, 11 ; ViridianForestText11
	bg_event  4, 24, 12 ; ViridianForestText12
	bg_event 18, 45, 13 ; ViridianForestText13
	bg_event  2,  1, 14 ; ViridianForestText14

	def_objects
	object SPRITE_YOUNGSTER, 16, 43, STAY, NONE, 1 ; person
	object SPRITE_YOUNGSTER, 30, 33, STAY, LEFT, 2, OPP_BUG_CATCHER, 1
	object SPRITE_YOUNGSTER, 30, 19, STAY, LEFT, 3, OPP_BUG_CATCHER, 2
	object SPRITE_YOUNGSTER, 2, 18, STAY, LEFT, 4, OPP_BUG_CATCHER, 3
	object SPRITE_POKE_BALL, 25, 11, STAY, NONE, 5, ANTIDOTE
	object SPRITE_POKE_BALL, 12, 29, STAY, NONE, 6, POTION
	object SPRITE_POKE_BALL, 1, 31, STAY, NONE, 7, POKE_BALL
	object SPRITE_YOUNGSTER, 27, 40, STAY, NONE, 8 ; person

	def_warps_to VIRIDIAN_FOREST
