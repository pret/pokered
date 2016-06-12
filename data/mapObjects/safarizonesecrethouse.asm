SafariZoneSecretHouseObject:
	db $17 ; border block

	db $2 ; warps
	db $7, $2, $6, SAFARI_ZONE_WEST
	db $7, $3, $6, SAFARI_ZONE_WEST

	db $0 ; signs

	db $1 ; objects
	object SPRITE_FISHER, $3, $3, STAY, DOWN, $1 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_SECRET_HOUSE_WIDTH, $7, $2 ; SAFARI_ZONE_WEST
	EVENT_DISP SAFARI_ZONE_SECRET_HOUSE_WIDTH, $7, $3 ; SAFARI_ZONE_WEST
