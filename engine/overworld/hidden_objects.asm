Func_46981: ; 46981 (11:6981)
	xor a
	ld [wWhichDungeonWarp], a
	ld a, [wd72d]
	bit 4, a
	ret nz
	call ArePlayerCoordsInArray
	ret nc
	ld a, [wWhichTrade]
	ld [wWhichDungeonWarp], a
	ld hl, wd72d
	set 4, [hl]
	ld hl, wd732
	set 4, [hl]
	ret

; if a hidden object was found, stores $00 in [$ffee], else stores $ff
CheckForHiddenObject: ; 469a0 (11:69a0)
	ld hl, $ffeb
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld de, $0
	ld hl, HiddenObjectMaps
.hiddenMapLoop
	ld a, [hli]
	ld b, a
	cp $ff
	jr z, .noMatch
	ld a, [W_CURMAP]
	cp b
	jr z, .foundMatchingMap
	inc de
	inc de
	jr .hiddenMapLoop
.foundMatchingMap
	ld hl, HiddenObjectPointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, wHiddenObjectFunctionArgument
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop hl
.hiddenObjectLoop
	ld a, [hli]
	cp $ff
	jr z, .noMatch
	ld [wHiddenObjectY], a
	ld b, a
	ld a, [hli]
	ld [wHiddenObjectX], a
	ld c, a
	call CheckIfCoordsInFrontOfPlayerMatch
	ld a, [$ffea]
	and a
	jr z, .foundMatchingObject
	inc hl
	inc hl
	inc hl
	inc hl
	push hl
	ld hl, wHiddenObjectIndex
	inc [hl]
	pop hl
	jr .hiddenObjectLoop
.foundMatchingObject
	ld a, [hli]
	ld [wHiddenObjectFunctionArgument], a
	ld a, [hli]
	ld [wHiddenObjectFunctionRomBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
.noMatch
	ld a, $ff
	ld [$ffee], a
	ret

; checks if the coordinates in front of the player's sprite match Y in b and X in c
; [$ffea] = $00 if they match, $ff if they don't match
CheckIfCoordsInFrontOfPlayerMatch: ; 46a01 (11:6a01)
	ld a, [wSpriteStateData1 + 9] ; player's sprite facing direction
	cp SPRITE_FACING_UP
	jr z, .facingUp
	cp SPRITE_FACING_LEFT
	jr z, .facingLeft
	cp SPRITE_FACING_RIGHT
	jr z, .facingRight
; facing down
	ld a, [W_YCOORD]
	inc a
	jr .upDownCommon
.facingUp
	ld a, [W_YCOORD]
	dec a
.upDownCommon
	cp b
	jr nz, .didNotMatch
	ld a, [W_XCOORD]
	cp c
	jr nz, .didNotMatch
	jr .matched
.facingLeft
	ld a, [W_XCOORD]
	dec a
	jr .leftRightCommon
.facingRight
	ld a, [W_XCOORD]
	inc a
.leftRightCommon
	cp c
	jr nz, .didNotMatch
	ld a, [W_YCOORD]
	cp b
	jr nz, .didNotMatch
.matched
	xor a
	jr .done
.didNotMatch
	ld a, $ff
.done
	ld [$ffea], a
	ret

INCLUDE "data/hidden_objects.asm"
