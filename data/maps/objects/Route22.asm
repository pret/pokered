	object_const_def
	const_export ROUTE22_RIVAL1
	const_export ROUTE22_RIVAL2

Route22_Object:
	db $2c ; border block

	def_warp_events
	warp_event  8,  5, INDIGO_PLATEAU_LOBBY, 1
	warp_event 31,  3, OAKS_LAB, 5
	warp_event 32,  3, OAKS_LAB, 6
	warp_event 24,  3, PEWTER_GYM, 1
	warp_event  3, 13, VIRIDIAN_GYM, 3

	def_bg_events
	bg_event  7, 11, TEXT_ROUTE22_POKEMON_LEAGUE_SIGN

	def_object_events
	object_event 30,  5, SPRITE_BLUE, STAY, NONE, TEXT_ROUTE22_RIVAL1
	object_event 12,  7, SPRITE_BLUE, STAY, NONE, TEXT_ROUTE22_RIVAL2

	def_warps_to ROUTE_22
