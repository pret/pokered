SilphCoElevator_h:
	db LOBBY ; tileset
	db SILPH_CO_ELEVATOR_HEIGHT, SILPH_CO_ELEVATOR_WIDTH ; dimensions (y, x)
	dw SilphCoElevatorBlocks, SilphCoElevatorTextPointers, SilphCoElevatorScript ; blocks, texts, scripts
	db 0 ; connections
	dw SilphCoElevatorObject ; objects
