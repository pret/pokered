RocketHideoutElevator_h:
	db LOBBY ; tileset
	db ROCKET_HIDEOUT_ELEVATOR_HEIGHT, ROCKET_HIDEOUT_ELEVATOR_WIDTH ; dimensions (y, x)
	dw RocketHideoutElevator_Blocks ; blocks
	dw RocketHideoutElevator_TextPointers ; texts
	dw RocketHideoutElevator_Script ; scripts
	db 0 ; connections
	dw RocketHideoutElevator_Object ; objects
