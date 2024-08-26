SECTION UNION "a", WRAM0
	ds 10
a1:

SECTION UNION "b", WRAMX,ALIGN[4]
banked::
	ds 10
b1:

SECTION UNION "c", HRAM[$FFC0]
	ds 5
c1::

SECTION UNION "d", SRAM,ALIGN[8,$BA]
d1::

SECTION UNION "e", SRAM[$BABE]


SECTION "output 1", ROM0
	dw a1,a2 ; $C00A, $C02A
	dw b1,b2 ; $DABA, $DAB2
	dw c1,c2 ; $FFC5, $FFC5

SECTION "output 3", ROM0
	db BANK(banked)
	dw d1,d2 ; $ABBA, $BBBA
