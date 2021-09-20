FightingDojo_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, 1, LAST_MAP
	warp_event  5, 11, 1, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_HIKER, 5, 3, STAY, DOWN, 1, OPP_BLACKBELT, 1
	object_event SPRITE_HIKER, 3, 4, STAY, RIGHT, 2, OPP_BLACKBELT, 2
	object_event SPRITE_HIKER, 3, 6, STAY, RIGHT, 3, OPP_BLACKBELT, 3
	object_event SPRITE_HIKER, 5, 5, STAY, LEFT, 4, OPP_BLACKBELT, 4
	object_event SPRITE_HIKER, 5, 7, STAY, LEFT, 5, OPP_BLACKBELT, 5
	object_event SPRITE_POKE_BALL, 4, 1, STAY, NONE, 6 ; person
	object_event SPRITE_POKE_BALL, 5, 1, STAY, NONE, 7 ; person

	def_warps_to FIGHTING_DOJO
