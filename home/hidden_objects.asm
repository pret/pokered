UpdateCinnabarGymGateTileBlocks::
	farjp UpdateCinnabarGymGateTileBlocks_

CheckForHiddenObjectOrBookshelfOrCardKeyDoor::
	ldh a, [hLoadedROMBank]
	push af
	ldh a, [hJoyHeld]
	bit B_PAD_A, a
	jr z, .nothingFound
; A button is pressed
	ld a, BANK(CheckForHiddenObject)
	ld [rROMB], a
	ldh [hLoadedROMBank], a
	call CheckForHiddenObject
	ldh a, [hDidntFindAnyHiddenObject]
	and a
	jr nz, .hiddenObjectNotFound
	ld a, [wHiddenObjectFunctionRomBank]
	ld [rROMB], a
	ldh [hLoadedROMBank], a
	ld de, .returnAddress
	push de
	jp hl
.returnAddress
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
	ld [rROMB], a
	ldh [hLoadedROMBank], a
	ret
