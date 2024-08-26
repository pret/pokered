SECTION "aaa", ROM0[5]
	println SECTION(@)
	Label1: println SECTION(Label1)
	dw STARTOF(SECTION(@))

SECTION UNION "bbb", WRAM0
	println SECTION(@)
	Label2:
	.local1: println SECTION(Label2.local1)
	.local2: println SECTION(.local2)

SECTION FRAGMENT "ccc", HRAM
	println SECTION(@)
	: println SECTION(:-)

	PUSHS
	SECTION "ddd", ROMX
		println SECTION(@)
	POPS
