PickUpItem:
	call EnableAutoTextBoxDrawing

	ldh a, [hSpriteIndex]
	ld b, a
	ld hl, wToggleableObjectList
.toggleableObjectsListLoop
	ld a, [hli]
	cp $ff
	ret z
	cp b
	jr z, .isToggleable
	inc hl
	jr .toggleableObjectsListLoop

.isToggleable
	ld a, [hl]
	ldh [hToggleableObjectIndex], a

	ld hl, wMapSpriteExtraData
	ldh a, [hSpriteIndex]
	dec a
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld b, a ; item
	ld c, 1 ; quantity
	call GiveItem
	jr nc, .BagFull

	ldh a, [hToggleableObjectIndex]
	ld [wToggleableObjectIndex], a
	predef HideObject
	ld a, 1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, FoundItemText
	jr .print

.BagFull
	ld hl, NoMoreRoomForItemText
.print
	call PrintText
	ret

FoundItemText:
	text_far _FoundItemText
	sound_get_item_1
	text_end

NoMoreRoomForItemText:
	text_far _NoMoreRoomForItemText
	text_end
