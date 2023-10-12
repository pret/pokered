	object_const_def
	const_export COLOSSEUM_OPPONENT

Colosseum_Object:
	db $e ; border block

	def_warp_events

	def_bg_events

	def_object_events
	object_event  2,  2, SPRITE_RED, STAY, ANY_DIR, TEXT_COLOSSEUM_OPPONENT

	def_warps_to COLOSSEUM
