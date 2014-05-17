RocketHideoutElevator_h: ; 0x45704 to 0x45710 (12 bytes) (bank=11) (id=203)
	db LOBBY ; tileset
	db ROCKET_HIDEOUT_ELEVATOR_HEIGHT, ROCKET_HIDEOUT_ELEVATOR_WIDTH ; dimensions (y, x)
	dw RocketHideoutElevatorBlocks, RocketHideoutElevatorTextPointers, RocketHideoutElevatorScript ; blocks, texts, scripts
	db $00 ; connections
	dw RocketHideoutElevatorObject ; objects
