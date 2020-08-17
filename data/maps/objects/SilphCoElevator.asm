SilphCoElevator_Object:
	db $f ; border block

	def_warps
	warp 1, 3, 0, 237
	warp 2, 3, 0, 237

	def_signs
	sign 3, 0, 1 ; SilphCoElevatorText1

	def_objects

	; warp-to
	warp_to 1, 3, SILPH_CO_ELEVATOR_WIDTH
	warp_to 2, 3, SILPH_CO_ELEVATOR_WIDTH
