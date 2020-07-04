SafariZoneEast_Object:
	db $0 ; border block

	db 5 ; warps
	warp 0, 4, 6, SAFARI_ZONE_NORTH
	warp 0, 5, 7, SAFARI_ZONE_NORTH
	warp 0, 22, 6, SAFARI_ZONE_CENTER
	warp 0, 23, 6, SAFARI_ZONE_CENTER
	warp 25, 9, 0, SAFARI_ZONE_EAST_REST_HOUSE

	db 3 ; signs
	sign 26, 10, 5 ; SafariZoneEastText5
	sign 6, 4, 6 ; SafariZoneEastText6
	sign 5, 23, 7 ; SafariZoneEastText7

	db 4 ; objects
	object SPRITE_BALL, 21, 10, STAY, NONE, 1, FULL_RESTORE
	object SPRITE_BALL, 3, 7, STAY, NONE, 2, MAX_POTION
	object SPRITE_BALL, 20, 13, STAY, NONE, 3, CARBOS
	object SPRITE_BALL, 15, 12, STAY, NONE, 4, TM_37

	; warp-to
	warp_to 0, 4, SAFARI_ZONE_EAST_WIDTH ; SAFARI_ZONE_NORTH
	warp_to 0, 5, SAFARI_ZONE_EAST_WIDTH ; SAFARI_ZONE_NORTH
	warp_to 0, 22, SAFARI_ZONE_EAST_WIDTH ; SAFARI_ZONE_CENTER
	warp_to 0, 23, SAFARI_ZONE_EAST_WIDTH ; SAFARI_ZONE_CENTER
	warp_to 25, 9, SAFARI_ZONE_EAST_WIDTH ; SAFARI_ZONE_EAST_REST_HOUSE
