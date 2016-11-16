SafariZoneRestHouse2Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $7, SAFARI_ZONE_WEST
	db $7, $3, $7, SAFARI_ZONE_WEST

	db $0 ; signs

	db $3 ; objects
	object SPRITE_OAK_AIDE, $4, $4, WALK, $0, $1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, $0, $2, STAY, RIGHT, $2 ; person
	object SPRITE_ERIKA, $6, $2, STAY, DOWN, $3 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_2_WIDTH, $7, $2 ; SAFARI_ZONE_WEST
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_2_WIDTH, $7, $3 ; SAFARI_ZONE_WEST
