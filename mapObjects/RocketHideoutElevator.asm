RocketHideoutElevatorObject: ; 0x45791 (size=23)
	db $f ; border tile

	db $2 ; warps
	db $1, $2, $2, ROCKET_HIDEOUT_1
	db $1, $3, $4, ROCKET_HIDEOUT_1

	db $1 ; signs
	db $1, $1, $1 ; RocketHideoutElevatorText1

	db $0 ; people

	; warp-to
	EVENT_DISP $3, $1, $2 ; ROCKET_HIDEOUT_1
	EVENT_DISP $3, $1, $3 ; ROCKET_HIDEOUT_1
