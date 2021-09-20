VermilionPidgeyHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 4, LAST_MAP
	warp_event  3,  7, 4, LAST_MAP

	def_bg_events

	def_object_events
	object_event SPRITE_YOUNGSTER, 5, 3, STAY, LEFT, 1 ; person
	object_event SPRITE_BIRD, 3, 5, WALK, LEFT_RIGHT, 2 ; person
	object_event SPRITE_PAPER, 4, 3, STAY, NONE, 3 ; person

	def_warps_to VERMILION_PIDGEY_HOUSE
