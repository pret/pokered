StartSlotMachine:
	ld a, [wHiddenEventFunctionArgument]
	cp SLOTS_OUTOFORDER
	jr z, .printOutOfOrder
	cp SLOTS_OUTTOLUNCH
	jr z, .printOutToLunch
	cp SLOTS_SOMEONESKEYS
	jr z, .printSomeonesKeys
	farcall AbleToPlaySlotsCheck
	ld a, [wCanPlaySlots]
	and a
	ret z
	ld a, [wLuckySlotHiddenEventIndex]
	ld b, a
	ld a, [wHiddenEventIndex]
	inc a
	cp b
	jr z, .match
	ld a, 253
	jr .next
.match
	ld a, 250
.next
	ld [wSlotMachineSevenAndBarModeChance], a
	ldh a, [hLoadedROMBank]
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

GameCornerOutOfOrderText::
	text_far _GameCornerOutOfOrderText
	text_end

GameCornerOutToLunchText::
	text_far _GameCornerOutToLunchText
	text_end

GameCornerSomeonesKeysText::
	text_far _GameCornerSomeonesKeysText
	text_end
