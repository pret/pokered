SafariZoneRestHouse3Object: ; 0x45d8e (size=38)
	db $a ; border block

	db $2 ; warps
	db $7, $2, $4, SAFARI_ZONE_EAST
	db $7, $3, $4, SAFARI_ZONE_EAST

	db $0 ; signs

	db $3 ; people
	db SPRITE_OAK_AIDE, $3 + 4, $1 + 4, $fe, $1, $1 ; person
	db SPRITE_ROCKER, $2 + 4, $4 + 4, $ff, $ff, $2 ; person
	db SPRITE_LAPRAS_GIVER, $2 + 4, $5 + 4, $ff, $ff, $3 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_3_WIDTH, $7, $2 ; SAFARI_ZONE_EAST
	EVENT_DISP SAFARI_ZONE_REST_HOUSE_3_WIDTH, $7, $3 ; SAFARI_ZONE_EAST
