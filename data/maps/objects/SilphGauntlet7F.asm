SilphGauntlet7F_Object:
	db $d ; border block

	def_warp_events
	warp_event  5,  6, SAFFRON_CITY, 1

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_SILPH_PRESIDENT, STAY, DOWN, 1 ; person

	def_warps_to SILPH_GAUNTLET_7F
