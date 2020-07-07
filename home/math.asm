; function to do multiplication
; all values are big endian
; INPUT
; FF96-FF98 =  multiplicand
; FF99 = multiplier
; OUTPUT
; FF95-FF98 = product
Multiply::
	push hl
	push bc
	callfar _Multiply
	pop bc
	pop hl
	ret

; function to do division
; all values are big endian
; INPUT
; FF95-FF98 = dividend
; FF99 = divisor
; b = number of bytes in the dividend (starting from FF95)
; OUTPUT
; FF95-FF98 = quotient
; FF99 = remainder
Divide::
	push hl
	push de
	push bc
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(_Divide)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call _Divide
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	pop bc
	pop de
	pop hl
	ret
