PalletTown_Object:
	db $b ; border block

	def_warp_events
	warp_event  5,  5, 0, REDS_HOUSE_1F
	warp_event 13,  5, 0, BLUES_HOUSE
	warp_event 12, 11, 1, OAKS_LAB

	def_bg_events
	bg_event 13, 13, 4 ; PalletTownText4
	bg_event  7,  9, 5 ; PalletTownText5
	bg_event  3,  5, 6 ; PalletTownText6
	bg_event 11,  5, 7 ; PalletTownText7

	def_objects
	object SPRITE_OAK, 8, 5, STAY, NONE, 1 ; person
	object SPRITE_GIRL, 3, 8, WALK, ANY_DIR, 2 ; person
	object SPRITE_FISHER, 11, 14, WALK, ANY_DIR, 3 ; person

	def_warps_to PALLET_TOWN
