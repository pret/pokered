SafariZoneRestHouse4Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $8, SAFARI_ZONE_NORTH
	db $7, $3, $8, SAFARI_ZONE_NORTH

	db $0 ; signs

	db $3 ; objects
	object SPRITE_OAK_AIDE, $6, $3, WALK, $2, $1 ; person
	object SPRITE_WHITE_PLAYER, $3, $4, STAY, NONE, $2 ; person
	object SPRITE_GENTLEMAN, $1, $5, WALK, $1, $3 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_4_WIDTH, $7, $2 ; SAFARI_ZONE_NORTH
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_4_WIDTH, $7, $3 ; SAFARI_ZONE_NORTH
