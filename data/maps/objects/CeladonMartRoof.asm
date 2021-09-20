CeladonMartRoof_Object:
	db $42 ; border block

	def_warp_events
	warp_event 15,  2, 0, CELADON_MART_5F

	def_bg_events
	bg_event 10,  1, 3 ; CeladonMartRoofText3
	bg_event 11,  1, 4 ; CeladonMartRoofText4
	bg_event 12,  2, 5 ; CeladonMartRoofText5
	bg_event 13,  2, 6 ; CeladonMartRoofText6

	def_object_events
	object_event SPRITE_SUPER_NERD, 10, 4, STAY, LEFT, 1 ; person
	object_event SPRITE_LITTLE_GIRL, 5, 5, WALK, ANY_DIR, 2 ; person

	def_warps_to CELADON_MART_ROOF
