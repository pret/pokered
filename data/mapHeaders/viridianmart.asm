ViridianMart_h: ; 0x1d462 to 0x1d46e (12 bytes) (bank=7) (id=42)
	db MART ; tileset
	db VIRIDIAN_MART_HEIGHT, VIRIDIAN_MART_WIDTH ; dimensions (y, x)
	dw ViridianMartBlocks, ViridianMartTextPointers, ViridianMartScript ; blocks, texts, scripts
	db $00 ; connections
	dw ViridianMartObject ; objects
