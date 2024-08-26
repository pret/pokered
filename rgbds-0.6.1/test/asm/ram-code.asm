SECTION "test", ROM0[1]
	call Target
	PRINTLN "PC in ROM: {@}"
	LOAD "new", WRAMX[$D001],BANK[1]
	PRINTLN "PC in WRAM: {@}"
	assert @ == $D001
Target:	dl DEAD << 16 | BEEF
	db BANK(@)
	jr .end
.end
	jr .end
	ds 2, $2A
	ENDL
After:
	jp Target
	ld hl, Word
	dw Byte, Target.end, After

SECTION "dead", WRAMX[$DEAD],BANK[2]
DEAD:
SECTION "beef", SRAM[$BEEF]
BEEF:

SECTION "ram test", WRAMX,BANK[1] ; Should end up at $D005
Word:
	dw

SECTION "small ram test", WRAMX,BANK[1] ; Should end up at $D000
Byte:
	db

	PRINTLN "{Target}\n{Target.end}\n{After}"
