CeladonMartRoof_h:
	db LOBBY ; tileset
	db CELADON_MART_ROOF_HEIGHT, CELADON_MART_ROOF_WIDTH ; dimensions (y, x)
	dw CeladonMartRoofBlocks, CeladonMartRoofTextPointers, CeladonMartRoofScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMartRoofObject ; objects
