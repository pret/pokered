AgathaScript: ; 7642d (1d:642d)
	call AgathaShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, AgathaTrainerHeaders
	ld de, AgathaScriptPointers
	ld a, [wAgathaCurScript]
	call ExecuteCurMapScriptInTable
	ld [wAgathaCurScript], a
	ret

AgathaShowOrHideExitBlock: ; 76443 (1d:6443)
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BEAT_AGATHAS_ROOM_TRAINER_0
	jr z, .blockExitToNextRoom
	ld a, $e
	jp .setExitBlock
.blockExitToNextRoom
	ld a, $3b
.setExitBlock:
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetAgathaScript: ; 76464 (1d:6464)
	xor a
	ld [wAgathaCurScript], a
	ret

AgathaScriptPointers: ; 76469 (1d:6469)
	dw AgathaScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw AgathaScript2
	dw AgathaScript3
	dw AgathaScript4

AgathaScript4: ; 76473 (1d:6473)
	ret

AgathaScriptWalkIntoRoom: ; 76474 (1d:6474)
; Walk six steps upward.
	ld hl, wSimulatedJoypadStatesEnd
	ld a, D_UP
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wAgathaCurScript], a
	ld [wCurMapScript], a
	ret

AgathaScript0: ; 76490 (1d:6490)
	ld hl, AgathaEntranceCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ld [hJoyPressed], a
	ld [hJoyHeld], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, [wCoordIndex]
	cp $3  ; Is player standing one tile above the exit?
	jr c, .stopPlayerFromLeaving
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_AGATHAS_ROOM
	jr z, AgathaScriptWalkIntoRoom
.stopPlayerFromLeaving
	ld a, $2
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID  ; "Don't run away!"
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $3
	ld [wAgathaCurScript], a
	ld [wCurMapScript], a
	ret

AgathaEntranceCoords: ; 764d1 (1d:64d1)
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

AgathaScript3: ; 764da (1d:64da)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wAgathaCurScript], a
	ld [wCurMapScript], a
	ret

AgathaScript2: ; 764ed (1d:64ed)
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetAgathaScript
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $1
	ld [wGaryCurScript], a
	ret

AgathaTextPointers: ; 76505 (1d:6505)
	dw AgathaText1
	dw AgathaDontRunAwayText

AgathaTrainerHeaders: ; 76509 (1d:6509)
AgathaTrainerHeader0: ; 76509 (1d:6509)
	dbEventFlagBit EVENT_BEAT_AGATHAS_ROOM_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_AGATHAS_ROOM_TRAINER_0
	dw AgathaBeforeBattleText ; TextBeforeBattle
	dw AgathaAfterBattleText ; TextAfterBattle
	dw AgathaEndBattleText ; TextEndBattle
	dw AgathaEndBattleText ; TextEndBattle

	db $ff

AgathaText1: ; 76516 (1d:6516)
	TX_ASM
	ld hl, AgathaTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

AgathaBeforeBattleText: ; 76520 (1d:6520)
	TX_FAR _AgathaBeforeBattleText
	db "@"

AgathaEndBattleText: ; 76525 (1d:6525)
	TX_FAR _AgathaEndBattleText
	db "@"

AgathaAfterBattleText: ; 7652a (1d:652a)
	TX_FAR _AgathaAfterBattleText
	db "@"

AgathaDontRunAwayText: ; 7652f (1d:652f)
	TX_FAR _AgathaDontRunAwayText
	db "@"
