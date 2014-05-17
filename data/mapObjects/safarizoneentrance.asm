SafariZoneEntranceObject: ; 0x753f5 (size=48)
	db $a ; border block

	db $4 ; warps
	db $5, $3, $4, $ff
	db $5, $4, $4, $ff
	db $0, $3, $0, SAFARI_ZONE_CENTER
	db $0, $4, $1, SAFARI_ZONE_CENTER

	db $0 ; signs

	db $2 ; people
	db SPRITE_WHITE_PLAYER, $2 + 4, $6 + 4, $ff, $d2, $1 ; person
	db SPRITE_WHITE_PLAYER, $4 + 4, $1 + 4, $ff, $d3, $2 ; person

	; warp-to
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $5, $3
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $5, $4
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $0, $3 ; SAFARI_ZONE_CENTER
	EVENT_DISP SAFARI_ZONE_ENTRANCE_WIDTH, $0, $4 ; SAFARI_ZONE_CENTER
