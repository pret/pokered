def foo equs "bar"
def bar equs "qux"
MACRO test
	\1
ENDM
	test foo 0
