FightingDojo_Object:
	db $3 ; border block

	def_warp_events
	warp_event  4, 11, LAST_MAP, 2
	warp_event  5, 11, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_HIKER, STAY, DOWN, 1, OPP_BLACKBELT, 1
	object_event  3,  4, SPRITE_HIKER, STAY, RIGHT, 2, OPP_BLACKBELT, 2
	object_event  3,  6, SPRITE_HIKER, STAY, RIGHT, 3, OPP_BLACKBELT, 3
	object_event  5,  5, SPRITE_HIKER, STAY, LEFT, 4, OPP_BLACKBELT, 4
	object_event  5,  7, SPRITE_HIKER, STAY, LEFT, 5, OPP_BLACKBELT, 5
	object_event  4,  1, SPRITE_POKE_BALL, STAY, NONE, 6 ; person
	object_event  5,  1, SPRITE_POKE_BALL, STAY, NONE, 7 ; person

	def_warps_to FIGHTING_DOJO
