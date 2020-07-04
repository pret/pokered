PalletTown_Object:
	db $b ; border block

	db 3 ; warps
	warp 5, 5, 0, REDS_HOUSE_1F
	warp 13, 5, 0, BLUES_HOUSE
	warp 12, 11, 1, OAKS_LAB

	db 4 ; signs
	sign 13, 13, 4 ; PalletTownText4
	sign 7, 9, 5 ; PalletTownText5
	sign 3, 5, 6 ; PalletTownText6
	sign 11, 5, 7 ; PalletTownText7

	db 3 ; objects
	object SPRITE_OAK, 8, 5, STAY, NONE, 1 ; person
	object SPRITE_GIRL, 3, 8, WALK, 0, 2 ; person
	object SPRITE_FISHER2, 11, 14, WALK, 0, 3 ; person

	; warp-to
	warp_to 5, 5, PALLET_TOWN_WIDTH ; REDS_HOUSE_1F
	warp_to 13, 5, PALLET_TOWN_WIDTH ; BLUES_HOUSE
	warp_to 12, 11, PALLET_TOWN_WIDTH ; OAKS_LAB
