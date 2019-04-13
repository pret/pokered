ViridianForestExit_h:
	db FOREST_GATE ; tileset
	db VIRIDIAN_FOREST_EXIT_HEIGHT, VIRIDIAN_FOREST_EXIT_WIDTH ; dimensions (y, x)
	dw ViridianForestExitBlocks, ViridianForestExitTextPointers, ViridianForestExitScript ; blocks, texts, scripts
	db 0 ; connections
	dw ViridianForestExitObject ; objects
