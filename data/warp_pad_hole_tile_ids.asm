; format: db tileset id, tile id, value to be put in [wStandingOnWarpPadOrHole]
WarpPadAndHoleData:
	db FACILITY, $20, 1 ; warp pad
	db FACILITY, $11, 2 ; hole
	db CAVERN,   $22, 2 ; hole
	db INTERIOR, $55, 1 ; warp pad
	db $FF
