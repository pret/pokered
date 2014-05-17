PowerPlant_h: ; 0x1e2ba to 0x1e2c6 (12 bytes) (bank=7) (id=83)
	db FACILITY ; tileset
	db POWER_PLANT_HEIGHT, POWER_PLANT_WIDTH ; dimensions (y, x)
	dw PowerPlantBlocks, PowerPlantTextPointers, PowerPlantScript ; blocks, texts, scripts
	db $00 ; connections
	dw PowerPlantObject ; objects
