CeladonMartElevator_Object:
	db $f ; border block

	db 2 ; warps
	warp 1, 3, 5, CELADON_MART_1F
	warp 2, 3, 5, CELADON_MART_1F

	db 1 ; signs
	sign 3, 0, 1 ; CeladonMartElevatorText1

	db 0 ; objects

	; warp-to
	warp_to 1, 3, CELADON_MART_ELEVATOR_WIDTH ; CELADON_MART_1F
	warp_to 2, 3, CELADON_MART_ELEVATOR_WIDTH ; CELADON_MART_1F
