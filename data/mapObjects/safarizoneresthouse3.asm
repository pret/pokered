SafariZoneRestHouse3Object:
	db $a ; border block

	db $2 ; warps
	db $7, $2, $4, SAFARI_ZONE_EAST
	db $7, $3, $4, SAFARI_ZONE_EAST

	db $0 ; signs

	db $3 ; objects
	object SPRITE_OAK_AIDE, $1, $3, WALK, $1, $1 ; person
	object SPRITE_ROCKER, $4, $2, STAY, NONE, $2 ; person
	object SPRITE_LAPRAS_GIVER, $5, $2, STAY, NONE, $3 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_3_WIDTH, $7, $2 ; SAFARI_ZONE_EAST
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_3_WIDTH, $7, $3 ; SAFARI_ZONE_EAST
