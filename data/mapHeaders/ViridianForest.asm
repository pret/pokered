ViridianForest_h:
	db FOREST ; tileset
	db VIRIDIAN_FOREST_HEIGHT, VIRIDIAN_FOREST_WIDTH ; dimensions (y, x)
	dw ViridianForest_Blocks ; blocks
	dw ViridianForest_TextPointers ; texts
	dw ViridianForest_Script ; scripts
	db 0 ; connections
	dw ViridianForest_Object ; objects
