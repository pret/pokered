ViridianForest_Object:
	db $3 ; border block

	def_warp_events
	warp_event  1,  0, VIRIDIAN_FOREST_NORTH_GATE, 3
	warp_event  2,  0, VIRIDIAN_FOREST_NORTH_GATE, 4
	warp_event 15, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 16, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 17, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2
	warp_event 18, 47, VIRIDIAN_FOREST_SOUTH_GATE, 2

	def_bg_events
	bg_event 24, 40, 11 ; ViridianForestText9
	bg_event 16, 32, 12 ; ViridianForestText10
	bg_event 26, 17, 13 ; ViridianForestText11
	bg_event  4, 24, 14 ; ViridianForestText12
	bg_event 18, 45, 15 ; ViridianForestText13
	bg_event  2,  1, 16 ; ViridianForestText14

	def_object_events
	object_event 16, 43, SPRITE_YOUNGSTER, STAY, NONE, 1 ; person
	object_event 30, 33, SPRITE_YOUNGSTER, STAY, LEFT, 2, OPP_BUG_CATCHER, 1
	object_event 30, 19, SPRITE_YOUNGSTER, STAY, LEFT, 3, OPP_BUG_CATCHER, 2
	object_event  2, 18, SPRITE_YOUNGSTER, STAY, LEFT, 4, OPP_BUG_CATCHER, 3
	object_event  2, 42, SPRITE_COOLTRAINER_F, STAY, NONE, 5, OPP_LASS, 19
	object_event 13, 17, SPRITE_YOUNGSTER, STAY, RIGHT, 6, OPP_BUG_CATCHER, 15
	object_event 25, 11, SPRITE_POKE_BALL, STAY, NONE, 7, ITEM_VIRIDIAN_FOREST_NORTHEAST
	object_event 12, 29, SPRITE_POKE_BALL, STAY, NONE, 8, ITEM_VIRIDIAN_FOREST_BEFORE_LAST_BEND
	object_event  1, 31, SPRITE_POKE_BALL, STAY, NONE, 9, ITEM_VIRIDIAN_FOREST_LEFT_FROM_ENTRANCE
	object_event 27, 40, SPRITE_YOUNGSTER, STAY, NONE, 10 ; person

	def_warps_to VIRIDIAN_FOREST
