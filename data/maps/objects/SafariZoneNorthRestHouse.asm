SafariZoneNorthRestHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 8, SAFARI_ZONE_NORTH
	warp 3, 7, 8, SAFARI_ZONE_NORTH

	db 0 ; signs

	db 3 ; objects
	object SPRITE_OAK_AIDE, 6, 3, WALK, 2, 1 ; person
	object SPRITE_WHITE_PLAYER, 3, 4, STAY, NONE, 2 ; person
	object SPRITE_GENTLEMAN, 1, 5, WALK, 1, 3 ; person

	; warp-to
	warp_to 2, 7, SAFARI_ZONE_NORTH_REST_HOUSE_WIDTH ; SAFARI_ZONE_NORTH
	warp_to 3, 7, SAFARI_ZONE_NORTH_REST_HOUSE_WIDTH ; SAFARI_ZONE_NORTH
