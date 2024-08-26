SECTION "test fixed", ROM0[0]

FixedStart:
	ds 6, (@ - FixedStart) * 2 + zero
	ds 10, (@ - FixedStart) + zero, (@ - FixedStart) * 3 + zero, (@ - FixedStart) * 4 + zero

SECTION "test floating", ROM0

FloatingStart:
	ds 6, (@ - FloatingStart) * 2 + zero
	ds 10, (@ - FloatingStart) + zero, (@ - FloatingStart) * 3 + zero, (@ - FloatingStart) * 4 + zero

SECTION "zero", ROM0[0]
zero:
