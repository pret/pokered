OPT r34 ; :3
OPT r 360

; Invalid
OPT r ; Missing arg
OPT r 2a ; Bad decimal

; Check that it has an effect
OPT r 0
MACRO m
	m
ENDM
	m
