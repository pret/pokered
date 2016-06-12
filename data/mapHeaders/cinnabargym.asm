CinnabarGym_h:
	db FACILITY ; tileset
	db CINNABAR_GYM_HEIGHT, CINNABAR_GYM_WIDTH ; dimensions (y, x)
	dw CinnabarGymBlocks, CinnabarGymTextPointers, CinnabarGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw CinnabarGymObject ; objects
