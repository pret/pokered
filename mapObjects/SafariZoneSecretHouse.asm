SafariZoneSecretHouseObject: ; 0x4a365 (size=26)
	db $17 ; border tile

	db $2 ; warps
	db $7, $2, $6, SAFARI_ZONE_WEST
	db $7, $3, $6, SAFARI_ZONE_WEST

	db $0 ; signs

	db $1 ; people
	db SPRITE_FISHER, $3 + 4, $3 + 4, $ff, $d0, $1 ; person

	; warp-to
	EVENT_DISP $4, $7, $2 ; SAFARI_ZONE_WEST
	EVENT_DISP $4, $7, $3 ; SAFARI_ZONE_WEST
