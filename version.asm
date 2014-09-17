check_ver: MACRO
if !def(\1)
\1 EQU 0
endc
ENDM

	check_ver _RED
	check_ver _BLUE
	check_ver _JAPAN
	check_ver _GREEN
	check_ver _YELLOW
