FuchsiaTreeDeleterHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaTreeDeleterHouse_TextPointers:
	dw FuchsiaTreeDeleter
	dw FuchsiaTreeDeleterSnorlax

FuchsiaTreeDeleterHouseText1:
	text_far _FuchsiaTreeDeleterText1
	text_end

FuchsiaTreeDeleterHouseText2:
	text_far _FuchsiaTreeDeleterText2
	text_end

FuchsiaTreeDeleterSnorlax:
	text_asm
	ld hl, FuchsiaTreeDeleterSnorlaxText
	call PrintText
	ld a, SNORLAX
	call PlayCry
	ld hl, FuchsiaTreeDeleterSnorlaxText2
	call PrintText
	jp TextScriptEnd

FuchsiaTreeDeleterSnorlaxText:
	text_far _FuchsiaTreeDeleterSnorlax
	text_end

FuchsiaTreeDeleterSnorlaxText2:
	text_far _FuchsiaTreeDeleterSnorlax2
	text_end

CheckAllTreesDeleted:
	CheckBothEventsSet EVENT_DELETED_ROUTE2_TREES, EVENT_DELETED_CERULEAN_TREE
	ret nz
	CheckBothEventsSet EVENT_DELETED_ROUTE9_TREE, EVENT_DELETED_FUCHSIA_TREES
	ret

FuchsiaTreeDeleter:
	text_asm
	call CheckAllTreesDeleted
	jr z, .finalText
	ld hl, FuchsiaTreeDeleterHouseText1
	call PrintText
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.listLoop
	call CheckAllTreesDeleted
	jr z, .noMoreTreesToDelete
	ld hl, FuchsiaTreeDeleterHouseText2
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, TreeList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .goodbye
	ld hl, TextPointers_TreeDelete
	ld a, [wcf91]
	sub TREE_ROUTE_2
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	jr .listLoop
.goodbye
	xor a
	ld [wListScrollOffset], a
	ld hl, FuchsiaTreeDeleterDoneText
	call PrintText
	jp TextScriptEnd
.noMoreTreesToDelete
	xor a
	ld [wListScrollOffset], a
	ld hl, FuchsiaTreeDeleterFinalText
	call PrintText
	jp TextScriptEnd
.finalText
	ld hl, FuchsiaTreeDeleterFinalTextPrompt
	call PrintText
	ld hl, FuchsiaTreeDeleterFinalText2
	call PrintText
	jp TextScriptEnd


FuchsiaTreeDeleterDoneText:
	text_far _FuchsiaTreeDeleterDoneText
	text_end

FuchsiaTreeDeleterFinalText:
	text_far _FuchsiaTreeDeleterFinalText
	text_end

FuchsiaTreeDeleterFinalText2:
	text_far _FuchsiaTreeDeleterFinalText2
	text_end

FuchsiaTreeDeleterFinalTextPrompt:
	text_far _FuchsiaTreeDeleterFinalText
	text_promptbutton
	text_end

TreeList:
	db 4
	db TREE_ROUTE_2
	db TREE_CERULEAN_CITY
	db TREE_ROUTE_9
	db TREE_FUCHSIA_CITY
	db -1 ; end

TextPointers_TreeDelete:
	dw FuchsiaTreeDeleterRoute2
	dw FuchsiaTreeDeleterCeruleanCity
	dw FuchsiaTreeDeleterRoute9
	dw FuchsiaTreeDeleterFuchsiaCity

PurchasedTreeDeletion:  
	call IsThereEnoughMoneyTreeDeleter
	jr c, .notEnoughMoneyTreeDeleter
	call SubtractAmountPaidFromMoney
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, FuchsiaTreeDeleterTreeDelete
	call PrintText
	scf
	ret
.notEnoughMoneyTreeDeleter
	ld hl, NotEnoughMoneyTreeDeleterText
	call PrintText
	ret

IsThereEnoughMoneyTreeDeleter:
	ld de, wPlayerMoney
	ld hl, hMoney
	ld c, 3 ; length of money in bytes
	jp StringCmp

