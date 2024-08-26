MACRO outer_ok
definition equs "MACRO inner_ok\nPRINTLN \"Hello!\"\nENDM"
definition
	PURGE definition
ENDM

	outer_ok
	inner_ok


MACRO outer_arg
definition equs "MACRO inner_arg\nPRINTLN \"outer: \1\\ninner: \\1\"\nENDM"
definition
	PURGE definition
ENDM

	outer_arg outside
	inner_arg inside


MACRO outer
	WARN "Nested macros shouldn't work, whose argument would be \\1?"
MACRO inner
ENDM

	outer
	inner
