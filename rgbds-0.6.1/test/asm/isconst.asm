
TEST_NUM = 0

MACRO test_expr
TEST_NUM = TEST_NUM + 1

IS_CONST = ISCONST(\1)
	PRINTLN "Test #{d:TEST_NUM}: ISCONST reports {IS_CONST}"
	IF (\1) || 1 ; Only test if the expression can be evaluated
		WARN "Test #{d:TEST_NUM}: Compile-time constant"
	ENDC
ENDM

	test_expr 1
	test_expr UnknownLabel

SECTION "fixed", WRAM0[$CAFE]

FixedLabel:
	ds 42
	test_expr FixedLabel
	test_expr @ - FixedLabel

SECTION "floating", WRAMX

FloatingLabel:
	ds 69
	test_expr FloatingLabel
	test_expr @ - FloatingLabel
