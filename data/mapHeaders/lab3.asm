Lab3_h: ; 0x75c7b to 0x75c87 (12 bytes) (id=169)
	db LAB ; tileset
	db CINNABAR_LAB_3_HEIGHT, CINNABAR_LAB_3_WIDTH ; dimensions (y, x)
	dw Lab3Blocks, Lab3TextPointers, Lab3Script ; blocks, texts, scripts
	db $00 ; connections
	dw Lab3Object ; objects
