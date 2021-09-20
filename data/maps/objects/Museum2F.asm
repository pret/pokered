Museum2F_Object:
	db $a ; border block

	def_warp_events
	warp_event  7,  7, 4, MUSEUM_1F

	def_bg_events
	bg_event 11,  2, 6 ; Museum2FText6
	bg_event  2,  5, 7 ; Museum2FText7

	def_object_events
	object_event SPRITE_YOUNGSTER, 1, 7, WALK, LEFT_RIGHT, 1 ; person
	object_event SPRITE_GRAMPS, 0, 5, STAY, DOWN, 2 ; person
	object_event SPRITE_SCIENTIST, 7, 5, STAY, DOWN, 3 ; person
	object_event SPRITE_BRUNETTE_GIRL, 11, 5, STAY, NONE, 4 ; person
	object_event SPRITE_HIKER, 12, 5, STAY, DOWN, 5 ; person

	def_warps_to MUSEUM_2F
