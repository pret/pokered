SafariZoneNorthObject:
	db $0 ; border block

	db $9 ; warps
	warp $2, $23, $0, SAFARI_ZONE_WEST
	warp $3, $23, $1, SAFARI_ZONE_WEST
	warp $8, $23, $2, SAFARI_ZONE_WEST
	warp $9, $23, $3, SAFARI_ZONE_WEST
	warp $14, $23, $4, SAFARI_ZONE_CENTER
	warp $15, $23, $5, SAFARI_ZONE_CENTER
	warp $27, $1e, $0, SAFARI_ZONE_EAST
	warp $27, $1f, $1, SAFARI_ZONE_EAST
	warp $23, $3, $0, SAFARI_ZONE_REST_HOUSE_4

	db $5 ; signs
	sign $24, $4, $3 ; SafariZoneNorthText3
	sign $4, $19, $4 ; SafariZoneNorthText4
	sign $d, $1f, $5 ; SafariZoneNorthText5
	sign $13, $21, $6 ; SafariZoneNorthText6
	sign $1a, $1c, $7 ; SafariZoneNorthText7

	db $2 ; objects
	object SPRITE_BALL, $19, $1, STAY, NONE, $1, PROTEIN
	object SPRITE_BALL, $13, $7, STAY, NONE, $2, TM_40

	; warp-to
	warp_to $2, $23, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_WEST
	warp_to $3, $23, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_WEST
	warp_to $8, $23, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_WEST
	warp_to $9, $23, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_WEST
	warp_to $14, $23, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_CENTER
	warp_to $15, $23, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_CENTER
	warp_to $27, $1e, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_EAST
	warp_to $27, $1f, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_EAST
	warp_to $23, $3, SAFARI_ZONE_NORTH_WIDTH ; SAFARI_ZONE_REST_HOUSE_4
