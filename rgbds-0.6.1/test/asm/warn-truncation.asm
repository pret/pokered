FOO_F EQU 5
BAR_F EQU 7


SECTION "RAM", WRAMX[$d500]

wLabel::


SECTION "ROM", ROM0

MACRO try
	OPT \1
	; no warning
	db 1 << FOO_F
	db $ff ^ (1 << FOO_F)
	db ~(1 << FOO_F)
	db 1 << BAR_F
	db $ff ^ (1 << BAR_F)
	dw wLabel
	dw $10000 - wLabel
	; warn at level 1
	db 1 << 8
	db ~(1 << 8)
	dw $1d200
	dw -$1d200
	; warn at level 2
	db ~(1 << BAR_F)
	dw -wLabel
ENDM

	try Wno-truncation
	try Wtruncation
	try Wtruncation=0
	try Wtruncation=1
	try Wtruncation=2
	try Werror=truncation=1
	try Werror=truncation=2
