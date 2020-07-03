SilphCoElevator_Object:
	db $f ; border block

	db 2 ; warps
	warp 1, 3, 0, 237
	warp 2, 3, 0, 237

	db 1 ; signs
	sign 3, 0, 1 ; SilphCoElevatorText1

	db 0 ; objects

	; warp-to
	warp_to 1, 3, SILPH_CO_ELEVATOR_WIDTH
	warp_to 2, 3, SILPH_CO_ELEVATOR_WIDTH
