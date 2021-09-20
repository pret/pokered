CeladonMansion3F_Object:
	db $f ; border block

	def_warp_events
	warp_event  6,  1, 0, CELADON_MANSION_2F
	warp_event  7,  1, 0, CELADON_MANSION_ROOF
	warp_event  2,  1, 1, CELADON_MANSION_ROOF
	warp_event  4,  1, 3, CELADON_MANSION_2F

	def_bg_events
	bg_event  1,  3, 5 ; CeladonMansion3Text5
	bg_event  4,  3, 6 ; CeladonMansion3Text6
	bg_event  1,  6, 7 ; CeladonMansion3Text7
	bg_event  4,  9, 8 ; CeladonMansion3Text8

	def_object_events
	object_event SPRITE_BIKE_SHOP_CLERK, 0, 4, STAY, UP, 1 ; person
	object_event SPRITE_CLERK, 3, 4, STAY, UP, 2 ; person
	object_event SPRITE_SUPER_NERD, 0, 7, STAY, UP, 3 ; person
	object_event SPRITE_SILPH_WORKER, 2, 3, STAY, NONE, 4 ; person

	def_warps_to CELADON_MANSION_3F
