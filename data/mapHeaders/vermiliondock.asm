VermilionDock_h: ; 0x1db46 to 0x1db52 (12 bytes) (bank=7) (id=94)
	db SHIP_PORT ; tileset
	db VERMILION_DOCK_HEIGHT, VERMILION_DOCK_WIDTH ; dimensions (y, x)
	dw VermilionDockBlocks, VermilionDockTextPointers, VermilionDockScript ; blocks, texts, scripts
	db $00 ; connections
	dw VermilionDockObject ; objects
