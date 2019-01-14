VermilionDock_h:
	db SHIP_PORT ; tileset
	db VERMILION_DOCK_HEIGHT, VERMILION_DOCK_WIDTH ; dimensions (y, x)
	dw VermilionDock_Blocks ; blocks
	dw VermilionDock_TextPointers ; texts
	dw VermilionDock_Script ; scripts
	db 0 ; connections
	dw VermilionDock_Object ; objects
