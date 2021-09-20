CeruleanCave1F_Object:
	db $7d ; border block

	def_warp_events
	warp_event 24, 17, 6, LAST_MAP
	warp_event 25, 17, 6, LAST_MAP
	warp_event 27,  1, 0, CERULEAN_CAVE_2F
	warp_event 23,  7, 1, CERULEAN_CAVE_2F
	warp_event 18,  9, 2, CERULEAN_CAVE_2F
	warp_event  7,  1, 3, CERULEAN_CAVE_2F
	warp_event  1,  3, 4, CERULEAN_CAVE_2F
	warp_event  3, 11, 5, CERULEAN_CAVE_2F
	warp_event  0,  6, 0, CERULEAN_CAVE_B1F

	def_bg_events

	def_object_events
	object_event SPRITE_POKE_BALL, 7, 13, STAY, NONE, 1, FULL_RESTORE
	object_event SPRITE_POKE_BALL, 19, 3, STAY, NONE, 2, MAX_ELIXER
	object_event SPRITE_POKE_BALL, 5, 0, STAY, NONE, 3, NUGGET

	def_warps_to CERULEAN_CAVE_1F
