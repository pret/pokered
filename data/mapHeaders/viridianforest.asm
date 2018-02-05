ViridianForest_h:
	db FOREST ; tileset
	db VIRIDIAN_FOREST_HEIGHT, VIRIDIAN_FOREST_WIDTH ; dimensions (y, x)
	dw ViridianForestBlocks, ViridianForestTextPointers, ViridianForestScript ; blocks, texts, scripts
	db 0 ; connections
	dw ViridianForestObject ; objects
