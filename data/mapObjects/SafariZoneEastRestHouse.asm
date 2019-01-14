SafariZoneEastRestHouse_Object:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 4, SAFARI_ZONE_EAST
	warp 3, 7, 4, SAFARI_ZONE_EAST

	db 0 ; signs

	db 3 ; objects
	object SPRITE_OAK_AIDE, 1, 3, WALK, 1, 1 ; person
	object SPRITE_ROCKER, 4, 2, STAY, NONE, 2 ; person
	object SPRITE_LAPRAS_GIVER, 5, 2, STAY, NONE, 3 ; person

	; warp-to
	warp_to 2, 7, SAFARI_ZONE_EAST_REST_HOUSE_WIDTH ; SAFARI_ZONE_EAST
	warp_to 3, 7, SAFARI_ZONE_EAST_REST_HOUSE_WIDTH ; SAFARI_ZONE_EAST
