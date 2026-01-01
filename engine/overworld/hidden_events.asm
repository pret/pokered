IsPlayerOnDungeonWarp::
	xor a
	ld [wWhichDungeonWarp], a
	ld a, [wStatusFlags3]
	bit BIT_ON_DUNGEON_WARP, a
	ret nz
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wCoordIndex]
	ld [wWhichDungeonWarp], a
	ld hl, wStatusFlags3
	set BIT_ON_DUNGEON_WARP, [hl]
	ld hl, wStatusFlags6
	set BIT_DUNGEON_WARP, [hl]
	ret

; if a hidden event was found, stores $00 in [hDidntFindAnyHiddenEvent], else stores $ff
CheckForHiddenEvent::
	ld hl, hItemAlreadyFound
	xor a
	ld [hli], a ; [hItemAlreadyFound]
	ld [hli], a ; [hSavedMapTextPtr]
	ld [hli], a ; [hSavedMapTextPtr + 1]
	ld [hl], a  ; [hDidntFindAnyHiddenEvent]
	ld de, $0
	ld hl, HiddenEventMaps
.hiddenMapLoop
	ld a, [hli]
	ld b, a
	cp $ff
	jr z, .noMatch
	ld a, [wCurMap]
	cp b
	jr z, .foundMatchingMap
	inc de
	inc de
	jr .hiddenMapLoop
.foundMatchingMap
	ld hl, HiddenEventPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, wHiddenEventFunctionArgument
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop hl
.hiddenEventLoop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	ld [wHiddenEventY], a
	ld b, a
	ld a, [hli]
	ld [wHiddenEventX], a
	ld c, a
	call CheckIfCoordsInFrontOfPlayerMatch
	ldh a, [hCoordsInFrontOfPlayerMatch]
	and a
	jr z, .foundMatchingEvent
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, wHiddenEventIndex
	inc [hl]
	pop hl
	jr .hiddenEventLoop
.foundMatchingEvent
	ld a, [hli]
	ld [wHiddenEventFunctionArgument], a
	ld a, [hli]
	ld [wHiddenEventFunctionRomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
.noMatch
	ld a, $ff
	ldh [hDidntFindAnyHiddenEvent], a
	ret

; checks if the coordinates in front of the player's sprite match Y in b and X in c
; [hCoordsInFrontOfPlayerMatch] = $00 if they match, $ff if they don't match
CheckIfCoordsInFrontOfPlayerMatch:
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jr z, .facingUp
	cp SPRITE_FACING_LEFT
	jr z, .facingLeft
	cp SPRITE_FACING_RIGHT
	jr z, .facingRight
; facing down
	ld a, [wYCoord]
	inc a
	jr .upDownCommon
.facingUp
	ld a, [wYCoord]
	dec a
.upDownCommon
	cp b
	jr nz, .didNotMatch
	ld a, [wXCoord]
	cp c
	jr nz, .didNotMatch
	jr .matched
.facingLeft
	ld a, [wXCoord]
	dec a
	jr .leftRightCommon
.facingRight
	ld a, [wXCoord]
	inc a
.leftRightCommon
	cp c
	jr nz, .didNotMatch
	ld a, [wYCoord]
	cp b
	jr nz, .didNotMatch
.matched
	xor a
	jr .done
.didNotMatch
	ld a, $ff
.done
	ldh [hCoordsInFrontOfPlayerMatch], a
	ret

INCLUDE "data/events/hidden_events.asm"
