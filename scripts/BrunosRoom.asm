BrunosRoom_Script:
	call BrunoShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, BrunoTrainerHeader0
	ld de, BrunosRoom_ScriptPointers
	ld a, [wBrunosRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wBrunosRoomCurScript], a
	ret

BrunoShowOrHideExitBlock:
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

ResetBrunoScript:
	xor a
	ld [wBrunosRoomCurScript], a
	ret

BrunosRoom_ScriptPointers:
	dw BrunoScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw BrunoScript2
	dw BrunoScript3
	dw BrunoScript4

BrunoScript4:
	ret

BrunoScriptWalkIntoRoom:
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
	ld [wBrunosRoomCurScript], a
	ld [wCurMapScript], a
	ret

BrunoScript0:
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
	ld [wBrunosRoomCurScript], a
	ld [wCurMapScript], a
	ret

BrunoEntranceCoords:
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

BrunoScript3:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wBrunosRoomCurScript], a
	ld [wCurMapScript], a
	ret

BrunoScript2:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetBrunoScript
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

BrunosRoom_TextPointers:
	dw BrunoText1
	dw BrunoDontRunAwayText

BrunoTrainerHeader0:
	dbEventFlagBit EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_BRUNOS_ROOM_TRAINER_0
	dw BrunoBeforeBattleText ; TextBeforeBattle
	dw BrunoAfterBattleText ; TextAfterBattle
	dw BrunoEndBattleText ; TextEndBattle
	dw BrunoEndBattleText ; TextEndBattle

	db $ff

BrunoText1:
	TX_ASM
	ld hl, BrunoTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

BrunoBeforeBattleText:
	TX_FAR _BrunoBeforeBattleText
	db "@"

BrunoEndBattleText:
	TX_FAR _BrunoEndBattleText
	db "@"

BrunoAfterBattleText:
	TX_FAR _BrunoAfterBattleText
	db "@"

BrunoDontRunAwayText:
	TX_FAR _BrunoDontRunAwayText
	db "@"
