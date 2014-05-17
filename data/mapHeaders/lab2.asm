Lab2_h: ; 0x75c15 to 0x75c21 (12 bytes) (id=168)
	db LAB ; tileset
	db CINNABAR_LAB_2_HEIGHT, CINNABAR_LAB_2_WIDTH ; dimensions (y, x)
	dw Lab2Blocks, Lab2TextPointers, Lab2Script ; blocks, texts, scripts
	db $00 ; connections
	dw Lab2Object ; objects
