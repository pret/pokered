PickUpItem:
	call EnableAutoTextBoxDrawing

	ld a, [hSpriteIndexOrTextID]
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
	ld [$ffdb], a

	ld hl, wMapSpriteExtraData
	ld a, [hSpriteIndexOrTextID]
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

	ld a, [$ffdb]
	ld [wMissableObjectIndex], a
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
	TX_FAR _FoundItemText
	TX_SFX_ITEM_1
	db "@"

NoMoreRoomForItemText:
	TX_FAR _NoMoreRoomForItemText
	db "@"
