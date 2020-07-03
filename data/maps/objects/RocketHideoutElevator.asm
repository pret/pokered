RocketHideoutElevator_Object:
	db $f ; border block

	db 2 ; warps
	warp 2, 1, 2, ROCKET_HIDEOUT_B1F
	warp 3, 1, 4, ROCKET_HIDEOUT_B1F

	db 1 ; signs
	sign 1, 1, 1 ; RocketHideoutElevatorText1

	db 0 ; objects

	; warp-to
	warp_to 2, 1, ROCKET_HIDEOUT_ELEVATOR_WIDTH ; ROCKET_HIDEOUT_B1F
	warp_to 3, 1, ROCKET_HIDEOUT_ELEVATOR_WIDTH ; ROCKET_HIDEOUT_B1F
