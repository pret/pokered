CeladonMartElevatorObject:
	db 15 ; border block

	db 2 ; warps
	warp 1, 3, 5, CELADON_MART_1
	warp 2, 3, 5, CELADON_MART_1

	db 1 ; signs
	sign 3, 0, 1 ; CeladonMartElevatorText1

	db 0 ; objects

	; warp-to
	warp_to 1, 3, CELADON_MART_ELEVATOR_WIDTH ; CELADON_MART_1
	warp_to 2, 3, CELADON_MART_ELEVATOR_WIDTH ; CELADON_MART_1
