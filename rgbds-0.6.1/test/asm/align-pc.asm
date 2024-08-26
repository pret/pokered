SECTION "fixed org", SRAM[$BEAD]
	ds 42
	static_assert @ == $BED7
	align 5,$17


; Should land at $0001
SECTION "align", ROM0,ALIGN[1,1]
	db 69
	align 1 ; This wants to go at $0000, $0002, $0004...


; Should land at $0003
SECTION "under-aligned", ROM0,ALIGN[1,1]
	dw $BEEF
	align 2,1 ; This wants to go at $0001, $0005, $0009...


; Should land at $0005
SECTION "forced align", ROM0
	dw $DEAD
	align 2,3 ; This wants to go at $0003, $0007, $000B...
