; PureRGBnote: ADDED: code was added to trigger pokemart menu lists displaying TM names when scrolling over TMs for sale.
;                     this code is available for any menu list, but the list must indicate with wListMenuHoverTextType that it should check for TMs.

DisplayPokemartDialogue_::
	ld a, [wListScrollOffset]
	ld [wSavedListScrollOffset], a
	call UpdateSprites
	xor a
	ld [wBoughtOrSoldItemInMart], a
	ld hl, wNewInGameFlags
	set IN_POKEMART_MENU, [hl]
.loop
	xor a
	ld [wListMenuHoverTextType], a ; we may have just been in the buy menu and no longer need to read out TM names
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
	ld [wPlayerMonNumber], a
	inc a
	ld [wPrintItemPrices], a
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, BUY_SELL_QUIT_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID

; This code is useless. It copies the address of the pokemart's inventory to hl,
; but the address is never used. ; PureRGBnote: REMOVED: remove pointless code
	;ld hl, wItemListPointer
	;ld a, [hli]
	;ld l, [hl]
	;ld h, a

	ld a, [wMenuExitMethod]
	cp CANCELLED_MENU
	jp z, .done
	ld a, [wChosenMenuItem]
	and a ; buying?
	jp z, .buyMenu
	dec a ; selling?
	jp z, .sellMenu
	dec a ; quitting?
	jp z, .done
.sellMenu
	xor a
	ld [wCurrentMenuItem], a
	callfar InitBagItemList

	ld a, [wNumBagItems]
	and a
	jp z, .bagEmpty
	ld hl, PokemonSellingGreetingText
	rst _PrintText
	call SaveScreenTilesToBuffer1 ; save screen
.sellMenuLoop
	ld a, 1
	ld [wListMenuHoverTextType], a ; we're in a list that might have TMs to read out
	call LoadScreenTilesFromBuffer1 ; restore saved screen
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; draw money text box
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
	jp c, .returnToMainPokemartMenu ; if the player closed the menu
	call BackupItemListIndex
.confirmItemSale ; if the player is trying to sell a specific item
	call IsKeyItem
	ld a, [wIsKeyItem]
	and a
	jr nz, .unsellableItem
	ld a, [wCurItem]
	call IsItemHM
	jr c, .unsellableItem
	ld a, PRICEDITEMLISTMENU
	ld [wListMenuID], a
	ldh [hHalveItemPrices], a ; halve prices when selling
	call DisplayChooseQuantityMenu
	inc a
	jr z, .restoreItemIndexSellMenuLoop ; if the player closed the choose quantity menu with the B button
	ld hl, PokemartTellSellPriceText
	lb bc, 14, 1 ; location that PrintText always prints to, this is useless
	rst _PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	xor a
	ld [wListMenuHoverTextType], a ; we shouldn't read out TMs when showing the Yes/No menu
	ld a, TWO_OPTION_MENU 
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wMenuExitMethod]
	cp CHOSE_SECOND_ITEM
	jr z, .restoreItemIndexSellMenuLoop ; if the player chose No or pressed the B button

; The following code is supposed to check if the player chose No, but the above
; check already catches it. ; PureRGBnote: REMOVED: pointless code
	;ld a, [wChosenMenuItem]
	;dec a
	;jr z, .restoreItemIndexSellMenuLoop

.sellItem
	ld a, [wBoughtOrSoldItemInMart]
	and a
	jr nz, .skipSettingFlag1
	inc a
	ld [wBoughtOrSoldItemInMart], a
.skipSettingFlag1
	call AddAmountSoldToMoney
	ld hl, wNumBagItems
	call RemoveItemFromInventory
.restoreItemIndexSellMenuLoop
	call RestoreItemListIndex
	jp .sellMenuLoop
.unsellableItem
	ld hl, PokemartUnsellableItemText
	rst _PrintText
	jr .restoreItemIndexSellMenuLoop
.bagEmpty
	ld hl, PokemartItemBagEmptyText
	rst _PrintText
	call SaveScreenTilesToBuffer1
	jp .returnToMainPokemartMenu
