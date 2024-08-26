macro test
	; Test the rpn system, as well as the linker...
	DEF expr EQUS STRRPL(STRRPL("\1 + zero)", "<< ", "<< ("), ">> ", ">> (")
	dl expr
	PURGE expr

	; ...as well as the constexpr system
	println "\1 = ", (\1)
endm

section "test", ROM0[0]

	test 1 << 1
	test 1 << 32
	test 1 << 9001
	test -1 << 1
	test -1 << 32
	test -1 << -9001

	test -1 >> 1
	test -1 >> 32
	test -1 >> 9001
	test -4 >> 1
	test -4 >> 2
	test -1 >> -9001

	test $DEADBEEF >> 1
	test $DEADBEEF >>> 1

SECTION "Zero", ROM0[0]
zero:
