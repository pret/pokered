DayCareM_h: ; 0x56243 to 0x5624f (12 bytes) (id=72)
	db HOUSE ; tileset
	db DAYCAREM_HEIGHT, DAYCAREM_WIDTH ; dimensions (y, x)
	dw DayCareMBlocks, DayCareMTextPointers, DayCareMScript ; blocks, texts, scripts
	db $00 ; connections
	dw DayCareMObject ; objects
