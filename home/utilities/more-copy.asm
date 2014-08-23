FarCopyData2::
; Identical to FarCopyData, but uses $ff8b
; as temp space instead of wBuffer.
	ld [$ff8b],a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [MBC3RomBank],a
	call CopyData
	pop af
	ld [H_LOADEDROMBANK],a
	ld [MBC3RomBank],a
	ret

FarCopyData3::
; Copy bc bytes from a:de to hl.
	ld [$ff8b],a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [MBC3RomBank],a
	push hl
	push de
	push de
	ld d,h
	ld e,l
	pop hl
	call CopyData
	pop de
	pop hl
	pop af
	ld [H_LOADEDROMBANK],a
	ld [MBC3RomBank],a
	ret

FarCopyDataDouble::
; Expand bc bytes of 1bpp image data
; from a:hl to 2bpp data at de.
	ld [$ff8b],a
	ld a,[H_LOADEDROMBANK]
	push af
	ld a,[$ff8b]
	ld [H_LOADEDROMBANK],a
	ld [MBC3RomBank],a
.loop
	ld a,[hli]
	ld [de],a
	inc de
	ld [de],a
	inc de
	dec bc
	ld a,c
	or b
	jr nz,.loop
	pop af
	ld [H_LOADEDROMBANK],a
	ld [MBC3RomBank],a
	ret