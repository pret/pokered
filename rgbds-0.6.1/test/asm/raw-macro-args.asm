MACRO printargs
	rept _NARG
		println \1
		shift
	endr
ENDM

MACRO printlit
	rept _NARG
		println "\1"
		shift
	endr
ENDM

NUM EQU 42
STR EQUS "str\"ing"

	printargs NUM
	printargs "{d:NUM}"
	printargs "{STR}", 16 ; comment 1
	printargs "\"literal \\\"\\\\\\\"\""
	printargs "literal \"\\\"", \ ; comment 2
"""multi-"line"
  ""string"" arg"""
	printargs MUL(2.0, 3.0)
	printargs "unclosed

	printlit NUM
	printlit "{d:NUM}"
	printlit "{STR}", 16 ; comment 3
	printlit "\"literal \\\"\\\\\\\"\""
	printlit "literal \"\\\"", \ ; comment 4
"""multi-"line"
  ""string"" arg"""
	printlit MUL(2.0, 3.0)
	printlit this\n is\, \{not\} a\\n syntax\" error
	printlit "unclosed
	printlit """EOF