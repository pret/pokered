UpdateCinnabarGymGateTileBlocks::
	farjp UpdateCinnabarGymGateTileBlocks_

CheckForHiddenObjectOrBookshelfOrCardKeyDoor::
	ldh a, [hLoadedROMBank]
	push af
	ldh a, [hJoyHeld]
	bit BIT_A_BUTTON, a
	jr z, .nothingFound
; A button is pressed
	ld a, BANK(CheckForHiddenObject)
	call SetCurBank
	call CheckForHiddenObject
	ldh a, [hDidntFindAnyHiddenObject]
	and a
	jr nz, .hiddenObjectNotFound
	ld a, [wHiddenObjectFunctionRomBank]
	call SetCurBank
	call hl_caller
	xor a
	jr .done
.hiddenObjectNotFound
	farcall PrintBookshelfText
	ldh a, [hInteractedWithBookshelf]
	and a
	jr z, .done
.nothingFound
	ld a, $ff
.done
	ldh [hItemAlreadyFound], a
	pop af
	jp SetCurBank
