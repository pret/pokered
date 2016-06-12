CeruleanPokecenter_h:
	db POKECENTER ; tileset
	db CERULEAN_POKECENTER_HEIGHT, CERULEAN_POKECENTER_WIDTH ; dimensions (y, x)
	dw CeruleanPokecenterBlocks, CeruleanPokecenterTextPointers, CeruleanPokecenterScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeruleanPokecenterObject ; objects
