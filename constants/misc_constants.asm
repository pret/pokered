; Boolean checks
DEF FALSE EQU 0
DEF TRUE  EQU 1

; flag operations
	const_def
	const FLAG_RESET ; 0
	const FLAG_SET   ; 1
	const FLAG_TEST  ; 2

; input
DEF NO_INPUT EQU 0

; SGB command MLT_REQ can be used to detect SGB hardware
DEF JOYP_SGB_MLT_REQ EQU %00000011
