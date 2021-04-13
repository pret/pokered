VictoryRoad3F_Script:
	call VictoryRoad3Script_44996
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad3TrainerHeaders
	ld de, VictoryRoad3F_ScriptPointers
	ld a, [wVictoryRoad3FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad3FCurScript], a
	ret

VictoryRoad3Script_44996:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEventHL EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH1
	ret z
	ld a, $1d
	ld [wNewTileBlockID], a
	lb bc, 5, 3
	predef_jump ReplaceTileBlock

VictoryRoad3F_ScriptPointers:
	dw VictoryRoad3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad3Script0:
	ld hl, wFlags_0xcd60
	bit 7, [hl]
	res 7, [hl]
	jp z, .asm_449fe
	ld hl, .coordsData_449f9
	call CheckBoulderCoords
	jp nc, .asm_449fe
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_449dc
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	SetEvent EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH1
	ret
.asm_449dc
	CheckAndSetEvent EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH2
	jr nz, .asm_449fe
	ld a, HS_VICTORY_ROAD_3F_BOULDER
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_VICTORY_ROAD_2F_BOULDER
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

.coordsData_449f9:
	dbmapcoord  3,  5
	dbmapcoord 23, 15
	db -1 ; end

.asm_449fe
	ld a, VICTORY_ROAD_2F
	ld [wDungeonWarpDestinationMap], a
	ld hl, .coordsData_449f9
	call IsPlayerOnDungeonWarp
	ld a, [wCoordIndex]
	cp $1
	jr nz, .asm_44a1b
	ld hl, wd72d
	res 4, [hl]
	ld hl, wd732
	res 4, [hl]
	ret
.asm_44a1b
	ld a, [wd72d]
	bit 4, a
	jp z, CheckFightingMapTrainers
	ret

VictoryRoad3F_TextPointers:
	dw VictoryRoad3Text1
	dw VictoryRoad3Text2
	dw VictoryRoad3Text3
	dw VictoryRoad3Text4
	dw PickUpItemText
	dw PickUpItemText
	dw BoulderText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad3TrainerHeaders:
	def_trainers
VictoryRoad3TrainerHeader0:
	trainer EVENT_BEAT_VICTORY_ROAD_3_TRAINER_0, 1, VictoryRoad3BattleText2, VictoryRoad3EndBattleText2, VictoryRoad3AfterBattleText2
VictoryRoad3TrainerHeader1:
	trainer EVENT_BEAT_VICTORY_ROAD_3_TRAINER_1, 4, VictoryRoad3BattleText3, VictoryRoad3EndBattleText3, VictoryRoad3AfterBattleText3
VictoryRoad3TrainerHeader2:
	trainer EVENT_BEAT_VICTORY_ROAD_3_TRAINER_2, 4, VictoryRoad3BattleText4, VictoryRoad3EndBattleText4, VictoryRoad3AfterBattleText4
VictoryRoad3TrainerHeader3:
	trainer EVENT_BEAT_VICTORY_ROAD_3_TRAINER_3, 4, VictoryRoad3BattleText5, VictoryRoad3EndBattleText5, VictoryRoad3AfterBattleText5
	db -1 ; end

VictoryRoad3Text1:
	text_asm
	ld hl, VictoryRoad3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text2:
	text_asm
	ld hl, VictoryRoad3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text3:
	text_asm
	ld hl, VictoryRoad3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text4:
	text_asm
	ld hl, VictoryRoad3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3BattleText2:
	text_far _VictoryRoad3BattleText2
	text_end

VictoryRoad3EndBattleText2:
	text_far _VictoryRoad3EndBattleText2
	text_end

VictoryRoad3AfterBattleText2:
	text_far _VictoryRoad3AfterBattleText2
	text_end

VictoryRoad3BattleText3:
	text_far _VictoryRoad3BattleText3
	text_end

VictoryRoad3EndBattleText3:
	text_far _VictoryRoad3EndBattleText3
	text_end

VictoryRoad3AfterBattleText3:
	text_far _VictoryRoad3AfterBattleText3
	text_end

VictoryRoad3BattleText4:
	text_far _VictoryRoad3BattleText4
	text_end

VictoryRoad3EndBattleText4:
	text_far _VictoryRoad3EndBattleText4
	text_end

VictoryRoad3AfterBattleText4:
	text_far _VictoryRoad3AfterBattleText4
	text_end

VictoryRoad3BattleText5:
	text_far _VictoryRoad3BattleText5
	text_end

VictoryRoad3EndBattleText5:
	text_far _VictoryRoad3EndBattleText5
	text_end

VictoryRoad3AfterBattleText5:
	text_far _VictoryRoad3AfterBattleText5
	text_end
