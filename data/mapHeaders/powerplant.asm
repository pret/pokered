PowerPlant_h:
	db FACILITY ; tileset
	db POWER_PLANT_HEIGHT, POWER_PLANT_WIDTH ; dimensions (y, x)
	dw PowerPlantBlocks, PowerPlantTextPointers, PowerPlantScript ; blocks, texts, scripts
	db 0 ; connections
	dw PowerPlantObject ; objects