.buyMenu
	; 0 is already loaded in a
	ld [wCurrentMenuItem], a
	callfar InitItemList

	ld hl, PokemartBuyingGreetingText
	rst _PrintText
	call SaveScreenTilesToBuffer1
.buyMenuLoop
	ld a, 1
	ld [wListMenuHoverTextType], a ; we're in a list that might have TMs to read out
	call LoadScreenTilesFromBuffer1
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, 1
	ld [wPrintItemPrices], a
	inc a ; a = 2 (PRICEDITEMLISTMENU)
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .returnToMainPokemartMenu ; if the player closed the menu
	call BackupItemListIndex
	ld a, 99
	ld [wMaxItemQuantity], a
	xor a
	ldh [hHalveItemPrices], a ; don't halve item prices when buying
	call DisplayChooseQuantityMenu
	inc a
	jr z, .restoreItemIndexBuyMenuLoop ; if the player closed the choose quantity menu with the B button
	ld a, [wCurItem] ; item ID
	ld [wNamedObjectIndex], a ; store item ID for GetItemName
	call GetItemName
	call CopyToStringBuffer
	ld hl, PokemartTellBuyPriceText
	rst _PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	xor a
	ld [wListMenuHoverTextType], a ; we shouldn't read out TMs when showing the Yes/No menu
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wMenuExitMethod]
	cp CHOSE_SECOND_ITEM
	jp z, .restoreItemIndexBuyMenuLoop ; if the player chose No or pressed the B button
.buyItem
	call .isThereEnoughMoney
	jr c, .notEnoughMoney
	ld hl, wNumBagItems
	call AddItemToInventory
	jr nc, .bagFull
	call SubtractAmountPaidFromMoney
	ld a, [wBoughtOrSoldItemInMart]
	and a
	jr nz, .skipSettingFlag2
	ld a, 1
	ld [wBoughtOrSoldItemInMart], a
.skipSettingFlag2
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld hl, PokemartBoughtItemText
	rst _PrintText
.restoreItemIndexBuyMenuLoop
	call RestoreItemListIndex
	jp .buyMenuLoop
.returnToMainPokemartMenu
	call LoadScreenTilesFromBuffer1
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, PokemartAnythingElseText
	rst _PrintText
	jp .loop
.isThereEnoughMoney
	ld de, wPlayerMoney
	ld hl, hMoney
	ld c, 3 ; length of money in bytes
	jp StringCmp
.notEnoughMoney
	ld hl, PokemartNotEnoughMoneyText
	rst _PrintText
	jr .restoreItemIndexBuyMenuLoop
.bagFull
	ld hl, PokemartItemBagFullText
	rst _PrintText
	call RestoreItemListIndex
	jr .returnToMainPokemartMenu
.done
	ld hl, wNewInGameFlags
	res IN_POKEMART_MENU, [hl]
	ld hl, PokemartThankYouText
	rst _PrintText
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	call UpdateSprites
	ld a, [wSavedListScrollOffset]
	ld [wListScrollOffset], a
	ret

PokemartBuyingGreetingText:
	text_far _PokemartBuyingGreetingText
	text_end

PokemartTellBuyPriceText:
	text_far _PokemartTellBuyPriceText
	text_end

PokemartBoughtItemText:
	text_far _PokemartBoughtItemText
	text_end

PokemartNotEnoughMoneyText:
	text_far _PokemartNotEnoughMoneyText
	text_end

PokemartItemBagFullText:
	text_far _PokemartItemBagFullText
	text_end

PokemonSellingGreetingText:
	text_far _PokemonSellingGreetingText
	text_end

PokemartTellSellPriceText:
	text_far _PokemartTellSellPriceText
	text_end

PokemartItemBagEmptyText:
	text_far _PokemartItemBagEmptyText
	text_end

PokemartUnsellableItemText:
	text_far _PokemartUnsellableItemText
	text_end

PokemartThankYouText:
	text_far _PokemartThankYouText
	text_end

PokemartAnythingElseText:
	text_far _PokemartAnythingElseText
	text_end
