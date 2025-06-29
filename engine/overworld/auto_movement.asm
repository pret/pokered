PlayerStepOutFromDoor::
	ld hl, wStatusFlags5 ; should this be wMovementFlags?
	res BIT_EXITING_DOOR, [hl]
	call IsPlayerStandingOnDoorTile
	jr nc, .notStandingOnDoor
	ld a, PAD_SELECT | PAD_START | PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	ld hl, wMovementFlags
	set BIT_EXITING_DOOR, [hl]
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	xor a
	ld [wSpritePlayerStateData1ImageIndex], a
	call StartSimulatingJoypadStates
	ret
.notStandingOnDoor
	xor a
	ld [wUnusedOverrideSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesEnd], a
	ld hl, wMovementFlags
	res BIT_STANDING_ON_DOOR, [hl]
	res BIT_EXITING_DOOR, [hl]
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ret

_EndNPCMovementScript::
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, wStatusFlags4
	res BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	ld hl, wMovementFlags
	res BIT_STANDING_ON_DOOR, [hl]
	res BIT_EXITING_DOOR, [hl]
	xor a
	ld [wNPCMovementScriptSpriteOffset], a
	ld [wNPCMovementScriptPointerTableNum], a
	ld [wNPCMovementScriptFunctionNum], a
	ld [wUnusedOverrideSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesIndex], a
	ld [wSimulatedJoypadStatesEnd], a
	ret

PalletMovementScriptPointerTable::
	dw PalletMovementScript_OakMoveLeft
	dw PalletMovementScript_PlayerMoveLeft
	dw PalletMovementScript_WaitAndWalkToLab
	dw PalletMovementScript_WalkToLab
	dw PalletMovementScript_Done

PalletMovementScript_OakMoveLeft:
	ld a, [wXCoord]
	sub $a
	ld [wNumStepsToTake], a
	jr z, .playerOnLeftTile
; The player is on the right tile of the northern path out of Pallet Town and
; Prof. Oak is below.
; Make Prof. Oak step to the left.
	ld b, 0
	ld c, a
	ld hl, wNPCMovementDirections2
	ld a, NPC_MOVEMENT_LEFT
	call FillMemory
	ld [hl], $ff
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	ld de, wNPCMovementDirections2
	call MoveSprite
	ld a, $1
	ld [wNPCMovementScriptFunctionNum], a
	jr .done
; The player is on the left tile of the northern path out of Pallet Town and
; Prof. Oak is below.
; Prof. Oak is already where he needs to be.
.playerOnLeftTile
	ld a, $3
	ld [wNPCMovementScriptFunctionNum], a
.done
	ld hl, wStatusFlags7
	set BIT_NO_MAP_MUSIC, [hl]
	ld a, PAD_SELECT | PAD_START | PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN
	ld [wJoyIgnore], a
	ret

PalletMovementScript_PlayerMoveLeft:
	ld a, [wStatusFlags5]
	bit BIT_SCRIPTED_NPC_MOVEMENT, a
	ret nz ; return if Oak is still moving
	ld a, [wNumStepsToTake]
	ld [wSimulatedJoypadStatesIndex], a
	ldh [hNPCMovementDirections2Index], a
	predef ConvertNPCMovementDirectionsToJoypadMasks
	call StartSimulatingJoypadStates
	ld a, $2
	ld [wNPCMovementScriptFunctionNum], a
	ret

PalletMovementScript_WaitAndWalkToLab:
	ld a, [wSimulatedJoypadStatesIndex]
	and a ; is the player done moving left yet?
	ret nz

PalletMovementScript_WalkToLab:
	xor a
	ld [wOverrideSimulatedJoypadStatesMask], a
	ld a, [wSpriteIndex]
	swap a
	ld [wNPCMovementScriptSpriteOffset], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_PlayerWalkToLab
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wNPCMovementDirections2
	ld de, RLEList_ProfOakWalkToLab
	call DecodeRLEList
	ld hl, wStatusFlags4
	res BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, $4
	ld [wNPCMovementScriptFunctionNum], a
	ret

RLEList_ProfOakWalkToLab:
	db NPC_MOVEMENT_DOWN, 5
	db NPC_MOVEMENT_LEFT, 1
	db NPC_MOVEMENT_DOWN, 5
	db NPC_MOVEMENT_RIGHT, 3
	db NPC_MOVEMENT_UP, 1
	db NPC_CHANGE_FACING, 1
	db -1 ; end

