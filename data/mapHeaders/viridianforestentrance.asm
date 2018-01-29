ViridianForestEntrance_h:
	db FOREST_GATE ; tileset
	db VIRIDIAN_FOREST_ENTRANCE_HEIGHT, VIRIDIAN_FOREST_ENTRANCE_WIDTH ; dimensions (y, x)
	dw ViridianForestEntranceBlocks, ViridianForestEntranceTextPointers, ViridianForestEntranceScript ; blocks, texts, scripts
	db 0 ; connections
	dw ViridianForestEntranceObject ; objects
