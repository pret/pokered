SafariZoneRestHouse2Object: ; 0x45d43 (size=38)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $7, SAFARI_ZONE_WEST
	db $7, $3, $7, SAFARI_ZONE_WEST

	db $0 ; signs

	db $3 ; people
	db SPRITE_OAK_AIDE, $4 + 4, $4 + 4, $fe, $0, $1 ; person
	db SPRITE_BLACK_HAIR_BOY_1, $2 + 4, $0 + 4, $ff, $d3, $2 ; person
	db SPRITE_ERIKA, $2 + 4, $6 + 4, $ff, $d0, $3 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_2_WIDTH, $7, $2 ; SAFARI_ZONE_WEST
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_2_WIDTH, $7, $3 ; SAFARI_ZONE_WEST
