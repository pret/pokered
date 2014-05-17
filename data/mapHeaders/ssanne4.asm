SSAnne4_h: ; 0x61622 to 0x6162e (12 bytes) (id=98)
	db SHIP ; tileset
	db SS_ANNE_4_HEIGHT, SS_ANNE_4_WIDTH ; dimensions (y, x)
	dw SSAnne4Blocks, SSAnne4TextPointers, SSAnne4Script ; blocks, texts, scripts
	db $00 ; connections
	dw SSAnne4Object ; objects
