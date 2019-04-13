VermilionPokecenter_h:
	db POKECENTER ; tileset
	db VERMILION_POKECENTER_HEIGHT, VERMILION_POKECENTER_WIDTH ; dimensions (y, x)
	dw VermilionPokecenterBlocks, VermilionPokecenterTextPointers, VermilionPokecenterScript ; blocks, texts, scripts
	db 0 ; connections
	dw VermilionPokecenterObject ; objects
