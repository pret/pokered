CeladonMansionRoofHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2,  7, 2, CELADON_MANSION_ROOF
	warp_event  3,  7, 2, CELADON_MANSION_ROOF

	def_bg_events

	def_object_events
	object_event SPRITE_HIKER, 2, 2, STAY, DOWN, 1 ; person
	object_event SPRITE_POKE_BALL, 4, 3, STAY, NONE, 2 ; person

	def_warps_to CELADON_MANSION_ROOF_HOUSE
