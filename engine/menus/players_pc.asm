; PureRGBnote: CHANGED: most of the players pc code was changed to remember your location in the item list after performing actions
; like withdrawing, depositing...etc.
PlayerPC::
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld a, ITEM_NAME
	ld [wNameListType], a
	call SaveScreenTilesToBuffer1
	xor a
	ld [wBagSavedMenuItem], a
	ld [wParentMenuItem], a
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, PlayerPCMenu
; accessing it directly
	ld a, SFX_TURN_ON_PC
	rst _PlaySound
	ld hl, TurnedOnPC2Text
	rst _PrintText

PlayerPCMenu:
	xor a
	ld [wListMenuHoverTextType], a ; PureRGBnote: ADDED: this list menu can't have TMs so turn off that flag so it doesn't even check to display
	ld a, [wParentMenuItem]
	ld [wCurrentMenuItem], a
	ld hl, wMiscFlags
	set BIT_NO_MENU_BUTTON_SOUND, [hl]
	call LoadScreenTilesFromBuffer2
	hlcoord 0, 0
	lb bc, 10, 14 ; PureRGBnote: CHANGED: increased menu size for WORLD OPTIONS to be added
	call TextBoxBorder
	call UpdateSprites
	hlcoord 2, 2
	ld de, PlayersPCMenuEntries
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 2
	ld [hli], a ; wTopMenuItemY
	dec a
	ld [hli], a ; wTopMenuItemX
	inc hl
	inc hl
	ld a, 4 ; PureRGBnote: CHANGED: increased menu length for WORLD OPTIONS to be added
	ld [hli], a ; wMaxMenuItem
	ld a, A_BUTTON | B_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	xor a
	ld [hl], a
	ld hl, wListScrollOffset
	ld [hli], a ; wListScrollOffset
	ld [hl], a ; wMenuWatchMovingOutOfBounds
	ld [wPlayerMonNumber], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld hl, WhatDoYouWantText
	rst _PrintText
	call HandleMenuInput
	bit BIT_B_BUTTON, a
	jp nz, ExitPlayerPC
	call PlaceUnfilledArrowMenuCursor
	ld a, [wCurrentMenuItem]
	ld [wParentMenuItem], a
	and a
	jp z, PlayerPCWithdraw
	dec a
	jp z, PlayerPCDeposit
	dec a
	jp z, PlayerPCToss
	dec a
	jp z, WorldOptions

ExitPlayerPC:
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a
	jr nz, .next
; accessing it directly
	ld a, SFX_TURN_OFF_PC
	rst _PlaySound
	call WaitForSoundToFinish
.next
	ld hl, wMiscFlags
	res BIT_NO_MENU_BUTTON_SOUND, [hl]
	call LoadScreenTilesFromBuffer2
	xor a
	ld [wListScrollOffset], a
	ld [wBagSavedMenuItem], a
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ret

PlayerPCDeposit:
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	inc a
	ld [wListMenuHoverTextType], a ; PureRGBnote: ADDED: this list menu can have TMs so turn on that flag so it checks each item scrolled over
	ld a, [wNumBagItems]
	and a
	jr nz, .loop
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld hl, NothingToDepositText
	rst _PrintText
	jp PlayerPCMenu
.loop
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld hl, WhatToDepositText
	rst _PrintText
	ld hl, wNumBagItems
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jp c, PlayerPCMenu
	call IsKeyItem
	ld a, 1
	ld [wItemQuantity], a
	call BackupItemListIndex
	ld a, [wIsKeyItem]
	and a
	jr nz, .next
; if it's not a key item, there can be more than one of the item
	ld hl, DepositHowManyText
	rst _PrintText
	call DisplayChooseQuantityMenu
	cp $ff
	jr z, .restoreItemIndex
.next
	ld hl, wNumBoxItems
	call AddItemToInventory
	jr c, .roomAvailable
	ld hl, NoRoomToStoreText
	rst _PrintText
	jr .restoreItemIndex
.roomAvailable
	ld hl, wNumBagItems
	call RemoveItemFromInventory
	call WaitForSoundToFinish
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	call WaitForSoundToFinish
	ld hl, ItemWasStoredText
	rst _PrintText
	; fall through
.restoreItemIndex
	call RestoreItemListIndex
	jp .loop

