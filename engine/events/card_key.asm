PrintCardKeyText:
	ld hl, SilphCoMapList
	ld a, [wCurMap]
	ld b, a
.silphCoMapListLoop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr nz, .silphCoMapListLoop
	predef GetTileAndCoordsInFrontOfPlayer
	ld a, [wTileInFrontOfPlayer]
	cp $18
	jr z, .cardKeyDoorInFrontOfPlayer
	cp $24
	jr z, .cardKeyDoorInFrontOfPlayer
	ld b, a
	ld a, [wCurMap]
	cp SILPH_CO_11F
	ret nz
	ld a, b
	cp $5e
	ret nz
.cardKeyDoorInFrontOfPlayer
	ld b, CARD_KEY
	call IsItemInBag
	jr z, .noCardKey
	call GetCoordsInFrontOfPlayer
	push de
	tx_pre_id CardKeySuccessText
	ldh [hSpriteIndexOrTextID], a
	call PrintPredefTextID
	pop de
	srl d
	ld a, d
	ld b, a
	ld [wCardKeyDoorY], a
	srl e
	ld a, e
	ld c, a
	ld [wCardKeyDoorX], a
	ld a, [wCurMap]
	cp SILPH_CO_11F
	jr nz, .notSilphCo11F
	ld a, $3
	jr .replaceCardKeyDoorTileBlock
.notSilphCo11F
	ld a, $e
.replaceCardKeyDoorTileBlock
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld a, SFX_GO_INSIDE
	jp PlaySound
.noCardKey
	tx_pre_id CardKeyFailText
	ldh [hSpriteIndexOrTextID], a
	jp PrintPredefTextID

CheckAllCardKeyEvents::
	; FIXED: when every card key door has been opened, the CARD KEY is removed from inventory.
	CheckBothEventsSet EVENT_SILPH_CO_2_UNLOCKED_DOOR1, EVENT_SILPH_CO_2_UNLOCKED_DOOR2
	ret nz
	CheckBothEventsSet EVENT_SILPH_CO_3_UNLOCKED_DOOR1, EVENT_SILPH_CO_3_UNLOCKED_DOOR2
	ret nz
	CheckBothEventsSet EVENT_SILPH_CO_4_UNLOCKED_DOOR1, EVENT_SILPH_CO_4_UNLOCKED_DOOR2
	ret nz
	CheckBothEventsSet EVENT_SILPH_CO_5_UNLOCKED_DOOR1, EVENT_SILPH_CO_5_UNLOCKED_DOOR2
	ret nz
	CheckEvent EVENT_SILPH_CO_5_UNLOCKED_DOOR3
	ret z
	CheckEvent EVENT_SILPH_CO_6_UNLOCKED_DOOR
	ret z
	CheckBothEventsSet EVENT_SILPH_CO_7_UNLOCKED_DOOR1, EVENT_SILPH_CO_7_UNLOCKED_DOOR2
	ret nz
	CheckEvent EVENT_SILPH_CO_7_UNLOCKED_DOOR3
	ret z
	CheckEvent EVENT_SILPH_CO_8_UNLOCKED_DOOR
	ret z
	CheckBothEventsSet EVENT_SILPH_CO_9_UNLOCKED_DOOR1, EVENT_SILPH_CO_9_UNLOCKED_DOOR2
	ret nz
	CheckBothEventsSet EVENT_SILPH_CO_9_UNLOCKED_DOOR3, EVENT_SILPH_CO_9_UNLOCKED_DOOR4
	ret nz
	CheckEvent EVENT_SILPH_CO_10_UNLOCKED_DOOR
	ret z
	CheckEvent EVENT_SILPH_CO_11_UNLOCKED_DOOR
	ret z
	; if we reached here, every card key door has been opened.
	SetEvent EVENT_ALL_CARD_KEY_DOORS_OPENED
	ret

PrintCardKeyDoneText::
	ld b, CARD_KEY
	predef GetIndexOfItemInBag
	ld a, b
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	ld hl, CardKeyDoneText
	call PrintText
	jp TextScriptEnd

INCLUDE "data/events/card_key_maps.asm"

CardKeyDoneText::
	text_far _CardKeyDoneText
	text_end

CardKeySuccessText::
	text_far _CardKeySuccessText1
	sound_get_item_1
	text_far _CardKeySuccessText2
	text_end

CardKeyFailText::
	text_far _CardKeyFailText
	text_end

; d = Y
; e = X
GetCoordsInFrontOfPlayer:
	ld a, [wYCoord]
	ld d, a
	ld a, [wXCoord]
	ld e, a
	ld a, [wSpritePlayerStateData1FacingDirection]
	and a
	jr nz, .notFacingDown
; facing down
	inc d
	ret
.notFacingDown
	cp SPRITE_FACING_UP
	jr nz, .notFacingUp
; facing up
	dec d
	ret
.notFacingUp
	cp SPRITE_FACING_LEFT
	jr nz, .notFacingLeft
; facing left
	dec e
	ret
.notFacingLeft
; facing right
	inc e
	ret
