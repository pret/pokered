FarawayIslandInside_Object:
	db $02 ; border block

	def_warp_events
	warp_event 14, 21, FARAWAY_ISLAND_OUTSIDE, 3
	warp_event 15, 21, FARAWAY_ISLAND_OUTSIDE, 4

	def_bg_events

	def_object_events
	object_event 15, 10, SPRITE_CAT, STAY, DOWN, 1, MEW, 30 | OW_POKEMON

	def_warps_to FARAWAY_ISLAND_INSIDE