PlayerPCWithdraw:
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	inc a
	ld [wListMenuHoverTextType], a ; PureRGBnote: ADDED: this list menu can have TMs so turn on that flag so it checks each item scrolled over
	ld a, [wNumBoxItems]
	and a
	jr nz, .loop
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld hl, NothingStoredText
	rst _PrintText
	jp PlayerPCMenu
.loop
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld hl, WhatToWithdrawText
	rst _PrintText
	ld hl, wNumBoxItems
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jp c, PlayerPCMenu
	call IsKeyItem
	ld a, 1
	ld [wItemQuantity], a
	call BackupItemListIndex
	ld a, [wIsKeyItem]
	and a
	jr nz, .next
; if it's not a key item, there can be more than one of the item
	ld hl, WithdrawHowManyText
	rst _PrintText
	call DisplayChooseQuantityMenu
	cp $ff
	jp z, .restoreItemIndex
.next
	ld hl, wNumBagItems
	call AddItemToInventory
	jr c, .roomAvailable
	ld hl, CantCarryMoreText
	rst _PrintText
	jr .restoreItemIndex
.roomAvailable
	ld hl, wNumBoxItems
	call RemoveItemFromInventory
	call WaitForSoundToFinish
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	call WaitForSoundToFinish
	ld hl, WithdrewItemText
	rst _PrintText
	; fall through
.restoreItemIndex
	call RestoreItemListIndex
	jp .loop

PlayerPCToss:
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	inc a
	ld [wListMenuHoverTextType], a ; PureRGBnote: ADDED: this list menu can have TMs so turn on that flag so it checks each item scrolled over
	ld a, [wNumBoxItems]
	and a
	jr nz, .loop
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld hl, NothingStoredText
	rst _PrintText
	jp PlayerPCMenu
.loop
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	ld hl, WhatToTossText
	rst _PrintText
	ld hl, wNumBoxItems
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld a, ITEMLISTMENU
	ld [wListMenuID], a
	push hl
	call DisplayListMenuID
	pop hl
	jp c, PlayerPCMenu
	push hl
	call IsKeyItem
	pop hl
	ld a, 1
	ld [wItemQuantity], a
	call BackupItemListIndex
	ld a, [wIsKeyItem]
	and a
	jr nz, .next
	ld a, [wCurItem]
	call IsItemHM
	jr c, .next
; if it's not a key item, there can be more than one of the item
	push hl
	ld hl, TossHowManyText
	rst _PrintText
	call DisplayChooseQuantityMenu
	pop hl
	cp $ff
	jr z, .restoreItemIndex
.next
	call TossItem ; disallows tossing key items
	; fall through
.restoreItemIndex
	call RestoreItemListIndex
	jp .loop

; PureRGBnote: ADDED: happens when pressing start in a list menu - used for facilitating depositing items from the start item menu
CheckButtonStartPressed::
	bit BIT_START, a
	jr z, .continue
	push af
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jr nz, .dontDoAnything ; not an item list?
	ld a, [wIsInBattle]
	and a
	jr nz, .dontDoAnything ; are we in the battle item list?
	ld a, [wMiscFlags]
	bit BIT_USING_GENERIC_PC, a ; are we in item list within PC menu?
	jr nz, .dontDoAnything
	ld a, [wNewInGameFlags]
	bit IN_POKEMART_MENU, a
	jr nz, .dontDoAnything
	pop af
	ld a, 1 ; load an A button press into a
	ld [wUnusedC000], a ; set the flag that tells the item menu code to trigger the item deposit
.continue
	scf ; set carry, item list code will continue as normal, and in the case of depositing an item, it will trigger the deposit after exiting the menu
	ret
.dontDoAnything
	pop af
	and a ; clear carry, basically means in this case the list will do nothing since start was pressed but we don't have any deposit code to run
	ret

BackupItemListIndex:
	pop de ; pop return addesss
	ld a, [wCurrentMenuItem]
	push af
	ld a, [wListScrollOffset]
	push af
	push de ; push return address
	ret

RestoreItemListIndex:
	pop de ; pop return address
	; restore item index for the item list
	pop af
	ld [wListScrollOffset], a
	pop af
	ld [wCurrentMenuItem], a
	push de ; push return address
	ret

