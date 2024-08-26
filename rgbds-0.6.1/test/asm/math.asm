X equ 0

MACRO test
; Test RGBASM
v equs "X +"
	static_assert \#
	purge v
; Test RGBLINK
v equs "Y +"
	assert \#
	purge v
ENDM

	test (v 2)*(v 10)**(v 2)*(v 2) == (v 400)
	test -(v 3)**(v 4) == (v -81)
	test (v 1) << (v 30) == (v $4000_0000)
	test (v 2)**(v 30) == (v $4000_0000)

	assert DIV(5.0, 2.0) == 2.5
	assert DIV(-5.0, 2.0) == -2.5
	assert DIV(-5.0, 0.0) == $8000_0000

	assert MUL(10.0, 0.5) == 5.0
	assert MUL(10.0, 0.0) == 0.0

	assert FMOD(5.0, 2.0) == 1.0
	assert FMOD(-5.0, 2.0) == -1.0
	assert FMOD(-5.0, 0.0) == $8000_0000

	assert POW(10.0, 2.0) == 100.0
	assert POW(100.0, 0.5) == 10.0

	assert LOG(100.0, 10.0) == 2.0
	assert LOG(256.0, 2.0) == 8.0

	assert ROUND(1.5) == 2.0
	assert ROUND(-1.5) == -2.0

	assert CEIL(1.5) == 2.0
	assert CEIL(-1.5) == -1.0

	assert FLOOR(1.5) == 1.0
	assert FLOOR(-1.5) == -2.0

SECTION "Y", ROM0
Y::
