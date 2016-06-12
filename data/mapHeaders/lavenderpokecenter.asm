LavenderPokecenter_h:
	db POKECENTER ; tileset
	db LAVENDER_POKECENTER_HEIGHT, LAVENDER_POKECENTER_WIDTH ; dimensions (y, x)
	dw LavenderPokecenterBlocks, LavenderPokecenterTextPointers, LavenderPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw LavenderPokecenterObject ; objects
