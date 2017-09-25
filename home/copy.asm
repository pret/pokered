FarCopyData::
; Copy bc bytes from a:hl to de.
	ld [wBuffer], a
	ld a, [hLoadedROMBank]
	push af
	ld a, [wBuffer]
	ld [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call CopyData
	pop af
	ld [hLoadedROMBank], a
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
