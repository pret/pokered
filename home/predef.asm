Predef::
; Call predefined function a.
; To preserve other registers, have the
; destination call GetPredefRegisters.

	; Save the predef id for GetPredefPointer.
	ld [wPredefID], a

	; A hack for LoadDestinationWarpPosition.
	; See LoadTilesetHeader (predef $19).
	ldh a, [hLoadedROMBank]
	ld [wPredefParentBank], a

	push af
	ld a, BANK(GetPredefPointer)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a

	call GetPredefPointer

	ld a, [wPredefBank]
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a

	ld de, .done
	push de
	jp hl
.done

	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

GetPredefRegisters::
; Restore the contents of register pairs
; when GetPredefPointer was called.
	ld a, [wPredefHL]
	ld h, a
	ld a, [wPredefHL + 1]
	ld l, a
	ld a, [wPredefDE]
	ld d, a
	ld a, [wPredefDE + 1]
	ld e, a
	ld a, [wPredefBC]
	ld b, a
	ld a, [wPredefBC + 1]
	ld c, a
	ret
