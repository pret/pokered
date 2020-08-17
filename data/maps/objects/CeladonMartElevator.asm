CeladonMartElevator_Object:
	db $f ; border block

	def_warps
	warp 1, 3, 5, CELADON_MART_1F
	warp 2, 3, 5, CELADON_MART_1F

	def_signs
	sign 3, 0, 1 ; CeladonMartElevatorText1

	def_objects

	; warp-to
	warp_to 1, 3, CELADON_MART_ELEVATOR_WIDTH ; CELADON_MART_1F
	warp_to 2, 3, CELADON_MART_ELEVATOR_WIDTH ; CELADON_MART_1F
