MACRO test
	PUSHO
	OPT Q\1
	print STRFMT("Q%4s", "\1")
	def n = 1.14159
	println STRFMT(" -> %032b", n)
	POPO
ENDM

	for x, 1, 32
		if x < 16
			test .{d:x}
		else
			test {d:x}
		endc
	endr
	test .0 ; error
	test 32 ; error
