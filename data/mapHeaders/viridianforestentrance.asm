ViridianForestEntrance_h: ; 0x5d650 to 0x5d65c (12 bytes) (id=50)
	db FOREST_GATE ; tileset
	db VIRIDIAN_FOREST_ENTRANCE_HEIGHT, VIRIDIAN_FOREST_ENTRANCE_WIDTH ; dimensions (y, x)
	dw ViridianForestEntranceBlocks, ViridianForestEntranceTextPointers, ViridianForestEntranceScript ; blocks, texts, scripts
	db $00 ; connections
	dw ViridianForestEntranceObject ; objects
