SilphCoElevatorObject: ; 0x45844 (size=23)
	db $f ; border tile

	db $2 ; warps
	db $3, $1, $0, $ed
	db $3, $2, $0, $ed

	db $1 ; signs
	db $0, $3, $1 ; SilphCoElevatorText1

	db $0 ; people

	; warp-to
	EVENT_DISP $2, $3, $1
	EVENT_DISP $2, $3, $2