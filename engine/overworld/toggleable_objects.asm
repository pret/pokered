MarkTownVisitedAndLoadToggleableObjects::
	ld a, [wCurMap]
	cp FIRST_ROUTE_MAP
	jr nc, .notInTown
	ld c, a
	ld b, FLAG_SET
	ld hl, wTownVisitedFlag   ; mark town as visited (for flying)
	predef FlagActionPredef
.notInTown
	ld hl, ToggleableObjectMapPointers
	ld a, [wCurMap]
	ld b, $0
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli] ; load toggleable objects pointer in hl
	ld h, [hl]
	ld l, a
	push hl
	ld de, ToggleableObjectStates ; calculate difference between out pointer and the base pointer
	ld a, l
	sub e
	jr nc, .noCarry
	dec h
.noCarry
	ld l, a
	ld a, h
	sub d
	ld h, a
	; divide difference by 3, resulting in the global offset (number of toggleable items before ours)
	ld a, h
	ldh [hDividend], a
	ld a, l
	ldh [hDividend+1], a
	xor a
	ldh [hDividend+2], a
	ldh [hDividend+3], a
	ld a, $3
	ldh [hDivisor], a
	ld b, $2
	call Divide
	ld a, [wCurMap]
	ld b, a
	ldh a, [hDividend+3]
	ld c, a                    ; store global offset in c
	ld de, wToggleableObjectList
	pop hl
.writeToggleableObjectsListLoop
	ld a, [hli]
	cp -1
	jr z, .done     ; end of list
	cp b
	jr nz, .done    ; not for current map anymore
	ld a, [hli]
	inc hl
	ld [de], a                 ; write (map-local) sprite ID
	inc de
	ld a, c
	inc c
	ld [de], a                 ; write (global) toggleable object index
	inc de
	jr .writeToggleableObjectsListLoop
.done
	ld a, -1
	ld [de], a                 ; write sentinel
	ret

InitializeToggleableObjectsFlags:
	ld hl, wToggleableObjectFlags
	ld bc, wToggleableObjectFlagsEnd - wToggleableObjectFlags
	xor a
	call FillMemory ; clear toggleable objects flags
	ld hl, ToggleableObjectStates
	xor a
	ld [wToggleableObjectCounter], a
.toggleableObjectsLoop
	ld a, [hli]
	cp -1 ; end of list
	ret z
	push hl
	inc hl
	ld a, [hl]
	cp OFF
	jr nz, .skip
	ld hl, wToggleableObjectFlags
	ld a, [wToggleableObjectCounter]
	ld c, a
	ld b, FLAG_SET
	call ToggleableObjectFlagAction ; set flag if object is toggled off
.skip
	ld hl, wToggleableObjectCounter
	inc [hl]
	pop hl
	inc hl
	inc hl
	jr .toggleableObjectsLoop

; tests if current object is toggled off/has been hidden
IsObjectHidden:
	ldh a, [hCurrentSpriteOffset]
	swap a
	ld b, a
	ld hl, wToggleableObjectList
.loop
	ld a, [hli]
	cp -1
	jr z, .notHidden ; not toggleable -> not hidden
	cp b
	ld a, [hli]
	jr nz, .loop
	ld c, a
	ld b, FLAG_TEST
	ld hl, wToggleableObjectFlags
	call ToggleableObjectFlagAction
	ld a, c
	and a
	jr nz, .hidden
.notHidden
	xor a
.hidden
	ldh [hIsToggleableObjectOff], a
	ret

; adds toggleable object (items, leg. pokemon, etc.) to the map
; [wToggleableObjectIndex]: index of the toggleable object to be added (global index)
ShowObject:
ShowObject2:
	ld hl, wToggleableObjectFlags
	ld a, [wToggleableObjectIndex]
	ld c, a
	ld b, FLAG_RESET
	call ToggleableObjectFlagAction   ; reset "removed" flag
	jp UpdateSprites

; removes toggleable object (items, leg. pokemon, etc.) from the map
; [wToggleableObjectIndex]: index of the toggleable object to be removed (global index)
HideObject:
	ld hl, wToggleableObjectFlags
	ld a, [wToggleableObjectIndex]
	ld c, a
	ld b, FLAG_SET
	call ToggleableObjectFlagAction   ; set "removed" flag
	jp UpdateSprites

ToggleableObjectFlagAction:
; identical to FlagAction

	push hl
	push de
	push bc

	; bit
	ld a, c
	ld d, a
	and 7
	ld e, a

	; byte
	ld a, d
	srl a
	srl a
	srl a
	add l
	ld l, a
	jr nc, .ok
	inc h
.ok

	; d = 1 << e (bitmask)
	inc e
	ld d, 1
.shift
	dec e
	jr z, .shifted
	sla d
	jr .shift
.shifted

	ld a, b
	and a
	jr z, .reset
	cp FLAG_TEST
	jr z, .read

; set
	ld a, [hl]
	ld b, a
	ld a, d
	or b
	ld [hl], a
	jr .done

.reset
	ld a, [hl]
	ld b, a
	ld a, d
	xor $ff
	and b
	ld [hl], a
	jr .done

.read
	ld a, [hl]
	ld b, a
	ld a, d
	and b

.done
	pop bc
	pop de
	pop hl
	ld c, a
	ret
