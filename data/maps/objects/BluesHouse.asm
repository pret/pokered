BluesHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, LAST_MAP, 1
	warp_event  3,  7, LAST_MAP, 1

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_DAISY, STAY, RIGHT, 1 ; Daisy, sitting by map
	object_event  6,  4, SPRITE_DAISY, WALK, UP_DOWN, 2, 0 ; Daisy, walking around
	object_event  3,  3, SPRITE_POKEDEX, STAY, NONE, 3, 0 ; map on table

	def_warps_to BLUES_HOUSE
