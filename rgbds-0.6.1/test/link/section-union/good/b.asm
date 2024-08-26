SECTION UNION "a", WRAM0
a1: ; This is here to check that the two `a1` don't conflict
	ds 42
a2::

SECTION UNION "b", WRAMX[$DAB0]
	ds 2
b2::

SECTION UNION "c", HRAM[$FFC0]
b1: ; Same but in different sections now
	ds 5
c2::

SECTION UNION "d", SRAM,ALIGN[12,$BBA]
	ds $1000
d2::

SECTION UNION "e", SRAM,ALIGN[8,$BE]


SECTION "output 2", ROM0
	dw a1,a2
	dw b1,b2
	dw c1,c2
