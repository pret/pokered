ViridianForestExit_h: ; 0x5d57b to 0x5d587 (12 bytes) (id=47)
	db FOREST_GATE ; tileset
	db VIRIDIAN_FOREST_EXIT_HEIGHT, VIRIDIAN_FOREST_EXIT_WIDTH ; dimensions (y, x)
	dw ViridianForestExitBlocks, ViridianForestExitTextPointers, ViridianForestExitScript ; blocks, texts, scripts
	db $00 ; connections
	dw ViridianForestExitObject ; objects
