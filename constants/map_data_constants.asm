; width of east/west connections
; height of north/south connections
MAP_BORDER EQU 3

; connection directions
	const_def
	shift_const EAST  ; 1
	shift_const WEST  ; 2
	shift_const SOUTH ; 4
	shift_const NORTH ; 8

; tileset environments
	const_def
	const INDOOR  ; 0
	const CAVE    ; 1
	const OUTDOOR ; 2
