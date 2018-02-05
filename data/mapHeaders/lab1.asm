Lab1_h:
	db LAB ; tileset
	db CINNABAR_LAB_1_HEIGHT, CINNABAR_LAB_1_WIDTH ; dimensions (y, x)
	dw Lab1Blocks, Lab1TextPointers, Lab1Script ; blocks, texts, scripts
	db 0 ; connections
	dw Lab1Object ; objects
