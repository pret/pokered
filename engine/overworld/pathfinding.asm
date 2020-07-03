FindPathToPlayer:
	xor a
	ld hl, hFindPathNumSteps
	ld [hli], a ; hFindPathNumSteps
	ld [hli], a ; hFindPathFlags
	ld [hli], a ; hFindPathYProgress
	ld [hl], a  ; hFindPathXProgress
	ld hl, wNPCMovementDirections2
	ld de, $0
.loop
	ld a, [hFindPathYProgress]
	ld b, a
	ld a, [hNPCPlayerYDistance] ; Y distance in steps
	call CalcDifference
	ld d, a
	and a
	jr nz, .asm_f8da
	ld a, [hFindPathFlags]
	set 0, a ; current end of path matches the player's Y coordinate
	ld [hFindPathFlags], a
.asm_f8da
	ld a, [hFindPathXProgress]
	ld b, a
	ld a, [hNPCPlayerXDistance] ; X distance in steps
	call CalcDifference
	ld e, a
	and a
	jr nz, .asm_f8ec
	ld a, [hFindPathFlags]
	set 1, a ; current end of path matches the player's X coordinate
	ld [hFindPathFlags], a
.asm_f8ec
	ld a, [hFindPathFlags]
	cp $3 ; has the end of the path reached the player's position?
	jr z, .done
; Compare whether the X distance between the player and the current of the path
; is greater or if the Y distance is. Then, try to reduce whichever is greater.
	ld a, e
	cp d
	jr c, .yDistanceGreater
; x distance is greater
	ld a, [hNPCPlayerRelativePosFlags]
	bit 1, a
	jr nz, .playerIsLeftOfNPC
	ld d, NPC_MOVEMENT_RIGHT
	jr .next1
.playerIsLeftOfNPC
	ld d, NPC_MOVEMENT_LEFT
.next1
	ld a, [hFindPathXProgress]
	add 1
	ld [hFindPathXProgress], a
	jr .storeDirection
.yDistanceGreater
	ld a, [hNPCPlayerRelativePosFlags]
	bit 0, a
	jr nz, .playerIsAboveNPC
	ld d, NPC_MOVEMENT_DOWN
	jr .next2
.playerIsAboveNPC
	ld d, NPC_MOVEMENT_UP
.next2
	ld a, [hFindPathYProgress]
	add 1
	ld [hFindPathYProgress], a
.storeDirection
	ld a, d
	ld [hli], a
	ld a, [hFindPathNumSteps]
	inc a
	ld [hFindPathNumSteps], a
	jp .loop
.done
	ld [hl], $ff
	ret

CalcPositionOfPlayerRelativeToNPC:
	xor a
	ld [hNPCPlayerRelativePosFlags], a
	ld a, [wSpriteStateData1 + 4] ; player's sprite screen Y position in pixels
	ld d, a
	ld a, [wSpriteStateData1 + 6] ; player's sprite screen X position in pixels
	ld e, a
	ld hl, wSpriteStateData1
	ld a, [hNPCSpriteOffset]
	add l
	add $4
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, d
	ld b, a
	ld a, [hli] ; NPC sprite screen Y position in pixels
	call CalcDifference
	jr nc, .NPCSouthOfOrAlignedWithPlayer
.NPCNorthOfPlayer
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit 0, [hl]
	set 0, [hl]
	pop hl
	jr .divideYDistance
.NPCSouthOfOrAlignedWithPlayer
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit 0, [hl]
	res 0, [hl]
	pop hl
.divideYDistance
	push hl
	ld hl, hDividend2
	ld [hli], a
	ld a, 16
	ld [hli], a
	call DivideBytes ; divide Y absolute distance by 16
	ld a, [hl] ; quotient
	ld [hNPCPlayerYDistance], a
	pop hl
	inc hl
	ld b, e
	ld a, [hl] ; NPC sprite screen X position in pixels
	call CalcDifference
	jr nc, .NPCEastOfOrAlignedWithPlayer
.NPCWestOfPlayer
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit 1, [hl]
	set 1, [hl]
	pop hl
	jr .divideXDistance
.NPCEastOfOrAlignedWithPlayer
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit 1, [hl]
	res 1, [hl]
	pop hl
.divideXDistance
	ld [hDividend2], a
	ld a, 16
	ld [hDivisor2], a
	call DivideBytes ; divide X absolute distance by 16
	ld a, [hQuotient2]
	ld [hNPCPlayerXDistance], a
	ld a, [hNPCPlayerRelativePosPerspective]
	and a
	ret z
	ld a, [hNPCPlayerRelativePosFlags]
	cpl
	and $3
	ld [hNPCPlayerRelativePosFlags], a
	ret

ConvertNPCMovementDirectionsToJoypadMasks:
	ld a, [hNPCMovementDirections2Index]
	ld [wNPCMovementDirections2Index], a
	dec a
	ld de, wSimulatedJoypadStatesEnd
	ld hl, wNPCMovementDirections2
	add l
	ld l, a
	jr nc, .loop
	inc h
.loop
	ld a, [hld]
	call ConvertNPCMovementDirectionToJoypadMask
	ld [de], a
	inc de
	ld a, [hNPCMovementDirections2Index]
	dec a
	ld [hNPCMovementDirections2Index], a
	jr nz, .loop
	ret

ConvertNPCMovementDirectionToJoypadMask:
	push hl
	ld b, a
	ld hl, NPCMovementDirectionsToJoypadMasksTable
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	cp b
	jr z, .loadJoypadMask
	inc hl
	jr .loop
.loadJoypadMask
	ld a, [hl]
.done
	pop hl
	ret

NPCMovementDirectionsToJoypadMasksTable:
	db NPC_MOVEMENT_UP, D_UP
	db NPC_MOVEMENT_DOWN, D_DOWN
	db NPC_MOVEMENT_LEFT, D_LEFT
	db NPC_MOVEMENT_RIGHT, D_RIGHT
	db $ff

; unreferenced
	ret
