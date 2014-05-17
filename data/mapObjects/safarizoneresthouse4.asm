SafariZoneRestHouse4Object: ; 0x45dd9 (size=38)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $8, SAFARI_ZONE_NORTH
	db $7, $3, $8, SAFARI_ZONE_NORTH

	db $0 ; signs

	db $3 ; people
	db SPRITE_OAK_AIDE, $3 + 4, $6 + 4, $fe, $2, $1 ; person
	db SPRITE_WHITE_PLAYER, $4 + 4, $3 + 4, $ff, $ff, $2 ; person
	db SPRITE_GENTLEMAN, $5 + 4, $1 + 4, $fe, $1, $3 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_4_WIDTH, $7, $2 ; SAFARI_ZONE_NORTH
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_4_WIDTH, $7, $3 ; SAFARI_ZONE_NORTH
