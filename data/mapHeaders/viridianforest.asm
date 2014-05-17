ViridianForest_h: ; 0x61101 to 0x6110d (12 bytes) (id=51)
	db FOREST ; tileset
	db VIRIDIAN_FOREST_HEIGHT, VIRIDIAN_FOREST_WIDTH ; dimensions (y, x)
	dw ViridianForestBlocks, ViridianForestTextPointers, ViridianForestScript ; blocks, texts, scripts
	db $00 ; connections
	dw ViridianForestObject ; objects
