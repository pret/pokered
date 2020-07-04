farcall EQUS "callba"

callba: MACRO
	ld b, BANK(\1)
	ld hl, \1
	call Bankswitch
ENDM

callab: MACRO
	ld hl, \1
	ld b, BANK(\1)
	call Bankswitch
ENDM

jpba: MACRO
	ld b, BANK(\1)
	ld hl, \1
	jp Bankswitch
ENDM

jpab: MACRO
	ld hl, \1
	ld b, BANK(\1)
	jp Bankswitch
ENDM

homecall: MACRO
	ld a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call \1
	pop af
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
ENDM
