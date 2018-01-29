UndergroundPathEntranceRoute5Object:
	db $a ; border block

	db $3 ; warps
	warp $3, $7, $3, $ff
	warp $4, $7, $3, $ff
	warp $4, $4, $0, UNDERGROUND_PATH_NS

	db $0 ; signs

	db $1 ; objects
	object SPRITE_LITTLE_GIRL, $2, $3, STAY, NONE, $1 ; person

	; warp-to
	warp_to $3, $7, PATH_ENTRANCE_ROUTE_5_WIDTH
	warp_to $4, $7, PATH_ENTRANCE_ROUTE_5_WIDTH
	warp_to $4, $4, PATH_ENTRANCE_ROUTE_5_WIDTH ; UNDERGROUND_PATH_NS
