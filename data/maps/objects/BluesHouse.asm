BluesHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 2
	warp_event  3,  7, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, STAY, RIGHT, 1
	object_event  6,  4, SPRITE_DAISY, WALK, UP_DOWN, 2, 0
	object_event  3,  3, SPRITE_POKEDEX, STAY, NONE, 3, 0

	def_warps_to BLUES_HOUSE
