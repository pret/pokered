VermilionDock_h:
	db SHIP_PORT ; tileset
	db VERMILION_DOCK_HEIGHT, VERMILION_DOCK_WIDTH ; dimensions (y, x)
	dw VermilionDockBlocks, VermilionDockTextPointers, VermilionDockScript ; blocks, texts, scripts
	db 0 ; connections
	dw VermilionDockObject ; objects
