MtMoonCrater_Object:
	db $03 ; border block

	def_warp_events
	warp_event 23, 49, MT_MOON_SQUARE, 2
	warp_event 22, 49, MT_MOON_SQUARE, 2

	def_bg_events

	def_object_events
	object_event 20, 17, SPRITE_POKE_BALL, STAY, NONE, 1, BLK_AUGURITE
	object_event 33, 17, SPRITE_FOSSIL, STAY, NONE, 2, DOME_FOSSIL
	object_event 25, 21, SPRITE_FOSSIL, STAY, NONE, 3, WING_FOSSIL
	object_event 33, 16, SPRITE_FOSSIL, STAY, NONE, 4, HELIX_FOSSIL
	object_event 45, 24, SPRITE_POKE_BALL, STAY, NONE, 5, MAX_ETHER
	object_event 44, 17, SPRITE_POKE_BALL, STAY, NONE, 6, MAX_REVIVE
	object_event 17, 20, SPRITE_POKE_BALL, STAY, NONE, 7, HEART_STONE
	object_event 20, 20, SPRITE_POKE_BALL, STAY, NONE, 8, POISON_STONE
	object_event 32, 45, SPRITE_POKE_BALL, STAY, NONE, 9, MAX_ETHER

	def_warps_to MT_MOON_CRATER