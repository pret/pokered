CeladonDiner_h:
	db LOBBY ; tileset
	db CELADON_DINER_HEIGHT, CELADON_DINER_WIDTH ; dimensions (y, x)
	dw CeladonDinerBlocks, CeladonDinerTextPointers, CeladonDinerScript ; blocks, texts, scripts
	db 0 ; connections
	dw CeladonDinerObject ; objects
