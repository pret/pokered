PewterPokecenter_h:
	db POKECENTER ; tileset
	db PEWTER_POKECENTER_HEIGHT, PEWTER_POKECENTER_WIDTH ; dimensions (y, x)
	dw PewterPokecenterBlocks, PewterPokecenterTextPointers, PewterPokecenterScript ; blocks, texts, scripts
	db 0 ; connections
	dw PewterPokecenterObject ; objects
