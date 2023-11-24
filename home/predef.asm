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

	call hl_caller

	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

GetPredefRegisters::
; Restore the contents of register pairs
; when GetPredefPointer was called.
	de_deref_reverse wPredefDE
	bc_deref_reverse wPredefBC
	hl_deref_reverse wPredefHL
	ret
