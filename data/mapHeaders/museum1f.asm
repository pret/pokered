Museum1F_h:
	db MUSEUM ; tileset
	db MUSEUM_1F_HEIGHT, MUSEUM_1F_WIDTH ; dimensions (y, x)
	dw Museum1FBlocks, Museum1FTextPointers, Museum1FScript ; blocks, texts, scripts
	db 0 ; connections
	dw Museum1FObject ; objects
