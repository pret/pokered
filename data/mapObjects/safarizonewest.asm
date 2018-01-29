SafariZoneWestObject:
	db $0 ; border block

	db $8 ; warps
	warp $14, $0, $0, SAFARI_ZONE_NORTH
	warp $15, $0, $1, SAFARI_ZONE_NORTH
	warp $1a, $0, $2, SAFARI_ZONE_NORTH
	warp $1b, $0, $3, SAFARI_ZONE_NORTH
	warp $1d, $16, $2, SAFARI_ZONE_CENTER
	warp $1d, $17, $3, SAFARI_ZONE_CENTER
	warp $3, $3, $0, SAFARI_ZONE_SECRET_HOUSE
	warp $b, $b, $0, SAFARI_ZONE_REST_HOUSE_2

	db $4 ; signs
	sign $c, $c, $5 ; SafariZoneWestText5
	sign $11, $3, $6 ; SafariZoneWestText6
	sign $1a, $4, $7 ; SafariZoneWestText7
	sign $18, $16, $8 ; SafariZoneWestText8

	db $4 ; objects
	object SPRITE_BALL, $8, $14, STAY, NONE, $1, MAX_POTION
	object SPRITE_BALL, $9, $7, STAY, NONE, $2, TM_32
	object SPRITE_BALL, $12, $12, STAY, NONE, $3, MAX_REVIVE
	object SPRITE_BALL, $13, $7, STAY, NONE, $4, GOLD_TEETH

	; warp-to
	warp_to $14, $0, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_NORTH
	warp_to $15, $0, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_NORTH
	warp_to $1a, $0, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_NORTH
	warp_to $1b, $0, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_NORTH
	warp_to $1d, $16, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_CENTER
	warp_to $1d, $17, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_CENTER
	warp_to $3, $3, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_SECRET_HOUSE
	warp_to $b, $b, SAFARI_ZONE_WEST_WIDTH ; SAFARI_ZONE_REST_HOUSE_2
