HandleItemListSwapping::
	ld a, [wListMenuID]
	cp ITEMLISTMENU
	jp nz, DisplayListMenuIDLoop ; only rearrange item list menus
	push hl
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; hl = beginning of list entries
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	add a
	ld c, a
	ld b, 0
	add hl, bc ; hl = address of currently selected item entry
	ld a, [hl]
	pop hl
	inc a
	jp z, DisplayListMenuIDLoop ; ignore attempts to swap the Cancel menu item
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	and a ; has the first item to swap already been chosen?
	jr nz, .swapItems
; if not, set the currently selected item as the first item
	ld a, [wCurrentMenuItem]
	inc a
	ld b, a
	ld a, [wListScrollOffset] ; index of top (visible) menu item within the list
	add b
	ld [wMenuItemToSwap], a ; ID of item chosen for swapping (counts from 1)
	ld c, 20
	call DelayFrames
	jp DisplayListMenuIDLoop
.swapItems
	ld a, [wCurrentMenuItem]
	inc a
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld b, a
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	cp b ; is the currently selected item the same as the first item to swap?
	jp z, DisplayListMenuIDLoop ; ignore attempts to swap an item with itself
	dec a
	ld [wMenuItemToSwap], a ; ID of item chosen for swapping (counts from 1)
	ld c, 20
	call DelayFrames
	push hl
	push de
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; hl = beginning of list entries
	ld d, h
	ld e, l ; de = beginning of list entries
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	add a
	ld c, a
	ld b, 0
	add hl, bc ; hl = address of currently selected item entry
	ld a, [wMenuItemToSwap] ; ID of item chosen for swapping (counts from 1)
	add a
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry ; de = address of first item to swap
	ld a, [de]
	ld b, a
	ld a, [hli]
	cp b
	jr z, .swapSameItemType
.swapDifferentItems
	ldh [hSwapItemID], a ; save second item ID
	ld a, [hld]
	ldh [hSwapItemQuantity], a ; save second item quantity
	ld a, [de]
	ld [hli], a ; put first item ID in second item slot
	inc de
	ld a, [de]
	ld [hl], a ; put first item quantity in second item slot
	ldh a, [hSwapItemQuantity]
	ld [de], a ; put second item quantity in first item slot
	dec de
	ldh a, [hSwapItemID]
	ld [de], a ; put second item ID in first item slot
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop
.swapSameItemType
	inc de
	ld a, [hl]
	ld b, a
	ld a, [de]
	add b ; a = sum of both item quantities
	cp 100 ; is the sum too big for one item slot?
	jr c, .combineItemSlots
; swap enough items from the first slot to max out the second slot if they can't be combined
	sub 99
	ld [de], a
	ld a, 99
	ld [hl], a
	jr .done
.combineItemSlots
	ld [hl], a ; put the sum in the second item slot
	ld hl, wListPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	dec [hl] ; decrease the number of items
	ld a, [hl]
	ld [wListCount], a ; update number of items variable
	cp 1
	jr nz, .skipSettingMaxMenuItemID
	ld [wMaxMenuItem], a ; if the number of items is only one now, update the max menu item ID
.skipSettingMaxMenuItemID
	dec de
	ld h, d
	ld l, e
	inc hl
	inc hl ; hl = address of item after first item to swap
.moveItemsUpLoop ; erase the first item slot and move up all the following item slots to fill the gap
	ld a, [hli]
	ld [de], a
	inc de
	inc a ; reached the $ff terminator?
	jr z, .afterMovingItemsUp
	ld a, [hli]
	ld [de], a
	inc de
	jr .moveItemsUpLoop
.afterMovingItemsUp
	xor a
	ld [wListScrollOffset], a
	ld [wCurrentMenuItem], a
.done
	xor a
	ld [wMenuItemToSwap], a ; 0 means no item is currently being swapped
	pop de
	pop hl
	jp DisplayListMenuIDLoop