; PureRGBnote: ADDED: dialog for depositing an item from the item menu. Press start on the item menu to trigger it.
DepositItemFromItemMenu::
;;;;; PureRGBnote: CHANGED: cannot deposit SS TICKET while you're on the SS ANNE.
	ld a, [wCurItem]
	cp S_S_TICKET
	jr nz, .notSSTicket
	; block depositing the SS ticket when past the vermilion guard
	ld a, [wCurMap]
	cp VERMILION_CITY
	jr nz, .notVermilionCity
	ld a, [wXCoord]
	cp 18
	jr z, .checkYCoord
	cp 19
	jr z, .checkYCoord
	jr .notSSTicket
.checkYCoord
	ld a, [wYCoord]
	cp 30
	jr z, .blockSSTicket
	cp 31
	jr z, .blockSSTicket
	jr .notSSTicket
.notVermilionCity
	; also block it inside the ss anne areas
	cp SS_ANNE_B1F_ROOMS + 1 ; last SS ANNE room
	jr nc, .notSSTicket
	cp VERMILION_DOCK ; first SS ANNE room
	jr c, .notSSTicket
.blockSSTicket
	ld a, SFX_DENIED
	rst _PlaySound
	ld hl, .cantDeposit
	rst _PrintText
	ret
.notSSTicket
;;;;;
	call IsKeyItem
	ld a, 1
	ld [wItemQuantity], a
	; back up these two values so we can maintain our item list index for after depositing
	call BackupItemListIndex
	ld a, [wIsKeyItem]
	and a
	jr nz, .keyItem
; if it's not a key item, there can be more than one of the item
	ld hl, DepositHowManyToPCText
	rst _PrintText
	call DisplayChooseQuantityMenu
	cp $ff
	jr z, .done
	jp .next
.keyItem
; if it is a key item, ask whether to deposit first
	xor a
	ld [wListMenuHoverTextType], a ; stop attempting to display TM names while this Yes no choice is open.
	ld hl, WantToDepositText
	rst _PrintText
	call YesNoChoice
	ld a, 1
	ld [wListMenuHoverTextType], a ; enable displaying TM names again.
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .done
.next
; do the depositing
	ld hl, wNumBoxItems
	call AddItemToInventory
	jr c, .roomAvailable
	ld hl, NoRoomToStoreText
	rst _PrintText
	jr .done
.roomAvailable
	ld hl, wNumBagItems
	call RemoveItemFromInventory
	call WaitForSoundToFinish
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	call WaitForSoundToFinish
	ld hl, ItemWasStoredText
	rst _PrintText
.done
	call RestoreItemListIndex
	; wCurrentMenuItem's new value still currently loaded in a
	ld [wBagSavedMenuItem], a
	ret
.cantDeposit
	text_far _CantDepositSSTicketText
	text_end

WorldOptions:
	call ClearScreen
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl] ; turn off instant text to display the options menu
	xor a
	ld [wOptionsCancelCursorX], a
	ld [wTopMenuItemY], a
	callfar DisplayWorldOptions
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl] ; go back to instant text
	jp PlayerPCMenu


PlayersPCMenuEntries:
	db   "WITHDRAW ITEM"
	next "DEPOSIT ITEM"
	next "TOSS ITEM"
	next "WORLD OPTIONS"
	next "LOG OFF@"

TurnedOnPC2Text:
	text_far _TurnedOnPC2Text
	text_end

WhatDoYouWantText:
	text_far _WhatDoYouWantText
	text_end

WhatToDepositText:
	text_far _WhatToDepositText
	text_end

WantToDepositText:
	text_far _WantToDepositText
	text_end

DepositHowManyToPCText:
	text_far _DepositHowManyToPCText
	text_end

DepositHowManyText:
	text_far _DepositHowManyText
	text_end

ItemWasStoredText:
	text_far _ItemWasStoredText
	text_end

NothingToDepositText:
	text_far _NothingToDepositText
	text_end

NoRoomToStoreText:
	text_far _NoRoomToStoreText
	text_end

WhatToWithdrawText:
	text_far _WhatToWithdrawText
	text_end

WithdrawHowManyText:
	text_far _WithdrawHowManyText
	text_end

WithdrewItemText:
	text_far _WithdrewItemText
	text_end

NothingStoredText:
	text_far _NothingStoredText
	text_end

CantCarryMoreText:
	text_far _CantCarryMoreText
	text_end

WhatToTossText:
	text_far _WhatToTossText
	text_end

TossHowManyText:
	text_far _TossHowManyText
	text_end