RLEList_PlayerWalkToLab:
	db PAD_UP, 2
	db PAD_RIGHT, 3
	db PAD_DOWN, 5
	db PAD_LEFT, 1
	db PAD_DOWN, 6
	db -1 ; end

PalletMovementScript_Done:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, HS_PALLET_TOWN_OAK
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, wStatusFlags4
	res BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	jp EndNPCMovementScript

PewterMuseumGuyMovementScriptPointerTable::
	dw PewterMovementScript_WalkToMuseum
	dw PewterMovementScript_Done

PewterMovementScript_WalkToMuseum:
	ld a, BANK(Music_MuseumGuy)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, MUSIC_MUSEUM_GUY
	ld [wNewSoundID], a
	call PlaySound
	ld a, [wSpriteIndex]
	swap a
	ld [wNPCMovementScriptSpriteOffset], a
	call StartSimulatingJoypadStates
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_PewterMuseumPlayer
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	xor a
	ld [wWhichPewterGuy], a
	predef PewterGuys
	ld hl, wNPCMovementDirections2
	ld de, RLEList_PewterMuseumGuy
	call DecodeRLEList
	ld hl, wStatusFlags4
	res BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	ld a, $1
	ld [wNPCMovementScriptFunctionNum], a
	ret

RLEList_PewterMuseumPlayer:
	db NO_INPUT, 1
	db PAD_UP, 3
	db PAD_LEFT, 13
	db PAD_UP, 6
	db -1 ; end

RLEList_PewterMuseumGuy:
	db NPC_MOVEMENT_UP, 6
	db NPC_MOVEMENT_LEFT, 13
	db NPC_MOVEMENT_UP, 3
	db NPC_MOVEMENT_LEFT, 1
	db -1 ; end

PewterMovementScript_Done:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld hl, wStatusFlags5
	res BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld hl, wStatusFlags4
	res BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	jp EndNPCMovementScript

PewterGymGuyMovementScriptPointerTable::
	dw PewterMovementScript_WalkToGym
	dw PewterMovementScript_Done

PewterMovementScript_WalkToGym:
	ld a, BANK(Music_MuseumGuy)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	ld a, MUSIC_MUSEUM_GUY
	ld [wNewSoundID], a
	call PlaySound
	ld a, [wSpriteIndex]
	swap a
	ld [wNPCMovementScriptSpriteOffset], a
	xor a
	ld [wSpritePlayerStateData2MovementByte1], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RLEList_PewterGymPlayer
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, 1
	ld [wWhichPewterGuy], a
	predef PewterGuys
	ld hl, wNPCMovementDirections2
	ld de, RLEList_PewterGymGuy
	call DecodeRLEList
	ld hl, wStatusFlags4
	res BIT_INIT_SCRIPTED_MOVEMENT, [hl]
	ld hl, wStatusFlags5
	set BIT_SCRIPTED_MOVEMENT_STATE, [hl]
	ld a, $1
	ld [wNPCMovementScriptFunctionNum], a
	ret

RLEList_PewterGymPlayer:
	db NO_INPUT, 1
	db PAD_RIGHT, 2
	db PAD_DOWN, 5
	db PAD_LEFT, 11
	db PAD_UP, 5
	db PAD_LEFT, 15
	db -1 ; end

RLEList_PewterGymGuy:
	db NPC_MOVEMENT_DOWN, 2
	db NPC_MOVEMENT_LEFT, 15
	db NPC_MOVEMENT_UP, 5
	db NPC_MOVEMENT_LEFT, 11
	db NPC_MOVEMENT_DOWN, 5
	db NPC_MOVEMENT_RIGHT, 3
	db -1 ; end

SetEnemyTrainerToStayAndFaceAnyDirection::
	ld a, [wCurMap]
	cp POKEMON_TOWER_7F
	ret z ; the Rockets on Pokemon Tower 7F leave after battling, so don't set them
	ld hl, RivalIDs
	ld a, [wEngagedTrainerClass]
	ld b, a
.loop
	ld a, [hli]
	cp -1
	jr z, .notRival
	cp b
	ret z ; the rival leaves after battling, so don't set him
	jr .loop
.notRival
	ld a, [wSpriteIndex]
	ldh [hSpriteIndex], a
	jp SetSpriteMovementBytesToFF

RivalIDs:
	db OPP_RIVAL1
	db OPP_RIVAL2
	db OPP_RIVAL3
	db -1 ; end
