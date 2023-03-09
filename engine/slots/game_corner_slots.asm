StartSlotMachine:
	ld a, [wHiddenObjectFunctionArgument]
	cp SLOTS_OUTOFORDER
	jr z, .printOutOfOrder
	cp SLOTS_OUTTOLUNCH
	jr z, .printOutToLunch
	cp SLOTS_SOMEONESKEYS
	jr z, .printSomeonesKeys
	call AbleToPlaySlotsCheck
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

AbleToPlaySlotsCheck:
	ld a, [wSpritePlayerStateData1ImageIndex]
	and $8
	jr z, .done ; not able
	CheckEvent EVENT_GOT_COIN_CASE ; PureRGBnote: CHANGED: coin case is an event instead of an item now.
	ld b, (GameCornerCoinCaseText_id - TextPredefs) / 2 + 1
	jr z, .printCoinCaseRequired
	ld hl, wPlayerCoins
	ld a, [hli]
	or [hl]
	jr nz, .done ; able to play
	ld b, (GameCornerNoCoinsText_id - TextPredefs) / 2 + 1
.printCoinCaseRequired
	call EnableAutoTextBoxDrawing
	ld a, b
	call PrintPredefTextID
	xor a
.done
	ld [wCanPlaySlots], a
	ret

GameCornerCoinCaseText::
	text_far _GameCornerCoinCaseText
	text_end

GameCornerNoCoinsText::
	text_far _GameCornerNoCoinsText
	text_end
