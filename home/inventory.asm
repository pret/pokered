; subtracts the amount the player paid from their money
; OUTPUT: carry = 0(success) or 1(fail because there is not enough money)
SubtractAmountPaidFromMoney::
	farjp SubtractAmountPaidFromMoney_

; adds the amount the player sold to their money
AddAmountSoldToMoney::
	ld de, wPlayerMoney + 2
	ld hl, hMoney + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; redraw money text box
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	jp WaitForSoundToFinish

; function to remove an item (in varying quantities) from the player's bag or PC box
; INPUT:
; HL = address of inventory (either wNumBagItems or wNumBoxItems)
; [wWhichPokemon] = index (within the inventory) of the item to remove
; [wItemQuantity] = quantity to remove
RemoveItemFromInventory::
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(RemoveItemFromInventory_)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call RemoveItemFromInventory_
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; function to add an item (in varying quantities) to the player's bag or PC box
; INPUT:
; HL = address of inventory (either wNumBagItems or wNumBoxItems)
; [wcf91] = item ID
; [wItemQuantity] = item quantity
; sets carry flag if successful, unsets carry flag if unsuccessful
AddItemToInventory::
	push bc
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(AddItemToInventory_)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	call AddItemToInventory_
	pop bc
	ld a, b
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	pop bc
	ret
