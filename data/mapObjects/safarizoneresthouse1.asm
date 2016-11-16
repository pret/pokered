SafariZoneRestHouse1Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $8, SAFARI_ZONE_CENTER
	db $7, $3, $8, SAFARI_ZONE_CENTER

	db $0 ; signs

	db $2 ; objects
	object SPRITE_GIRL, $3, $2, STAY, DOWN, $1 ; person
	object SPRITE_OAK_AIDE, $1, $4, WALK, $1, $2 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_1_WIDTH, $7, $2 ; SAFARI_ZONE_CENTER
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_1_WIDTH, $7, $3 ; SAFARI_ZONE_CENTER
