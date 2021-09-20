Colosseum_Object:
	db $e ; border block

	def_warp_events

	def_bg_events

	def_object_events
	object_event SPRITE_RED, 2, 2, STAY, 0, 1 ; person

	def_warps_to COLOSSEUM
