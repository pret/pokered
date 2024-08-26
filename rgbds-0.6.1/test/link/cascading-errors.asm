SECTION "zero", ROM0[$0]
Zero:

; Pin the section such that a jr to 0 is out of range
SECTION "test", ROM0[$1000]
	;; XXX: the fallback value used is the index of the symbol (in the object file?)
	;; Is this intended?
	dw Bar
	dw Foo / Bar
	dw Foo / Zero

	rst Foo

	jr NonExist

	ldh a, [hNonExist + $200]

	assert Foo == 42
	assert WARN, Bar == 42
