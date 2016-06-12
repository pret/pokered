TradeCenter_h:
	db CLUB ; tileset
	db TRADE_CENTER_HEIGHT, TRADE_CENTER_WIDTH ; dimensions (y, x)
	dw TradeCenterBlocks, TradeCenterTextPointers, TradeCenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw TradeCenterObject ; objects
