SafariZoneWestRestHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 7, SAFARI_ZONE_WEST
	warp 3, 7, 7, SAFARI_ZONE_WEST

	db 0 ; signs

	db 3 ; objects
	object SPRITE_OAK_AIDE, 4, 4, WALK, 0, 1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, 0, 2, STAY, RIGHT, 2 ; person
	object SPRITE_ERIKA, 6, 2, STAY, DOWN, 3 ; person

	; warp-to
	warp_to 2, 7, SAFARI_ZONE_WEST_REST_HOUSE_WIDTH ; SAFARI_ZONE_WEST
	warp_to 3, 7, SAFARI_ZONE_WEST_REST_HOUSE_WIDTH ; SAFARI_ZONE_WEST
