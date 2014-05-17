Lab4_h: ; 0x75d25 to 0x75d31 (12 bytes) (id=170)
	db LAB ; tileset
	db CINNABAR_LAB_4_HEIGHT, CINNABAR_LAB_4_WIDTH ; dimensions (y, x)
	dw Lab4Blocks, Lab4TextPointers, Lab4Script ; blocks, texts, scripts
	db $00 ; connections
	dw Lab4Object ; objects
