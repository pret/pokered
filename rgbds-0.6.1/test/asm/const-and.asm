
	println @ & 0 ; This should produce an error, but not crash

SECTION "Test", ROM0,ALIGN[4,2]

	ds 40
Aligned:

	println Aligned & $0f
	println ~$fffc & Aligned
	println Aligned & $1f ; Not constant
	println @ & $0f

SECTION "Unaligned", ROM0

	println @ & 0
	println @ & 1 ; Nope
