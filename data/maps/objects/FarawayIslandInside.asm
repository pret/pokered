FarawayIslandInside_Object:
	db $02 ; border block

	def_warp_events
	warp_event 14, 21, 0, FARAWAY_ISLAND_OUTSIDE
	warp_event 15, 21, 0, FARAWAY_ISLAND_OUTSIDE

	def_bg_events
	object_event 14, 10, SPRITE_MONSTER, STAY, DOWN, 1, MEW, 50 | OW_POKEMON

	def_object_events

	def_warps_to FARAWAY_ISLAND_INSIDE