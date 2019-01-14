PowerPlant_h:
	db FACILITY ; tileset
	db POWER_PLANT_HEIGHT, POWER_PLANT_WIDTH ; dimensions (y, x)
	dw PowerPlant_Blocks ; blocks
	dw PowerPlant_TextPointers ; texts
	dw PowerPlant_Script ; scripts
	db 0 ; connections
	dw PowerPlant_Object ; objects
