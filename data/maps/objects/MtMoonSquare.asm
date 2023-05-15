MtMoonSquare_Object:
	db $2C ; border block

	def_warp_events
	warp_event 18,  5, MT_MOON_1F, 8
	warp_event 22, 11, MT_MOON_1F, 8
	warp_event 24,  3, MT_MOON_CRATER, 1
	;warp_event 13,  7, MT_MOON_SQUARE_HOUSE, 1

	def_bg_events
	bg_event 17,  7, 1 ; Sign

	def_object_events
	object_event  8,  8, SPRITE_CLEFAIRY, STAY, DOWN, 1 ; person

	def_warps_to MT_MOON_SQUARE