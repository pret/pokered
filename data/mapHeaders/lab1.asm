Lab1_h: ; 0x75b80 to 0x75b8c (12 bytes) (id=167)
	db LAB ; tileset
	db CINNABAR_LAB_1_HEIGHT, CINNABAR_LAB_1_WIDTH ; dimensions (y, x)
	dw Lab1Blocks, Lab1TextPointers, Lab1Script ; blocks, texts, scripts
	db $00 ; connections
	dw Lab1Object ; objects
