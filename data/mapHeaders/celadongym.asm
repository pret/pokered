CeladonGym_h:
	db GYM ; tileset
	db CELADON_GYM_HEIGHT, CELADON_GYM_WIDTH ; dimensions (y, x)
	dw CeladonGymBlocks, CeladonGymTextPointers, CeladonGymScript ; blocks, texts, scripts
	db 0 ; connections
	dw CeladonGymObject ; objects
