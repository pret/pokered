FarCopyData::
; Copy bc bytes from a:hl to de.
	ld [wBuffer], a
	ldh a, [hLoadedROMBank]
	push af
	ld a, [wBuffer]
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call CopyData
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
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

FarCopyData2::
; Identical to FarCopyData, but uses hROMBankTemp
; as temp space instead of wBuffer.
	ldh [hROMBankTemp], a
	ldh a, [hLoadedROMBank]
	push af
	ldh a, [hROMBankTemp]
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call CopyData
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret
	