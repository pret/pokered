PowerPlant_h:
	db FACILITY ; tileset
	db POWER_PLANT_HEIGHT, POWER_PLANT_WIDTH ; dimensions (y, x)
	dw PowerPlantBlocks, PowerPlantTextPointers, PowerPlantScript ; blocks, texts, scripts
	db $00 ; connections
	dw PowerPlantObject ; objects
