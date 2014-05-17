CeladonDiner_h: ; 0x49145 to 0x49151 (12 bytes) (bank=12) (id=138)
	db LOBBY ; tileset
	db CELADON_DINER_HEIGHT, CELADON_DINER_WIDTH ; dimensions (y, x)
	dw CeladonDinerBlocks, CeladonDinerTextPointers, CeladonDinerScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonDinerObject ; objects
