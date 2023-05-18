MtMoonSquare_Object:
	db $2C ; border block

	def_warp_events
	warp_event 16,  3, MT_MOON_1F, 10
	warp_event 20,  9, MT_MOON_1F, 10
	warp_event 22,  1, MT_MOON_CRATER, 1
	warp_event 11,  5, MT_MOON_SQUARE_HOUSE, 2

	def_bg_events
	bg_event 15,  5, 2 ; Sign

	def_object_events
	object_event  7,  5, SPRITE_FAIRY, WALK, ANY_DIR, 1 ; person
	object_event  5,  4, SPRITE_FAIRY, WALK, ANY_DIR, 1 ; person
	object_event  4,  6, SPRITE_FAIRY, WALK, ANY_DIR, 1 ; person

	def_warps_to MT_MOON_SQUARE