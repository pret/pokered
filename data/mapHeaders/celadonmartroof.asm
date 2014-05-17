CeladonMartRoof_h: ; 0x483c9 to 0x483d5 (12 bytes) (bank=12) (id=126)
	db LOBBY ; tileset
	db CELADON_MART_ROOF_HEIGHT, CELADON_MART_ROOF_WIDTH ; dimensions (y, x)
	dw CeladonMartRoofBlocks, CeladonMartRoofTextPointers, CeladonMartRoofScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMartRoofObject ; objects