NotEnoughMoneyTreeDeleterText:
	text_far _PokemartNotEnoughMoneyText
	text_end

FuchsiaTreeDeleterAlreadyDeletedText:
	text_far _FuchsiaTreeDeleterAlreadyDeletedText
	text_end

FuchsiaTreeDeleterTreeDelete:
	text_far _FuchsiaTreeDeleterTreeDelete
	text_end

FuchsiaTreeDeleterRoute2:
	text_asm
	CheckEvent EVENT_DELETED_ROUTE2_TREES
	jr nz, .alreadyDeleted
	ld hl, FuchsiaTreeDeleterRoute2Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	xor a
	ldh [hMoney], a 
	ldh [hMoney + 2], a
	ld a, $80
	ldh [hMoney + 1], a ; loads 5000 into the cost
	call PurchasedTreeDeletion
	jr c, .setEvent
	jr .done
.setEvent	
	SetEvent EVENT_DELETED_ROUTE2_TREES
	jr .done
.alreadyDeleted
	ld hl, FuchsiaTreeDeleterAlreadyDeletedText
	call PrintText
.done
	jp TextScriptEnd

FuchsiaTreeDeleterRoute2Text:
	text_far _FuchsiaTreeDeleterRoute2
	text_end

FuchsiaTreeDeleterCeruleanCity:
	text_asm
	CheckEvent EVENT_DELETED_CERULEAN_TREE
	jr nz, .alreadyDeleted
	ld hl, FuchsiaTreeDeleterCeruleanCityText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	xor a
	ldh [hMoney], a 
	ldh [hMoney + 2], a
	ld a, $40
	ldh [hMoney + 1], a ; loads 5000 into the cost
	call PurchasedTreeDeletion
	jr c, .setEvent
	jr .done
.setEvent	
	SetEvent EVENT_DELETED_CERULEAN_TREE
	jr .done
.alreadyDeleted
	ld hl, FuchsiaTreeDeleterAlreadyDeletedText
	call PrintText
.done
	jp TextScriptEnd

FuchsiaTreeDeleterCeruleanCityText:
	text_far _FuchsiaTreeDeleterCerulean
	text_end

FuchsiaTreeDeleterRoute9:
	text_asm
	CheckEvent EVENT_DELETED_ROUTE9_TREE
	jr nz, .alreadyDeleted
	ld hl, FuchsiaTreeDeleterRoute9Text
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	xor a
	ldh [hMoney], a 
	ldh [hMoney + 2], a
	ld a, $40
	ldh [hMoney + 1], a ; loads 5000 into the cost
	call PurchasedTreeDeletion
	jr c, .setEvent
	jr .done
.setEvent	
	SetEvent EVENT_DELETED_ROUTE9_TREE
	jr .done
.alreadyDeleted
	ld hl, FuchsiaTreeDeleterAlreadyDeletedText
	call PrintText
.done
	jp TextScriptEnd

FuchsiaTreeDeleterRoute9Text:
	text_far _FuchsiaTreeDeleterRoute9
	text_end

FuchsiaTreeDeleterFuchsiaCity:
	text_asm
	CheckEvent EVENT_DELETED_FUCHSIA_TREES
	jr nz, .alreadyDeleted
	ld hl, FuchsiaTreeDeleterFuchsiaCityText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
	xor a
	ldh [hMoney + 2], a
	ldh [hMoney + 1], a
	ld a, 1
	ldh [hMoney], a ; loads 10000 into the cost
	call PurchasedTreeDeletion
	jr c, .setEvent
	jr .done
.setEvent	
	SetEvent EVENT_DELETED_FUCHSIA_TREES
	jr .done
.alreadyDeleted
	ld hl, FuchsiaTreeDeleterAlreadyDeletedText
	call PrintText
.done
	jp TextScriptEnd

FuchsiaTreeDeleterFuchsiaCityText:
	text_far _FuchsiaTreeDeleterFuchsiaCity
	text_end