OaksLab_h:
	db DOJO ; tileset
	db OAKS_LAB_HEIGHT, OAKS_LAB_WIDTH ; dimensions (y, x)
	dw OaksLabBlocks, OaksLabTextPointers, OaksLabScript ; blocks, texts, scripts
	db $00 ; connections
	dw OaksLabObject ; objects
