; function to add an item (in varying quantities) to the player's bag or PC box
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wcf91] = item ID
; [wItemQuantity] = item quantity
; sets carry flag if successful, unsets carry flag if unsuccessful
AddItemToInventory_:
	ld a, [wItemQuantity] ; a = item quantity
	push af
	push bc
	push de
	push hl
	push hl
	ld d, PC_ITEM_CAPACITY ; how many items the PC can hold
	ld a, wNumBagItems & $FF
	cp l
	jr nz, .checkIfInventoryFull
	ld a, wNumBagItems >> 8
	cp h
	jr nz, .checkIfInventoryFull
; if the destination is the bag
	ld d, BAG_ITEM_CAPACITY ; how many items the bag can hold
.checkIfInventoryFull
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hli]
	and a
	jr z, .addNewItem
.loop
	ld a, [hli]
	ld b, a ; b = ID of current item in table
	ld a, [wcf91] ; a = ID of item being added
	cp b ; does the current item in the table match the item being added?
	jp z, .increaseItemQuantity ; if so, increase the item's quantity
	inc hl
	ld a, [hl]
	cp $ff ; is it the end of the table?
	jr nz, .loop
.addNewItem ; add an item not yet in the inventory
	pop hl
	ld a, d
	and a ; is there room for a new item slot?
	jr z, .done
; if there is room
	inc [hl] ; increment the number of items in the inventory
	ld a, [hl] ; the number of items will be the index of the new item
	add a
	dec a
	ld c, a
	ld b, 0
	add hl, bc ; hl = address to store the item
	ld a, [wcf91]
	ld [hli], a ; store item ID
	ld a, [wItemQuantity]
	ld [hli], a ; store item quantity
	ld [hl], $ff ; store terminator
	jp .success
.increaseItemQuantity ; increase the quantity of an item already in the inventory
	ld a, [wItemQuantity]
	ld b, a ; b = quantity to add
	ld a, [hl] ; a = existing item quantity
	add b ; a = new item quantity
	cp 100
	jp c, .storeNewQuantity ; if the new quantity is less than 100, store it
; if the new quantity is greater than or equal to 100,
; try to max out the current slot and add the rest in a new slot
	sub 99
	ld [wItemQuantity], a ; a = amount left over (to put in the new slot)
	ld a, d
	and a ; is there room for a new item slot?
	jr z, .increaseItemQuantityFailed
; if so, store 99 in the current slot and store the rest in a new slot
	ld a, 99
	ld [hli], a
	jp .loop
.increaseItemQuantityFailed
	pop hl
	and a
	jr .done
.storeNewQuantity
	ld [hl], a
	pop hl
.success
	scf
.done
	pop hl
	pop de
	pop bc
	pop bc
	ld a, b
	ld [wItemQuantity], a ; restore the initial value from when the function was called
	ret

; function to remove an item (in varying quantities) from the player's bag or PC box
; INPUT:
; hl = address of inventory (either wNumBagItems or wNumBoxItems)
; [wWhichPokemon] = index (within the inventory) of the item to remove
; [wItemQuantity] = quantity to remove
RemoveItemFromInventory_:
	push hl
	inc hl
	ld a, [wWhichPokemon] ; index (within the inventory) of the item being removed
	sla a
	add l
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	inc hl
	ld a, [wItemQuantity] ; quantity being removed
	ld e, a
	ld a, [hl] ; a = current quantity
	sub e
	ld [hld], a ; store new quantity
	ld [wMaxItemQuantity], a
	and a
	jr nz, .skipMovingUpSlots
; if the remaining quantity is 0,
; remove the emptied item slot and move up all the following item slots
.moveSlotsUp
	ld e, l
	ld d, h
	inc de
	inc de ; de = address of the slot following the emptied one
.loop ; loop to move up the following slots
	ld a, [de]
	inc de
	ld [hli], a
	cp $ff
	jr nz, .loop
; update menu info
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
	ld [wBagSavedMenuItem], a
	ld [wSavedListScrollOffset], a
	pop hl
	ld a, [hl] ; a = number of items in inventory
	dec a ; decrement the number of items
	ld [hl], a ; store new number of items
	ld [wListCount], a
	cp 2
	jr c, .done
	ld [wMaxMenuItem], a
	jr .done
.skipMovingUpSlots
	pop hl
.done
	ret
