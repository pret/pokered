SafariZoneGate_Object:
	db $a ; border block

	db 4 ; warps
	warp 3, 5, 4, -1
	warp 4, 5, 4, -1
	warp 3, 0, 0, SAFARI_ZONE_CENTER
	warp 4, 0, 1, SAFARI_ZONE_CENTER

	db 0 ; signs

	db 2 ; objects
	object SPRITE_WHITE_PLAYER, 6, 2, STAY, LEFT, 1 ; person
	object SPRITE_WHITE_PLAYER, 1, 4, STAY, RIGHT, 2 ; person

	; warp-to
	warp_to 3, 5, SAFARI_ZONE_GATE_WIDTH
	warp_to 4, 5, SAFARI_ZONE_GATE_WIDTH
	warp_to 3, 0, SAFARI_ZONE_GATE_WIDTH ; SAFARI_ZONE_CENTER
	warp_to 4, 0, SAFARI_ZONE_GATE_WIDTH ; SAFARI_ZONE_CENTER
