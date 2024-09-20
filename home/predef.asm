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
	call SetCurBank

	call GetPredefPointer

	ld a, [wPredefBank]
	call SetCurBank

	call hl_caller

	pop af
	jp SetCurBank

GetPredefRegisters::
; Restore the contents of register pairs
; when GetPredefPointer was called.
	de_deref_reverse wPredefDE
	bc_deref_reverse wPredefBC
	hl_deref_reverse wPredefHL
	ret
