	object_const_def
	const CINNABARMART_CLERK
	const CINNABARMART_SILPH_WORKER_F
	const CINNABARMART_SCIENTIST

CinnabarMart_Object:
	db $0 ; border block

	def_warp_events
	warp_event  3,  7, LAST_MAP, 5
	warp_event  4,  7, LAST_MAP, 5

	def_bg_events

	def_object_events
	object_event  0,  5, SPRITE_CLERK, STAY, RIGHT, TEXT_CINNABARMART_CLERK
	object_event  6,  2, SPRITE_SILPH_WORKER_F, STAY, NONE, TEXT_CINNABARMART_SILPH_WORKER_F
	object_event  3,  4, SPRITE_SCIENTIST, STAY, NONE, TEXT_CINNABARMART_SCIENTIST

	def_warps_to CINNABAR_MART
