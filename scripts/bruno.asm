BrunoScript: ; 762d6 (1d:62d6)
	call BrunoShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, BrunoTrainerHeaders
	ld de, BrunoScriptPointers
	ld a, [wBrunoCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBrunoCurScript], a
	ret

BrunoShowOrHideExitBlock: ; 762ec (1d:62ec)
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	jr z, .blockExitToNextRoom
	ld a, $5
	jp .setExitBlock
.blockExitToNextRoom
	ld a, $24
.setExitBlock
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetBrunoScript: ; 7630d (1d:630d)
	xor a
	ld [wBrunoCurScript], a
	ret

BrunoScriptPointers: ; 76312 (1d:6312)
	dw BrunoScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw BrunoScript2
	dw BrunoScript3
	dw BrunoScript4

BrunoScript4: ; 7631c (1d:631c)
	ret

BrunoScriptWalkIntoRoom: ; 7631d (1d:631d)
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
	ld [wBrunoCurScript], a
	ld [wCurMapScript], a
	ret

BrunoScript0: ; 76339 (1d:6339)
	ld hl, BrunoEntranceCoords
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
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_BRUNOS_ROOM
	jr z, BrunoScriptWalkIntoRoom
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
	ld [wBrunoCurScript], a
	ld [wCurMapScript], a
	ret

BrunoEntranceCoords: ; 7637a (1d:637a)
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

BrunoScript3: ; 76383 (1d:6383)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wBrunoCurScript], a
	ld [wCurMapScript], a
	ret

BrunoScript2: ; 76396 (1d:6396)
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetBrunoScript
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

BrunoTextPointers: ; 763a8 (1d:63a8)
	dw BrunoText1
	dw BrunoDontRunAwayText

BrunoTrainerHeaders: ; 763ac (1d:63ac)
BrunoTrainerHeader0: ; 763ac (1d:63ac)
	dbEventFlagBit EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	dw BrunoBeforeBattleText ; TextBeforeBattle
	dw BrunoAfterBattleText ; TextAfterBattle
	dw BrunoEndBattleText ; TextEndBattle
	dw BrunoEndBattleText ; TextEndBattle

	db $ff

BrunoText1: ; 763b9 (1d:63b9)
	TX_ASM
	ld hl, BrunoTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

BrunoBeforeBattleText: ; 763c3 (1d:63c3)
	TX_FAR _BrunoBeforeBattleText
	db "@"

BrunoEndBattleText: ; 763c8 (1d:63c8)
	TX_FAR _BrunoEndBattleText
	db "@"

BrunoAfterBattleText: ; 763cd (1d:63cd)
	TX_FAR _BrunoAfterBattleText
	db "@"

BrunoDontRunAwayText: ; 763d2 (1d:63d2)
	TX_FAR _BrunoDontRunAwayText
	db "@"
