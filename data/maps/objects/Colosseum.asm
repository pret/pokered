Colosseum_Object:
	db $e ; border block

	def_warp_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_RED, STAY, 0, 1 ; person

	def_warps_to COLOSSEUM
