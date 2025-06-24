MACRO farcall
	ld b, BANK(\1)
	ld hl, \1
	call Bankswitch
ENDM

MACRO callfar
	ld hl, \1
	ld b, BANK(\1)
	call Bankswitch
ENDM

MACRO farjp
	ld b, BANK(\1)
	ld hl, \1
	jp Bankswitch
ENDM

MACRO jpfar
	ld hl, \1
	ld b, BANK(\1)
	jp Bankswitch
ENDM

MACRO homecall
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call \1
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
ENDM

MACRO homecall_sf ; homecall but save flags by popping into bc instead of af
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(\1)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call \1
	pop bc
	ld a, b
	ldh [hLoadedROMBank], a
	ld [rROMB], a
ENDM
