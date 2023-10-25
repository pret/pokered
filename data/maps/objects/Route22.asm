	object_const_def
	const_export ROUTE22_RIVAL1
	const_export ROUTE22_RIVAL2
	const_export ROUTE22_ITEM1
	const_export ROUTE22_ITEM2

Route22_Object:
	db $2c ; border block

	def_warp_events
	warp_event  8,  5, ROUTE_22_GATE, 1

	def_bg_events
	bg_event  7, 11, TEXT_ROUTE22_POKEMON_LEAGUE_SIGN
	bg_event  25, 15, TEXT_ROUTE22_TRAINER_TIPS_SIGN

	def_object_events
	object_event 25,  5, SPRITE_BLUE, STAY, NONE, TEXT_ROUTE22_RIVAL1
	object_event 25,  5, SPRITE_BLUE, STAY, NONE, TEXT_ROUTE22_RIVAL2
	object_event 30,  2, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE22_ITEM1, ITEM_ROUTE_22_NORTH_ALCOVE_NEW 
	object_event 2,  15, SPRITE_POKE_BALL, STAY, NONE, TEXT_ROUTE22_ITEM2, ITEM_ROUTE_22_SOUTHWEST_CORNER_NEW 

	def_warps_to ROUTE_22
