Lab3_h:
	db LAB ; tileset
	db CINNABAR_LAB_3_HEIGHT, CINNABAR_LAB_3_WIDTH ; dimensions (y, x)
	dw Lab3Blocks, Lab3TextPointers, Lab3Script ; blocks, texts, scripts
	db $00 ; connections
	dw Lab3Object ; objects
