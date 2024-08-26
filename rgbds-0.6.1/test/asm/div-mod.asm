def _ASM equ 0

MACRO test
	; Test RGBASM
	redef V equs "_ASM +"
	static_assert \#
	; Test RGBLINK
	redef V equs "_LINK +"
	assert \#
ENDM

MACRO test_mod
	def x = \1 ; dividend
	def y = \2 ; divisor
	shift 2
	def q = x / y ; quotient
	def r = x % y ; remainder
	; identity laws
	test (V (q * y + r)) == (V x)
	test (V (x + y) % y) == (V r)
	test (V (x - y) % y) == (V r)
ENDM

MACRO test_each_mod
	test_mod (\1), (\2)
	test_mod (\1), -(\2)
	test_mod -(\1), (\2)
	test_mod -(\1), -(\2)
ENDM

MACRO test_pow
	def x = \1 ; dividend
	def y = 2 ** \2 ; divisor
	def r = x % y ; remainder
	def m = x & (y - 1) ; mask
	; identity law
	test (V r) == (V m)
ENDM

MACRO test_each_pow
	test_pow (\1), (\2)
	test_pow -(\1), (\2)
ENDM

	test_each_mod 0, 1
	test_each_mod 7, 5
	test_each_mod 42, 256
	test_each_mod 567, 256
	test_each_mod 256, 512
	test_each_mod 1, 65535
	test_each_mod 100, 65535
	test_each_mod 10000, 65535
	test_each_mod 1000000, 65535

	test_each_pow 5, 1
	test_each_pow 42, 8
	test_each_pow 567, 8
	test_each_pow 12345, 16
	test_each_pow 99999, 16

SECTION "LINK", ROM0
_LINK::
