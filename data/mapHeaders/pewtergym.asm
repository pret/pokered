PewterGym_h:
	db GYM ; tileset
	db PEWTER_GYM_HEIGHT, PEWTER_GYM_WIDTH ; dimensions (y, x)
	dw PewterGymBlocks, PewterGymTextPointers, PewterGymScript ; blocks, texts, scripts
	db 0 ; connections
	dw PewterGymObject ; objects
