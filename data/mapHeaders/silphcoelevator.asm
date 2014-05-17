SilphCoElevator_h: ; 0x457b4 to 0x457c0 (12 bytes) (bank=11) (id=236)
	db LOBBY ; tileset
	db SILPH_CO_ELEVATOR_HEIGHT, SILPH_CO_ELEVATOR_WIDTH ; dimensions (y, x)
	dw SilphCoElevatorBlocks, SilphCoElevatorTextPointers, SilphCoElevatorScript ; blocks, texts, scripts
	db $00 ; connections
	dw SilphCoElevatorObject ; objects
