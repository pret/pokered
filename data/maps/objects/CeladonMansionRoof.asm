CeladonMansionRoof_Object:
	db $9 ; border block

	def_warp_events
	warp_event  6,  1, CELADON_MANSION_3F, 2
	warp_event  2,  1, CELADON_MANSION_3F, 3
	warp_event  2,  7, CELADON_MANSION_ROOF_HOUSE, 1

	def_bg_events
	bg_event  3,  7, 2 ; CeladonMansion4Text1

	def_object_events
	object_event  1, 10, SPRITE_POKE_BALL, STAY, NONE, 1, SURFBOARD


	def_warps_to CELADON_MANSION_ROOF
