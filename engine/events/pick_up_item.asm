; PureRGBnote: ADDED: CHANGED: a bunch of this code was modified to allow for multiple items to be picked up at once from an item ball.

PickUpItemQuantity:
	call GetPredefRegisters
	jp PickUpItemCommon

PickUpItem:
	ld c, 1 ; default quantity
PickUpItemCommon:
	push bc
	call EnableAutoTextBoxDrawing

	ldh a, [hSpriteIndexOrTextID]
	ld b, a
	ld hl, wMissableObjectList
.missableObjectsListLoop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .isMissable
	inc hl
	jr .missableObjectsListLoop

.isMissable
	ld a, [hl]
	ldh [hMissableObjectIndex], a

	ld hl, wMapSpriteExtraData
	ldh a, [hSpriteIndexOrTextID]
	dec a
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop bc ; obtain c which is either set to 1 if we called PickUpItem, or an arbitrary quantity otherwise
	ld b, a ; item
	push bc
	call GiveItem
	jr nc, .BagFull

	ldh a, [hMissableObjectIndex]
	ld [wMissableObjectIndex], a
;;;;;;;;;; PureRGBnote: CHANGED: safari zone hidable items use a different set of flags than everywhere else, needed more space for flags.
	CheckEvent EVENT_IN_SAFARI_ZONE
	jr nz, .hideExtra
	predef HideObject
	jr .continue
.hideExtra
	predef HideExtraObject
.continue
;;;;;;;;;;
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	and a
	pop bc
	ld a, c
	cp 1
	jr z, .singleItemPickup
.multiItemPickup
	add $f6 ; index of first number character in charmap (assumes c must be 0-9)
	ld [wTempStore1], a
	ld hl, FoundMultipleItemText
	jr .print
.singleItemPickup
	ld hl, FoundItemText
	jr .print
.BagFull
	pop bc
	ld hl, NoMoreRoomForItemText
.print
	call PrintText
	ret

FoundMultipleItemText:
	text_far _FoundMultipleItemText
	sound_get_item_1
	text_end

FoundItemText:
	text_far _FoundItemText
	sound_get_item_1
	text_end

NoMoreRoomForItemText:
	text_far _NoMoreRoomForItemText
	text_end
