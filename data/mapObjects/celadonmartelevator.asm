CeladonMartElevatorObject:
	db $f ; border block

	db $2 ; warps
	db $3, $1, $5, CELADON_MART_1
	db $3, $2, $5, CELADON_MART_1

	db $1 ; signs
	db $0, $3, $1 ; CeladonMartElevatorText1

	db $0 ; objects

	; warp-to
	EVENT_DISP CELADON_MART_ELEVATOR_WIDTH, $3, $1 ; CELADON_MART_1
	EVENT_DISP CELADON_MART_ELEVATOR_WIDTH, $3, $2 ; CELADON_MART_1
