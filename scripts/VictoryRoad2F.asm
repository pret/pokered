VictoryRoad2F_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, VictoryRoad2Script_517c4
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	call nz, VictoryRoad2Script_517c9
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad2TrainerHeader0
	ld de, VictoryRoad2F_ScriptPointers
	ld a, [wVictoryRoad2FCurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad2FCurScript], a
	ret

VictoryRoad2Script_517c4:
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH

VictoryRoad2Script_517c9:
	CheckEvent EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	jr z, .asm_517da
	push af
	ld a, $15
	lb bc, 4, 3
	call VictoryRoad2Script_517e2
	pop af
.asm_517da
	bit 7, a
	ret z
	ld a, $1d
	lb bc, 7, 11

VictoryRoad2Script_517e2:
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

VictoryRoad2F_ScriptPointers:
	dw VictoryRoad2Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad2Script0:
	ld hl, CoordsData_51816
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	EventFlagAddress hl, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ld a, [wCoordIndex]
	cp $2
	jr z, .asm_5180b
	CheckEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	ret nz
	jr .asm_51810
.asm_5180b
	CheckEventAfterBranchReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
	ret nz
.asm_51810
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ret

CoordsData_51816:
	db $10,$01
	db $10,$09
	db $FF

VictoryRoad2F_TextPointers:
	dw VictoryRoad2Text1
	dw VictoryRoad2Text2
	dw VictoryRoad2Text3
	dw VictoryRoad2Text4
	dw VictoryRoad2Text5
	dw MoltresText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad2TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0
	dw VictoryRoad2BattleText1 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText1 ; TextAfterBattle
	dw VictoryRoad2EndBattleText1 ; TextEndBattle
	dw VictoryRoad2EndBattleText1 ; TextEndBattle

VictoryRoad2TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1
	dw VictoryRoad2BattleText2 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText2 ; TextAfterBattle
	dw VictoryRoad2EndBattleText2 ; TextEndBattle
	dw VictoryRoad2EndBattleText2 ; TextEndBattle

VictoryRoad2TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2
	dw VictoryRoad2BattleText3 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText3 ; TextAfterBattle
	dw VictoryRoad2EndBattleText3 ; TextEndBattle
	dw VictoryRoad2EndBattleText3 ; TextEndBattle

VictoryRoad2TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3
	dw VictoryRoad2BattleText4 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText4 ; TextAfterBattle
	dw VictoryRoad2EndBattleText4 ; TextEndBattle
	dw VictoryRoad2EndBattleText4 ; TextEndBattle

VictoryRoad2TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4
	dw VictoryRoad2BattleText5 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText5 ; TextAfterBattle
	dw VictoryRoad2EndBattleText5 ; TextEndBattle
	dw VictoryRoad2EndBattleText5 ; TextEndBattle

MoltresTrainerHeader:
	dbEventFlagBit EVENT_BEAT_MOLTRES
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MOLTRES
	dw MoltresBattleText ; TextBeforeBattle
	dw MoltresBattleText ; TextAfterBattle
	dw MoltresBattleText ; TextEndBattle
	dw MoltresBattleText ; TextEndBattle

	db $ff

VictoryRoad2Text1:
	text_asm
	ld hl, VictoryRoad2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text2:
	text_asm
	ld hl, VictoryRoad2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text3:
	text_asm
	ld hl, VictoryRoad2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text4:
	text_asm
	ld hl, VictoryRoad2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text5:
	text_asm
	ld hl, VictoryRoad2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

MoltresText:
	text_asm
	ld hl, MoltresTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MoltresBattleText:
	text_far _MoltresBattleText
	text_asm
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VictoryRoad2BattleText1:
	text_far _VictoryRoad2BattleText1
	text_end

VictoryRoad2EndBattleText1:
	text_far _VictoryRoad2EndBattleText1
	text_end

VictoryRoad2AfterBattleText1:
	text_far _VictoryRoad2AfterBattleText1
	text_end

VictoryRoad2BattleText2:
	text_far _VictoryRoad2BattleText2
	text_end

VictoryRoad2EndBattleText2:
	text_far _VictoryRoad2EndBattleText2
	text_end

VictoryRoad2AfterBattleText2:
	text_far _VictoryRoad2AfterBattleText2
	text_end

VictoryRoad2BattleText3:
	text_far _VictoryRoad2BattleText3
	text_end

VictoryRoad2EndBattleText3:
	text_far _VictoryRoad2EndBattleText3
	text_end

VictoryRoad2AfterBattleText3:
	text_far _VictoryRoad2AfterBattleText3
	text_end

VictoryRoad2BattleText4:
	text_far _VictoryRoad2BattleText4
	text_end

VictoryRoad2EndBattleText4:
	text_far _VictoryRoad2EndBattleText4
	text_end

VictoryRoad2AfterBattleText4:
	text_far _VictoryRoad2AfterBattleText4
	text_end

VictoryRoad2BattleText5:
	text_far _VictoryRoad2BattleText5
	text_end

VictoryRoad2EndBattleText5:
	text_far _VictoryRoad2EndBattleText5
	text_end

VictoryRoad2AfterBattleText5:
	text_far _VictoryRoad2AfterBattleText5
	text_end
