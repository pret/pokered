LoreleisRoom_Script:
	call LoreleiShowOrHideExitBlock
	call EnableAutoTextBoxDrawing
	ld hl, LoreleisRoomTrainerHeaders
	ld de, LoreleisRoom_ScriptPointers
	ld a, [wLoreleisRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wLoreleisRoomCurScript], a
	ret

LoreleiShowOrHideExitBlock:
; Blocks or clears the exit to the next room.
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld hl, wElite4Flags
	set BIT_STARTED_ELITE_4, [hl]
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

ResetLoreleiScript:
	xor a ; SCRIPT_LORELEISROOM_DEFAULT
	ld [wLoreleisRoomCurScript], a
	ret

LoreleisRoom_ScriptPointers:
	def_script_pointers
	dw_const LoreleisRoomDefaultScript,             SCRIPT_LORELEISROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_LORELEISROOM_LORELEI_START_BATTLE
	dw_const LoreleisRoomLoreleiEndBattleScript,    SCRIPT_LORELEISROOM_LORELEI_END_BATTLE
	dw_const LoreleisRoomPlayerIsMovingScript,      SCRIPT_LORELEISROOM_PLAYER_IS_MOVING
	dw_const LoreleisRoomNoopScript,                SCRIPT_LORELEISROOM_NOOP

LoreleisRoomNoopScript:
	ret

LoreleiScriptWalkIntoRoom:
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
	ld a, SCRIPT_LORELEISROOM_PLAYER_IS_MOVING
	ld [wLoreleisRoomCurScript], a
	ld [wCurMapScript], a
	ret

LoreleisRoomDefaultScript:
	ld hl, LoreleiEntranceCoords
	call ArePlayerCoordsInArray
	jp nc, CheckFightingMapTrainers
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ld [wSimulatedJoypadStatesEnd], a
	ld [wSimulatedJoypadStatesIndex], a
	ld a, [wCoordIndex]
	cp $3  ; Is player standing one tile above the exit?
	jr c, .stopPlayerFromLeaving
	CheckAndSetEvent EVENT_AUTOWALKED_INTO_LORELEIS_ROOM
	jr z, LoreleiScriptWalkIntoRoom
.stopPlayerFromLeaving
	ld a, TEXT_LORELEISROOM_DONT_RUN_AWAY
	ldh [hTextID], a
	call DisplayTextID  ; "Don't run away!"
	ld a, D_UP
	ld [wSimulatedJoypadStatesEnd], a
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, SCRIPT_LORELEISROOM_PLAYER_IS_MOVING
	ld [wLoreleisRoomCurScript], a
	ld [wCurMapScript], a
	ret

LoreleiEntranceCoords:
	dbmapcoord  4, 10
	dbmapcoord  5, 10
	dbmapcoord  4, 11
	dbmapcoord  5, 11
	db -1 ; end

LoreleisRoomPlayerIsMovingScript:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld [wLoreleisRoomCurScript], a
	ld [wCurMapScript], a
	ret

LoreleisRoomLoreleiEndBattleScript:
	call EndTrainerBattle
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetLoreleiScript
	ld a, TEXT_LORELEISROOM_LORELEI
	ldh [hTextID], a
	jp DisplayTextID

LoreleisRoom_TextPointers:
	def_text_pointers
	dw_const LoreleisRoomLoreleiText,            TEXT_LORELEISROOM_LORELEI
	dw_const LoreleisRoomLoreleiDontRunAwayText, TEXT_LORELEISROOM_DONT_RUN_AWAY

LoreleisRoomTrainerHeaders:
	def_trainers
LoreleisRoomTrainerHeader0:
	trainer EVENT_BEAT_LORELEIS_ROOM_TRAINER_0, 0, LoreleisRoomLoreleiBeforeBattleText, LoreleisRoomLoreleiEndBattleText, LoreleisRoomLoreleiAfterBattleText
	db -1 ; end

LoreleisRoomLoreleiText:
	text_asm
	ld hl, LoreleisRoomTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

LoreleisRoomLoreleiBeforeBattleText:
	text_far _LoreleisRoomLoreleiBeforeBattleText
	text_end

LoreleisRoomLoreleiEndBattleText:
	text_far _LoreleisRoomLoreleiEndBattleText
	text_end

LoreleisRoomLoreleiAfterBattleText:
	text_far _LoreleisRoomLoreleiAfterBattleText
	text_end

LoreleisRoomLoreleiDontRunAwayText:
	text_far _LoreleisRoomLoreleiDontRunAwayText
	text_end
