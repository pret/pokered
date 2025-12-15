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
	ldh a, [hFindPathYProgress]
	ld b, a
	ldh a, [hNPCPlayerYDistance] ; Y distance in steps
	call CalcDifference
	ld d, a
	and a
	jr nz, .stillHasYProgress
	ldh a, [hFindPathFlags]
	set BIT_PATH_FOUND_Y, a
	ldh [hFindPathFlags], a
.stillHasYProgress
	ldh a, [hFindPathXProgress]
	ld b, a
	ldh a, [hNPCPlayerXDistance] ; X distance in steps
	call CalcDifference
	ld e, a
	and a
	jr nz, .stillHasXProgress
	ldh a, [hFindPathFlags]
	set BIT_PATH_FOUND_X, a
	ldh [hFindPathFlags], a
.stillHasXProgress
	ldh a, [hFindPathFlags]
	cp (1 << BIT_PATH_FOUND_X) | (1 << BIT_PATH_FOUND_Y)
	jr z, .done
; Compare whether the X distance between the player and the current of the path
; is greater or if the Y distance is. Then, try to reduce whichever is greater.
	ld a, e
	cp d
	jr c, .yDistanceGreater
; x distance is greater
	ldh a, [hNPCPlayerRelativePosFlags]
	bit BIT_PLAYER_LOWER_X, a
	jr nz, .playerIsLeftOfNPC
	ld d, NPC_MOVEMENT_RIGHT
	jr .next1
.playerIsLeftOfNPC
	ld d, NPC_MOVEMENT_LEFT
.next1
	ldh a, [hFindPathXProgress]
	add 1
	ldh [hFindPathXProgress], a
	jr .storeDirection
.yDistanceGreater
	ldh a, [hNPCPlayerRelativePosFlags]
	bit BIT_PLAYER_LOWER_Y, a
	jr nz, .playerIsAboveNPC
	ld d, NPC_MOVEMENT_DOWN
	jr .next2
.playerIsAboveNPC
	ld d, NPC_MOVEMENT_UP
.next2
	ldh a, [hFindPathYProgress]
	add 1
	ldh [hFindPathYProgress], a
.storeDirection
	ld a, d
	ld [hli], a
	ldh a, [hFindPathNumSteps]
	inc a
	ldh [hFindPathNumSteps], a
	jp .loop
.done
	ld [hl], $ff
	ret

CalcPositionOfPlayerRelativeToNPC:
	xor a
	ldh [hNPCPlayerRelativePosFlags], a
	ld a, [wSpritePlayerStateData1YPixels]
	ld d, a
	ld a, [wSpritePlayerStateData1XPixels]
	ld e, a
	ld hl, wSpriteStateData1
	ldh a, [hNPCSpriteOffset]
	add l
	add SPRITESTATEDATA1_YPIXELS
	ld l, a
	jr nc, .noCarry
	inc h
.noCarry
	ld a, d
	ld b, a
	ld a, [hli] ; NPC sprite screen Y position in pixels
	call CalcDifference
	jr nc, .NPCSouthOfOrAlignedWithPlayer
; NPC north of player
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit BIT_PLAYER_LOWER_Y, [hl]
	set BIT_PLAYER_LOWER_Y, [hl]
	pop hl
	jr .divideYDistance
.NPCSouthOfOrAlignedWithPlayer
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit BIT_PLAYER_LOWER_Y, [hl]
	res BIT_PLAYER_LOWER_Y, [hl]
	pop hl
.divideYDistance
	push hl
	ld hl, hDividend2
	ld [hli], a
	ld a, 16
	ld [hli], a
	call DivideBytes ; divide Y absolute distance by 16
	ld a, [hl] ; quotient
	ldh [hNPCPlayerYDistance], a
	pop hl
	inc hl
	ld b, e
	ld a, [hl] ; NPC sprite screen X position in pixels
	call CalcDifference
	jr nc, .NPCEastOfOrAlignedWithPlayer
; NPC west of player
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit BIT_PLAYER_LOWER_X, [hl]
	set BIT_PLAYER_LOWER_X, [hl]
	pop hl
	jr .divideXDistance
.NPCEastOfOrAlignedWithPlayer
	push hl
	ld hl, hNPCPlayerRelativePosFlags
	bit BIT_PLAYER_LOWER_X, [hl]
	res BIT_PLAYER_LOWER_X, [hl]
	pop hl
.divideXDistance
	ldh [hDividend2], a
	ld a, 16
	ldh [hDivisor2], a
	call DivideBytes ; divide X absolute distance by 16
	ldh a, [hQuotient2]
	ldh [hNPCPlayerXDistance], a
	ldh a, [hNPCPlayerRelativePosPerspective]
	and a
	ret z
	ldh a, [hNPCPlayerRelativePosFlags]
	cpl
	and $3
	ldh [hNPCPlayerRelativePosFlags], a
	ret

ConvertNPCMovementDirectionsToJoypadMasks:
	ldh a, [hNPCMovementDirections2Index]
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
	ldh a, [hNPCMovementDirections2Index]
	dec a
	ldh [hNPCMovementDirections2Index], a
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
	db NPC_MOVEMENT_UP, PAD_UP
	db NPC_MOVEMENT_DOWN, PAD_DOWN
	db NPC_MOVEMENT_LEFT, PAD_LEFT
	db NPC_MOVEMENT_RIGHT, PAD_RIGHT
	db $ff

; unreferenced
	ret
