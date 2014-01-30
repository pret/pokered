SafariZoneCenterObject: ; 0x45bc5 (size=89)
	db $0 ; border tile

	db $9 ; warps
	db $19, $e, $2, SAFARIZONEENTRANCE
	db $19, $f, $3, SAFARIZONEENTRANCE
	db $a, $0, $4, SAFARI_ZONE_WEST
	db $b, $0, $5, SAFARI_ZONE_WEST
	db $0, $e, $4, SAFARI_ZONE_NORTH
	db $0, $f, $5, SAFARI_ZONE_NORTH
	db $a, $1d, $2, SAFARI_ZONE_EAST
	db $b, $1d, $3, SAFARI_ZONE_EAST
	db $13, $11, $0, SAFARI_ZONE_REST_HOUSE_1

	db $2 ; signs
	db $14, $12, $2 ; SafariZoneCenterText2
	db $16, $e, $3 ; SafariZoneCenterText3

	db $1 ; people
	db SPRITE_BALL, $a + 4, $e + 4, $ff, $ff, $81, NUGGET ; item

	; warp-to
	EVENT_DISP $f, $19, $e ; SAFARIZONEENTRANCE
	EVENT_DISP $f, $19, $f ; SAFARIZONEENTRANCE
	EVENT_DISP $f, $a, $0 ; SAFARI_ZONE_WEST
	EVENT_DISP $f, $b, $0 ; SAFARI_ZONE_WEST
	EVENT_DISP $f, $0, $e ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $0, $f ; SAFARI_ZONE_NORTH
	EVENT_DISP $f, $a, $1d ; SAFARI_ZONE_EAST
	EVENT_DISP $f, $b, $1d ; SAFARI_ZONE_EAST
	EVENT_DISP $f, $13, $11 ; SAFARI_ZONE_REST_HOUSE_1

