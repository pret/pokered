; checks if the player's coordinates match an arrow movement tile's coordinates
; and if so, decodes the RLE movement data
; b = player Y
; c = player X
DecodeArrowMovementRLE::
	ld a, [hli]
	cp $ff
	ret z ; no match in the list
	cp b
	jr nz, .nextArrowMovementTileEntry1
	ld a, [hli]
	cp c
	jr nz, .nextArrowMovementTileEntry2
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ret
.nextArrowMovementTileEntry1
	inc hl
.nextArrowMovementTileEntry2
	inc hl
	inc hl
	jr DecodeArrowMovementRLE

TextScript_ItemStoragePC::
	call SaveScreenTilesToBuffer2
	ld b, BANK(PlayerPC)
	ld hl, PlayerPC
	jr bankswitchAndContinue

TextScript_BillsPC::
	call SaveScreenTilesToBuffer2
	ld b, BANK(BillsPC_)
	ld hl, BillsPC_
	jr bankswitchAndContinue

TextScript_GameCornerPrizeMenu::
; XXX find a better name for this function
; special_F7
	ld b, BANK(CeladonPrizeMenu)
	ld hl, CeladonPrizeMenu
bankswitchAndContinue::
	call Bankswitch
	jp HoldTextDisplayOpen        ; continue to main text-engine function

TextScript_PokemonCenterPC::
	ld b, BANK(ActivatePC)
	ld hl, ActivatePC
	jr bankswitchAndContinue

StartSimulatingJoypadStates::
	xor a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ret

IsItemInBag::
; given an item_id in b
; set zero flag if item isn't in player's bag
; else reset zero flag
; related to Pokémon Tower and ghosts
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	ret

DisplayPokedex::
	ld [wPokedexNum], a
	farjp _DisplayPokedex

SetSpriteFacingDirectionAndDelay::
	call SetSpriteFacingDirection
	ld c, 6
	jp DelayFrames

SetSpriteFacingDirection::
	ld a, SPRITESTATEDATA1_FACINGDIRECTION
	ldh [hSpriteDataOffset], a
	call GetPointerWithinSpriteStateData1
	ldh a, [hSpriteFacingDirection]
	ld [hl], a
	ret

SetSpriteImageIndexAfterSettingFacingDirection::
	ld de, SPRITESTATEDATA1_IMAGEINDEX - SPRITESTATEDATA1_FACINGDIRECTION
	add hl, de
	ld [hl], a
	ret

; tests if the player's coordinates are in a specified array
; INPUT:
; hl = address of array
; OUTPUT:
; [wCoordIndex] = if there is match, the matching array index
; sets carry if the coordinates are in the array, clears carry if not
ArePlayerCoordsInArray::
	ld a, [wYCoord]
	ld b, a
	ld a, [wXCoord]
	ld c, a
	; fallthrough

CheckCoords::
	xor a
	ld [wCoordIndex], a
.loop
	ld a, [hli]
	cp $ff ; reached terminator?
	jr z, .notInArray
	push hl
	ld hl, wCoordIndex
	inc [hl]
	pop hl
.compareYCoord
	cp b
	jr z, .compareXCoord
	inc hl
	jr .loop
.compareXCoord
	ld a, [hli]
	cp c
	jr nz, .loop
.inArray
	scf
	ret
.notInArray
	and a
	ret

; tests if a boulder's coordinates are in a specified array
; INPUT:
; hl = address of array
; [hSpriteIndex] = index of boulder sprite
; OUTPUT:
; [wCoordIndex] = if there is match, the matching array index
; sets carry if the coordinates are in the array, clears carry if not
CheckBoulderCoords::
	push hl
	ld hl, wSpritePlayerStateData2MapY
	ldh a, [hSpriteIndex]
	swap a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	sub $4 ; because sprite coordinates are offset by 4
	ld b, a
	ld a, [hl]
	sub $4 ; because sprite coordinates are offset by 4
	ld c, a
	pop hl
	jp CheckCoords

GetPointerWithinSpriteStateData1::
	ld h, HIGH(wSpriteStateData1)
	jr _GetPointerWithinSpriteStateData

GetPointerWithinSpriteStateData2::
	ld h, HIGH(wSpriteStateData2)

_GetPointerWithinSpriteStateData:
	ldh a, [hSpriteDataOffset]
	ld b, a
	ldh a, [hSpriteIndex]
	swap a
	add b
	ld l, a
	ret

; decodes a $ff-terminated RLEncoded list
; each entry is a pair of bytes <byte value> <repetitions>
; the final $ff will be replicated in the output list and a contains the number of bytes written
; de: input list
; hl: output list
DecodeRLEList::
	xor a
	ld [wRLEByteCount], a     ; count written bytes here
.listLoop
	ld a, [de]
	cp $ff
	jr z, .endOfList
	ldh [hRLEByteValue], a ; store byte value to be written
	inc de
	ld a, [de]
	ld b, $0
	ld c, a                      ; number of bytes to be written
	ld a, [wRLEByteCount]
	add c
	ld [wRLEByteCount], a     ; update total number of written bytes
	ldh a, [hRLEByteValue]
	call FillMemory              ; write a c-times to output
	inc de
	jr .listLoop
.endOfList
	ld a, $ff
	ld [hl], a                   ; write final $ff
	ld a, [wRLEByteCount]
	inc a                        ; include sentinel in counting
	ret

; sets movement byte 1 for sprite [hSpriteIndex] to $FE and byte 2 to [hSpriteMovementByte2]
SetSpriteMovementBytesToFE::
	push hl
	call GetSpriteMovementByte1Pointer
	ld [hl], $fe
	call GetSpriteMovementByte2Pointer
	ldh a, [hSpriteMovementByte2]
	ld [hl], a
	pop hl
	ret

; sets both movement bytes for sprite [hSpriteIndex] to $FF
SetSpriteMovementBytesToFF::
	push hl
	call GetSpriteMovementByte1Pointer
	ld [hl], STAY
	call GetSpriteMovementByte2Pointer
	ld [hl], NONE
	pop hl
	ret

; returns the sprite movement byte 1 pointer for sprite [hSpriteIndex] in hl
GetSpriteMovementByte1Pointer::
	ld h, HIGH(wSpriteStateData2)
	ldh a, [hSpriteIndex]
	swap a
	add 6
	ld l, a
	ret

; returns the sprite movement byte 2 pointer for sprite [hSpriteIndex] in hl
GetSpriteMovementByte2Pointer::
	push de
	ld hl, wMapSpriteData
	ldh a, [hSpriteIndex]
	dec a
	add a
	ld d, 0
	ld e, a
	add hl, de
	pop de
	ret
