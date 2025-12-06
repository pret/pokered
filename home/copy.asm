FarCopyData::
; Copy bc bytes from a:hl to de.
	ld [wBuffer], a
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wBuffer]
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call CopyData
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ret

CopyData::
; Copy bc bytes from hl to de.
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopyData
	ret

; retrieve a single byte from a:hl, and return it in a.
GetFarByte::
	; bankswitch to new bank
	call BankswitchHome

	; get byte from new bank
	ld a, [hl]
	ldh [hFarByte], a

	; bankswitch to previous bank
	call BankswitchBack

	; return retrieved value in a
	ldh a, [hFarByte]
	ret