Predef::
; Call predefined function a.
; To preserve other registers, have the
; destination call GetPredefRegisters.

	; Save the predef id for GetPredefPointer.
	ld [wPredefID], a

	; A hack for LoadDestinationWarpPosition.
	; See LoadTilesetHeader (predef $19).
	ld a, [H_LOADEDROMBANK]
	ld [wPredefParentBank], a

	push af
	ld a, BANK(GetPredefPointer)
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a

	call GetPredefPointer

	ld a, [wPredefBank]
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a

	ld de, .done
	push de
	jp hl
.done

	pop af
	ld [H_LOADEDROMBANK], a
	ld [MBC1RomBank], a
	ret

GetPredefRegisters::
; Restore the contents of register pairs
; when GetPredefPointer was called.
	ld a, [wPredefRegisters + 0]
	ld h, a
	ld a, [wPredefRegisters + 1]
	ld l, a
	ld a, [wPredefRegisters + 2]
	ld d, a
	ld a, [wPredefRegisters + 3]
	ld e, a
	ld a, [wPredefRegisters + 4]
	ld b, a
	ld a, [wPredefRegisters + 5]
	ld c, a
	ret
