SafariZoneCenterObject:
	db $0 ; border block

	db $9 ; warps
	warp $e, $19, $2, SAFARI_ZONE_ENTRANCE
	warp $f, $19, $3, SAFARI_ZONE_ENTRANCE
	warp $0, $a, $4, SAFARI_ZONE_WEST
	warp $0, $b, $5, SAFARI_ZONE_WEST
	warp $e, $0, $4, SAFARI_ZONE_NORTH
	warp $f, $0, $5, SAFARI_ZONE_NORTH
	warp $1d, $a, $2, SAFARI_ZONE_EAST
	warp $1d, $b, $3, SAFARI_ZONE_EAST
	warp $11, $13, $0, SAFARI_ZONE_REST_HOUSE_1

	db $2 ; signs
	sign $12, $14, $2 ; SafariZoneCenterText2
	sign $e, $16, $3 ; SafariZoneCenterText3

	db $1 ; objects
	object SPRITE_BALL, $e, $a, STAY, NONE, $1, NUGGET

	; warp-to
	warp_to $e, $19, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_ENTRANCE
	warp_to $f, $19, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_ENTRANCE
	warp_to $0, $a, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_WEST
	warp_to $0, $b, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_WEST
	warp_to $e, $0, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_NORTH
	warp_to $f, $0, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_NORTH
	warp_to $1d, $a, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_EAST
	warp_to $1d, $b, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_EAST
	warp_to $11, $13, SAFARI_ZONE_CENTER_WIDTH ; SAFARI_ZONE_REST_HOUSE_1
