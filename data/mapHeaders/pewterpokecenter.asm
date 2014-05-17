PewterPokecenter_h: ; 0x5c57b to 0x5c587 (12 bytes) (id=58)
	db POKECENTER ; tileset
	db PEWTER_POKECENTER_HEIGHT, PEWTER_POKECENTER_WIDTH ; dimensions (y, x)
	dw PewterPokecenterBlocks, PewterPokecenterTextPointers, PewterPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw PewterPokecenterObject ; objects
