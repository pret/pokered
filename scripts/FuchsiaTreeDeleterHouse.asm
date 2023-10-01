; PureRGBnote: ADDED: new house in fuchsia city. Has an NPC who will permanently remove specific annoying cut trees for a fee.
; also has his SNORLAX.
FuchsiaTreeDeleterHouse_Script:
	jp EnableAutoTextBoxDrawing

FuchsiaTreeDeleterHouse_TextPointers:
	def_text_pointers
	dw_const TreeDeleterText,             TEXT_FUCHSIATREEDELETERHOUSE_TREE_DELETER
	dw_const TreeDeleterSnorlaxText,      TEXT_FUCHSIATREEDELETERHOUSE_SNORLAX

FuchsiaTreeDeleterHouseText1:
	text_far _FuchsiaTreeDeleterText1
	text_end

FuchsiaTreeDeleterHouseText2:
	text_far _FuchsiaTreeDeleterText2
	text_end

TreeDeleterSnorlaxText:
	text_far _FuchsiaTreeDeleterSnorlax
	sound_cry_snorlax
	text_far _FuchsiaTreeDeleterSnorlax2
	text_end

CheckAllTreesDeleted:
	CheckBothEventsSet EVENT_DELETED_ROUTE2_TREES, EVENT_DELETED_CERULEAN_TREE
	ret nz
	CheckBothEventsSet EVENT_DELETED_ROUTE9_TREE, EVENT_DELETED_FUCHSIA_TREES
	ret

TreeDeleterText:
	text_asm
	call CheckAllTreesDeleted
	jr z, .finalText
	ld hl, FuchsiaTreeDeleterHouseText1
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
.listLoop
	call CheckAllTreesDeleted
	jr z, .noMoreTreesToDelete
	ld hl, FuchsiaTreeDeleterHouseText2
	rst _PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, TreeDeleterOptions
	ld b, A_BUTTON | B_BUTTON
	call DisplayMultiChoiceTextBoxNoMenuReset
	jr nz, .goodbye
	ld hl, TextPointers_TreeDelete
	ld a, [wCurrentMenuItem]
	push af
	call GetAddressFromPointerArray
	rst _PrintText
	pop af
	ld [wCurrentMenuItem], a
	jr .listLoop
.goodbye
	xor a
	ld [wListScrollOffset], a
	ld hl, FuchsiaTreeDeleterDoneText
	rst _PrintText
	rst TextScriptEnd
.noMoreTreesToDelete
	xor a
	ld [wListScrollOffset], a
	ld hl, FuchsiaTreeDeleterFinalText
	rst _PrintText
	rst TextScriptEnd
.finalText
	ld hl, FuchsiaTreeDeleterFinalTextPrompt
	rst _PrintText
	ld hl, FuchsiaTreeDeleterFinalText2
	rst _PrintText
	rst TextScriptEnd


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
	rst _PrintText
	scf
	ret
.notEnoughMoneyTreeDeleter
	ld hl, NotEnoughMoneyTreeDeleterText
	rst _PrintText
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
	rst _PrintText
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
	rst _PrintText
.done
	rst TextScriptEnd

FuchsiaTreeDeleterRoute2Text:
	text_far _FuchsiaTreeDeleterRoute2
	text_end

FuchsiaTreeDeleterCeruleanCity:
	text_asm
	CheckEvent EVENT_DELETED_CERULEAN_TREE
	jr nz, .alreadyDeleted
	ld hl, FuchsiaTreeDeleterCeruleanCityText
	rst _PrintText
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
	rst _PrintText
.done
	rst TextScriptEnd

FuchsiaTreeDeleterCeruleanCityText:
	text_far _FuchsiaTreeDeleterCerulean
	text_end

FuchsiaTreeDeleterRoute9:
	text_asm
	CheckEvent EVENT_DELETED_ROUTE9_TREE
	jr nz, .alreadyDeleted
	ld hl, FuchsiaTreeDeleterRoute9Text
	rst _PrintText
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
	rst _PrintText
.done
	rst TextScriptEnd

FuchsiaTreeDeleterRoute9Text:
	text_far _FuchsiaTreeDeleterRoute9
	text_end

FuchsiaTreeDeleterFuchsiaCity:
	text_asm
	CheckEvent EVENT_DELETED_FUCHSIA_TREES
	jr nz, .alreadyDeleted
	ld hl, FuchsiaTreeDeleterFuchsiaCityText
	rst _PrintText
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
	rst _PrintText
.done
	rst TextScriptEnd

FuchsiaTreeDeleterFuchsiaCityText:
	text_far _FuchsiaTreeDeleterFuchsiaCity
	text_end