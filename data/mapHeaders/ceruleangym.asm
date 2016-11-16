CeruleanGym_h:
	db GYM ; tileset
	db CERULEAN_GYM_HEIGHT, CERULEAN_GYM_WIDTH ; dimensions (y, x)
	dw CeruleanGymBlocks, CeruleanGymTextPointers, CeruleanGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanGymObject ; objects
