CeruleanPokecenter_h: ; 0x5c639 to 0x5c645 (12 bytes) (id=64)
	db POKECENTER ; tileset
	db CERULEAN_POKECENTER_HEIGHT, CERULEAN_POKECENTER_WIDTH ; dimensions (y, x)
	dw CeruleanPokecenterBlocks, CeruleanPokecenterTextPointers, CeruleanPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanPokecenterObject ; objects
