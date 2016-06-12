RocketHideoutElevatorObject:
	db $f ; border block

	db $2 ; warps
	db $1, $2, $2, ROCKET_HIDEOUT_1
	db $1, $3, $4, ROCKET_HIDEOUT_1

	db $1 ; signs
	db $1, $1, $1 ; RocketHideoutElevatorText1

	db $0 ; objects

	; warp-to
	EVENT_DISP ROCKET_HIDEOUT_ELEVATOR_WIDTH, $1, $2 ; ROCKET_HIDEOUT_1
	EVENT_DISP ROCKET_HIDEOUT_ELEVATOR_WIDTH, $1, $3 ; ROCKET_HIDEOUT_1
