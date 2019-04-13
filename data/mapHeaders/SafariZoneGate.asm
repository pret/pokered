SafariZoneGate_h:
	db GATE ; tileset
	db SAFARI_ZONE_GATE_HEIGHT, SAFARI_ZONE_GATE_WIDTH ; dimensions (y, x)
	dw SafariZoneGate_Blocks ; blocks
	dw SafariZoneGate_TextPointers ; texts
	dw SafariZoneGate_Script ; scripts
	db 0 ; connections
	dw SafariZoneGate_Object ; objects
