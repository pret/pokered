SafariZoneEntranceObject:
	db $a ; border block

	db $4 ; warps
	db $5, $3, $4, $ff
	db $5, $4, $4, $ff
	db $0, $3, $0, SAFARI_ZONE_CENTER
	db $0, $4, $1, SAFARI_ZONE_CENTER

	db $0 ; signs

	db $2 ; objects
	object SPRITE_WHITE_PLAYER, $6, $2, STAY, LEFT, $1 ; person
	object SPRITE_WHITE_PLAYER, $1, $4, STAY, RIGHT, $2 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $5, $3
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $5, $4
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $0, $3 ; SAFARI_ZONE_CENTER
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $0, $4 ; SAFARI_ZONE_CENTER
