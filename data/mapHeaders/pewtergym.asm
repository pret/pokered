PewterGym_h: ; 0x5c37b to 0x5c387 (12 bytes) (id=54)
	db GYM ; tileset
	db PEWTER_GYM_HEIGHT, PEWTER_GYM_WIDTH ; dimensions (y, x)
	dw PewterGymBlocks, PewterGymTextPointers, PewterGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw PewterGymObject ; objects
