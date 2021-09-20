CeruleanCave2F_Object:
	db $7d ; border block

	def_warp_events
	warp_event 29,  1, 2, CERULEAN_CAVE_1F
	warp_event 22,  6, 3, CERULEAN_CAVE_1F
	warp_event 19,  7, 4, CERULEAN_CAVE_1F
	warp_event  9,  1, 5, CERULEAN_CAVE_1F
	warp_event  1,  3, 6, CERULEAN_CAVE_1F
	warp_event  3, 11, 7, CERULEAN_CAVE_1F

	def_bg_events

	def_object_events
	object_event SPRITE_POKE_BALL, 29, 9, STAY, NONE, 1, PP_UP
	object_event SPRITE_POKE_BALL, 4, 15, STAY, NONE, 2, ULTRA_BALL
	object_event SPRITE_POKE_BALL, 13, 6, STAY, NONE, 3, FULL_RESTORE

	def_warps_to CERULEAN_CAVE_2F
