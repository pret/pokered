SECTION "fixed", ROM0[0]

FixedBase:
	assert FixedBase ; This should eval (and fail) at compile time

	ds 0
	static_assert @ == 0, "@ ain't 0 now? (Hint: it's {@})"

	ds 42
	assert WARN, @ - FixedBase != 42 ; This should also eval at compile time

SECTION "floating", ROM0

FloatingBase:
	assert FAIL, FloatingBase == 0 ; This shouldn't eval at compile time

	ds 4
	static_assert FAIL, FloatingBase != 0 ; This is not constant!

	ds 69
	static_assert FATAL, FixedBase != 0 ; This will fail... ↓
	; The point of `FATAL` is for stuff that can, say, cause division by 0!
	static_assert FAIL, 1 / FixedBase, "You dun goofed, son" ; Won't be read
