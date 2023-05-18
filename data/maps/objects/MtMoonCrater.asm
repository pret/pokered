MtMoonCrater_Object:
	db $03 ; border block

	def_warp_events
	warp_event 23, 49, MT_MOON_SQUARE, 3
	warp_event 22, 49, MT_MOON_SQUARE, 3

	def_bg_events

	def_object_events
	object_event 20, 17, SPRITE_POKE_BALL, STAY, NONE, 1, BLK_AUGURITE
	object_event 33, 17, SPRITE_FOSSIL, STAY, NONE, 2, DOME_FOSSIL
	object_event 25, 21, SPRITE_FOSSIL, STAY, NONE, 3, WING_FOSSIL
	object_event 33, 16, SPRITE_FOSSIL, STAY, NONE, 4, HELIX_FOSSIL
	object_event 26, 20, SPRITE_FOSSIL, STAY, NONE, 5, OLD_AMBER
	object_event 25,  4, SPRITE_POKE_BALL, STAY, NONE, 6, HYPER_POTION
	object_event 45, 24, SPRITE_POKE_BALL, STAY, NONE, 7, MAX_ETHER
	object_event 44, 17, SPRITE_POKE_BALL, STAY, NONE, 8, MAX_REVIVE
	object_event 17, 20, SPRITE_POKE_BALL, STAY, NONE, 9, HEART_STONE
	object_event 20, 20, SPRITE_POKE_BALL, STAY, NONE, 10, POISON_STONE
	object_event 32, 45, SPRITE_POKE_BALL, STAY, NONE, 11, MAX_ETHER

	def_warps_to MT_MOON_CRATER