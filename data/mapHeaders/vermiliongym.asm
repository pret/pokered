VermilionGym_h: ; 0x5ca1a to 0x5ca26 (12 bytes) (id=92)
	db GYM ; tileset
	db VERMILION_GYM_HEIGHT, VERMILION_GYM_WIDTH ; dimensions (y, x)
	dw VermilionGymBlocks, VermilionGymTextPointers, VermilionGymScript ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionGymObject ; objects
