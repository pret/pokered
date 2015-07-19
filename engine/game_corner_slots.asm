StartSlotMachine: ; 37e2d (d:7e2d)
	ld a, [wHiddenObjectFunctionArgument]
	cp $fd
	jr z, .printOutOfOrder
	cp $fe
	jr z, .printOutToLunch
	cp $ff
	jr z, .printSomeonesKeys
	callba AbleToPlaySlotsCheck
	ld a, [wCanPlaySlots]
	and a
	ret z
	ld a, [wLuckySlotHiddenObjectIndex]
	ld b, a
	ld a, [wHiddenObjectIndex]
	inc a
	cp b
	jr z, .match
	ld a, 253
	jr .next
.match
	ld a, 250
.next
	ld [wSlotMachineSevenAndBarModeChance], a
	ld a, [H_LOADEDROMBANK]
	ld [wSlotMachineSavedROMBank], a
	call PromptUserToPlaySlots
	ret
.printOutOfOrder
	tx_pre_id GameCornerOutOfOrderText
	jr .printText
.printOutToLunch
	tx_pre_id GameCornerOutToLunchText
	jr .printText
.printSomeonesKeys
	tx_pre_id GameCornerSomeonesKeysText
.printText
	push af
	call EnableAutoTextBoxDrawing
	pop af
	call PrintPredefTextID
	ret

GameCornerOutOfOrderText: ; 37e79 (d:7e79)
	TX_FAR _GameCornerOutOfOrderText
	db "@"

GameCornerOutToLunchText: ; 37e7e (d:7e7e)
	TX_FAR _GameCornerOutToLunchText
	db "@"

GameCornerSomeonesKeysText: ; 37e83 (d:7e83)
	TX_FAR _GameCornerSomeonesKeysText
	db "@"
