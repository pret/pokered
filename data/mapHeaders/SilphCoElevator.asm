SilphCoElevator_h:
	db LOBBY ; tileset
	db SILPH_CO_ELEVATOR_HEIGHT, SILPH_CO_ELEVATOR_WIDTH ; dimensions (y, x)
	dw SilphCoElevator_Blocks ; blocks
	dw SilphCoElevator_TextPointers ; texts
	dw SilphCoElevator_Script ; scripts
	db 0 ; connections
	dw SilphCoElevator_Object ; objects
