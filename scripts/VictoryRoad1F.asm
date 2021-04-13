VictoryRoad1F_Script:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	call nz, .next
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad1TrainerHeaders
	ld de, VictoryRoad1F_ScriptPointers
	ld a, [wVictoryRoad1FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad1FCurScript], a
	ret
.next
	CheckEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ret z
	ld a, $1d
	ld [wNewTileBlockID], a
	lb bc, 6, 4
	predef_jump ReplaceTileBlock

VictoryRoad1F_ScriptPointers:
	dw VictoryRoad1Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad1Script0:
	CheckEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_5da5c
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	SetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ret

CoordsData_5da5c:
	dbmapcoord 17, 13
	db -1 ; end

VictoryRoad1F_TextPointers:
	dw VictoryRoad1Text1
	dw VictoryRoad1Text2
	dw PickUpItemText
	dw PickUpItemText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad1TrainerHeaders:
	def_trainers
VictoryRoad1TrainerHeader0:
	trainer EVENT_BEAT_VICTORY_ROAD_1_TRAINER_0, 2, VictoryRoad1BattleText1, VictoryRoad1EndBattleText1, VictoryRoad1AfterBattleText1
VictoryRoad1TrainerHeader1:
	trainer EVENT_BEAT_VICTORY_ROAD_1_TRAINER_1, 2, VictoryRoad1BattleText2, VictoryRoad1EndBattleText2, VictoryRoad1AfterBattleText2
	db -1 ; end

VictoryRoad1Text1:
	text_asm
	ld hl, VictoryRoad1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad1Text2:
	text_asm
	ld hl, VictoryRoad1TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad1BattleText1:
	text_far _VictoryRoad1BattleText1
	text_end

VictoryRoad1EndBattleText1:
	text_far _VictoryRoad1EndBattleText1
	text_end

VictoryRoad1AfterBattleText1:
	text_far _VictoryRoad1AfterBattleText1
	text_end

VictoryRoad1BattleText2:
	text_far _VictoryRoad1BattleText2
	text_end

VictoryRoad1EndBattleText2:
	text_far _VictoryRoad1EndBattleText2
	text_end

VictoryRoad1AfterBattleText2:
	text_far _VictoryRoad1AfterBattleText2
	text_end
