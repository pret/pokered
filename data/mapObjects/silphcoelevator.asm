SilphCoElevatorObject:
	db $f ; border block

	db $2 ; warps
	db $3, $1, $0, $ed
	db $3, $2, $0, $ed

	db $1 ; signs
	db $0, $3, $1 ; SilphCoElevatorText1

	db $0 ; objects

	; warp-to
	EVENT_DISP SILPH_CO_ELEVATOR_WIDTH, $3, $1
	EVENT_DISP SILPH_CO_ELEVATOR_WIDTH, $3, $2
