PalletTown_Object:
	db $b ; border block

	def_warp_events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 2

	def_bg_events
	bg_event 13, 13, 4 ; PalletTownText4
	bg_event  7,  9, 5 ; PalletTownText5
	bg_event  3,  5, 6 ; PalletTownText6
	bg_event 11,  5, 7 ; PalletTownText7

	def_object_events
	object_event  8,  5, SPRITE_OAK, STAY, NONE, 1 ; person
	object_event  3,  8, SPRITE_GIRL, WALK, ANY_DIR, 2 ; person
	object_event 11, 14, SPRITE_FISHER, WALK, ANY_DIR, 3 ; person

	def_warps_to PALLET_TOWN
