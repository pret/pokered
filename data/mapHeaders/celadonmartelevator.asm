CeladonMartElevator_h: ; 0x485f4 to 0x48600 (12 bytes) (bank=12) (id=127)
	db LOBBY ; tileset
	db CELADON_MART_ELEVATOR_HEIGHT, CELADON_MART_ELEVATOR_WIDTH ; dimensions (y, x)
	dw CeladonMartElevatorBlocks, CeladonMartElevatorTextPointers, CeladonMartElevatorScript ; blocks, texts, scripts
	db $00 ; connections
	dw CeladonMartElevatorObject ; objects
