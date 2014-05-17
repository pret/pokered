CeruleanGym_h: ; 0x5c6a7 to 0x5c6b3 (12 bytes) (id=65)
	db GYM ; tileset
	db CERULEAN_GYM_HEIGHT, CERULEAN_GYM_WIDTH ; dimensions (y, x)
	dw CeruleanGymBlocks, CeruleanGymTextPointers, CeruleanGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanGymObject ; objects
