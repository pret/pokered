OaksLab_h: ; 0x1cb02 to 0x1cb0e (12 bytes) (bank=7) (id=40)
	db DOJO ; tileset
	db OAKS_LAB_HEIGHT, OAKS_LAB_WIDTH ; dimensions (y, x)
	dw OaksLabBlocks, OaksLabTextPointers, OaksLabScript ; blocks, texts, scripts
	db $00 ; connections
	dw OaksLabObject ; objects
