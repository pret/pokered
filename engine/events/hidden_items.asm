;;;;;;;;;; PureRGBnote: ADDED: CHANGED: most of these functions were modified to allow multiple hidden items to be picked up at once. 

HiddenItems::
	call HiddenItemsInit
	ret nz
	ld a, 1
	jr HiddenItemsFinish

HiddenItems2:
	call HiddenItemsInit
	ret nz
	ld a, 2
	jr HiddenItemsFinish

HiddenItems3:
	call HiddenItemsInit
	ret nz
	ld a, 3
	jr HiddenItemsFinish

HiddenItems5:
	call HiddenItemsInit
	ret nz
	ld a, 5
	jr HiddenItemsFinish

HiddenItemsInit:
	ld hl, HiddenItemCoords
	call FindHiddenItemOrCoinsIndex
	ld [wHiddenItemOrCoinsIndex], a
	ld hl, wObtainedHiddenItemsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	call EnableAutoTextBoxDrawing
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, [wHiddenObjectFunctionArgument] ; item ID
	ld [wNamedObjectIndex], a
	call GetItemName
	xor a ; clear z flag and set a = 0
	ret

HiddenItemsFinish:
	ld [wTempStore1], a
	ld a, "@"
	ld [wTempStore2], a
	tx_pre_jump FoundHiddenItemText

INCLUDE "data/events/hidden_item_coords.asm"

FoundHiddenItemText::
	text_asm
	ld a, [wTempStore1]
	ld c, a
	cp 1
	jr nz, .multiItem
	ld hl, FoundHiddenItemSingleText
	push bc
	rst _PrintText
	pop bc
	jr .give
.multiItem
	ld a, c
	add NUMBER_CHAR_OFFSET ; index of first number character in charmap (assumes a must be 0-9)
	ld [wTempStore1], a ; this store now stores the numeric text character to display in the text
	ld hl, FoundHiddenItemMultiText
	push bc
	rst _PrintText
	pop bc
.give
	ld a, [wHiddenObjectFunctionArgument] ; item ID
	ld b, a
	call GiveItem
	jr nc, .bagFull
	ld hl, wObtainedHiddenItemsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	ld a, SFX_GET_ITEM_2
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	xor a
	ld [wTempStore1], a
	rst TextScriptEnd
.bagFull
	call WaitForTextScrollButtonPress ; wait for button press
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, HiddenItemBagFullText
	rst _PrintText
	xor a
	ld [wTempStore1], a
	rst TextScriptEnd

FoundHiddenItemSingleText::
	text_far _FoundHiddenItemText
	text_end

FoundHiddenItemMultiText::
	text_far _FoundHiddenItemMultiText
	text_end

HiddenItemBagFullText::
	text_far _HiddenItemBagFullText
	text_end

;;;;;;;;;;


HiddenCoins:
	CheckEvent EVENT_GOT_COIN_CASE ; PureRGBnote: CHANGED: coin case is now just an event instead of an item in your bag.
	ret z
	ld hl, HiddenCoinCoords
	call FindHiddenItemOrCoinsIndex
	ld [wHiddenItemOrCoinsIndex], a
	ld hl, wObtainedHiddenCoinsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_TEST
	predef FlagActionPredef
	ld a, c
	and a
	ret nz
	xor a
	ldh [hUnusedCoinsByte], a
	ldh [hCoins], a
	ldh [hCoins + 1], a
	ld a, [wHiddenObjectFunctionArgument]
	sub COIN
	cp 10
	jr z, .bcd10
	cp 20
	jr z, .bcd20
	cp 40
	jr z, .bcd40
	jr .bcd100
.bcd10
	ld a, $10
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd20
	ld a, $20
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd40 ; due to a typo, this is never used
	ld a, $40
	ldh [hCoins + 1], a
	jr .bcdDone
.bcd100
	ld a, $1
	ldh [hCoins], a
.bcdDone
	ld de, wPlayerCoins + 1
	ld hl, hCoins + 1
	ld c, $2
	predef AddBCDPredef
	ld hl, wObtainedHiddenCoinsFlags
	ld a, [wHiddenItemOrCoinsIndex]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	call EnableAutoTextBoxDrawing
	ld a, [wPlayerCoins]
	cp $99
	jr nz, .roomInCoinCase
	ld a, [wPlayerCoins + 1]
	cp $99
	jr nz, .roomInCoinCase
	tx_pre_id DroppedHiddenCoinsText
	jr .done
.roomInCoinCase
	tx_pre_id FoundHiddenCoinsText
.done
	jp PrintPredefTextID

INCLUDE "data/events/hidden_coins.asm"

FoundHiddenCoinsText::
	text_far _FoundHiddenCoinsText
	sound_get_item_2
	text_end

DroppedHiddenCoinsText::
	text_far _FoundHiddenCoins2Text
	sound_get_item_2
	text_far _DroppedHiddenCoinsText
	text_end

FindHiddenItemOrCoinsIndex:
	ld a, [wHiddenObjectY]
	ld d, a
	ld a, [wHiddenObjectX]
	ld e, a
	ld a, [wCurMap]
	ld b, a
	ld c, -1
.loop
	inc c
	ld a, [hli]
	cp -1 ; end of the list?
	ret z  ; if so, we're done here
	cp b
	jr nz, .next1
	ld a, [hli]
	cp d
	jr nz, .next2
	ld a, [hli]
	cp e
	jr nz, .loop
	ld a, c
	ret
.next1
	inc hl
.next2
	inc hl
	jr .loop
