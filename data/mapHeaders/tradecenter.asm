TradeCenter_h: ; 0x4fd04 to 0x4fd10 (12 bytes) (id=239)
	db CLUB ; tileset
	db TRADE_CENTER_HEIGHT, TRADE_CENTER_WIDTH ; dimensions (y, x)
	dw TradeCenterBlocks, TradeCenterTextPointers, TradeCenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw TradeCenterObject ; objects
