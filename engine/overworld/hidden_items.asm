HiddenItems:
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
	ld [wd11e], a
	call GetItemName
	tx_pre_jump FoundHiddenItemText

INCLUDE "data/hidden_item_coords.asm"

FoundHiddenItemText:
	TX_FAR _FoundHiddenItemText
	TX_ASM
	ld a, [wHiddenObjectFunctionArgument] ; item ID
	ld b, a
	ld c, 1
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
	jp TextScriptEnd
.bagFull
	call WaitForTextScrollButtonPress ; wait for button press
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, HiddenItemBagFullText
	call PrintText
	jp TextScriptEnd

HiddenItemBagFullText:
	TX_FAR _HiddenItemBagFullText
	db "@"

HiddenCoins:
	ld b, COIN_CASE
	predef GetQuantityOfItemInBag
	ld a, b
	and a
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
	ld [hUnusedCoinsByte], a
	ld [hCoins], a
	ld [hCoins + 1], a
	ld a, [wHiddenObjectFunctionArgument]
	sub COIN
	cp 10
	jr z, .bcd10
	cp 20
	jr z, .bcd20
	cp 40
	jr z, .bcd20 ; should be bcd40
	jr .bcd100
.bcd10
	ld a, $10
	ld [hCoins + 1], a
	jr .bcdDone
.bcd20
	ld a, $20
	ld [hCoins + 1], a
	jr .bcdDone
.bcd40 ; due to a typo, this is never used
	ld a, $40
	ld [hCoins + 1], a
	jr .bcdDone
.bcd100
	ld a, $1
	ld [hCoins], a
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

INCLUDE "data/hidden_coins.asm"

FoundHiddenCoinsText:
	TX_FAR _FoundHiddenCoinsText
	TX_SFX_ITEM_2
	db "@"

DroppedHiddenCoinsText:
	TX_FAR _FoundHiddenCoins2Text
	TX_SFX_ITEM_2
	TX_FAR _DroppedHiddenCoinsText
	db "@"

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
	cp $ff ; end of the list?
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
