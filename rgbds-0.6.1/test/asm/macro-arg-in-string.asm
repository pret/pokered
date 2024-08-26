MACRO print1
	if _NARG == 2
		assert !STRCMP("\1", \2)
	endc
	PRINTLN "\1"
ENDM

	print1 John "Danger" Smith
	print1 \\\\A\\nB\n, "\\\\A\\nB\n"
	print1 C\
D
	print1 E\!F ; illegal character escape


MACRO iprint
	PRINTLN "{\1}"
ENDM

s EQUS "hello"
	iprint s

MACRO symprint
	PRINTLN {\1}
ENDM

hello EQUS "\"goodbye\""
	symprint s
