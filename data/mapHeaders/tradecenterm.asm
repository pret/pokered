TradeCenterM_h: ; 0x4fd71 to 0x4fd7d (12 bytes) (id=240)
	db CLUB ; tileset
	db TRADE_CENTER_HEIGHT, TRADE_CENTER_WIDTH ; dimensions (y, x)
	dw TradeCenterMBlocks, TradeCenterMTextPointers, TradeCenterMScript ; blocks, texts, scripts
	db $00 ; connections
	dw TradeCenterMObject ; objects
