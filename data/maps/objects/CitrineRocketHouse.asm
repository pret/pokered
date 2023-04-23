CitrineRocketHouse_Object:
	db $01 ; border block

	def_warp_events
	warp_event  4,  9, CITRINE_CITY, 1
	warp_event  5,  9, CITRINE_CITY, 1

	def_bg_events

	def_object_events
	object_event  4,  1, SPRITE_ROCKET, STAY, DOWN, 1 ; Mart Guy
	object_event  5,  1, SPRITE_ROCKET, STAY, DOWN, 2 ; Mart Guy
	object_event  1,  6, SPRITE_ROCKET, STAY, RIGHT, 3 ; person
	object_event  9,  3, SPRITE_ROCKET, STAY, UP, 4 ; person
	object_event  9,  8, SPRITE_CAT, STAY, UP, 5 ; Meowth
	object_event  9,  5, SPRITE_JAMES, STAY, DOWN, 6 ; James
	object_event  7,  6, SPRITE_JESSIE, STAY, RIGHT, 7 ; Jessie

	def_warps_to CITRINE_ROCKET_HOUSE