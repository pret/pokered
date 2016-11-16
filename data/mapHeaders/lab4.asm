Lab4_h:
	db LAB ; tileset
	db CINNABAR_LAB_4_HEIGHT, CINNABAR_LAB_4_WIDTH ; dimensions (y, x)
	dw Lab4Blocks, Lab4TextPointers, Lab4Script ; blocks, texts, scripts
	db $00 ; connections
	dw Lab4Object ; objects
