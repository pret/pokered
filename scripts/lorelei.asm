LoreleiScript: ; 7617b (1d:617b)
	call LoreleiShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, LoreleiTrainerHeaders
	ld de, LoreleiScriptPointers
	ld a, [wLoreleiCurScript]
	call ExecuteCurMapScriptInTable
	ld [wLoreleiCurScript], a
	ret

LoreleiShowOrHideExitBlock: ; 76191 (1d:6191)
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld hl, wBeatLorelei
	set 1, [hl]
	CheckEvent EVENT_BEAT_LORELEIS_ROOM_TRAINER_0
	jr z, .blockExitToNextRoom
	ld a, $5
	jr .setExitBlock
.blockExitToNextRoom
	ld a, $24
.setExitBlock
	ld [wNewTileBlockID], a
	lb bc, 0, 2
	predef_jump ReplaceTileBlock

ResetLoreleiScript: ; 761b6 (1d:61b6)
	xor a
	ld [wLoreleiCurScript], a
	ret

LoreleiScriptPointers: ; 761bb (1d:61bb)
	dw LoreleiScript0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw LoreleiScript2
	dw LoreleiScript3
	dw LoreleiScript4

LoreleiScript4: ; 761c5 (1d:61c5)
	ret

LoreleiScriptWalkIntoRoom: ; 761c6 (1d:61c6)
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
	ld [wLoreleiCurScript], a
	ld [wCurMapScript], a
	ret

LoreleiScript0: ; 761e2 (1d:61e2)
	ld hl, LoreleiEntranceCoords
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
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_LORELEIS_ROOM
	jr z, LoreleiScriptWalkIntoRoom
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
	ld [wLoreleiCurScript], a
	ld [wCurMapScript], a
	ret

LoreleiEntranceCoords: ; 76223 (1d:6223)
	db $0A,$04
	db $0A,$05
	db $0B,$04
	db $0B,$05
	db $FF

LoreleiScript3: ; 7622c (1d:622c)
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wLoreleiCurScript], a
	ld [wCurMapScript], a
	ret

LoreleiScript2: ; 7623f (1d:623f)
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetLoreleiScript
	ld a, $1
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

LoreleiTextPointers: ; 76251 (1d:6251)
	dw LoreleiText1
	dw LoreleiDontRunAwayText

LoreleiTrainerHeaders: ; 76255 (1d:6255)
LoreleiTrainerHeader0: ; 76255 (1d:6255)
	dbEventFlagBit EVENT_BEAT_LORELEIS_ROOM_TRAINER_0
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_LORELEIS_ROOM_TRAINER_0
	dw LoreleiBeforeBattleText ; TextBeforeBattle
	dw LoreleiAfterBattleText ; TextAfterBattle
	dw LoreleiEndBattleText ; TextEndBattle
	dw LoreleiEndBattleText ; TextEndBattle

	db $ff

LoreleiText1: ; 76262 (1d:6262)
	TX_ASM
	ld hl, LoreleiTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

LoreleiBeforeBattleText: ; 7626c (1d:626c)
	TX_FAR _LoreleiBeforeBattleText
	db "@"

LoreleiEndBattleText: ; 76271 (1d:6271)
	TX_FAR _LoreleiEndBattleText
	db "@"

LoreleiAfterBattleText: ; 76276 (1d:6276)
	TX_FAR _LoreleiAfterBattleText
	db "@"

LoreleiDontRunAwayText: ; 7627b (1d:627b)
	TX_FAR _LoreleiDontRunAwayText
	db "@"
