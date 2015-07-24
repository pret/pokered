VictoryRoad2Script: ; 5179d (14:579d)
	ld hl, wd126
	bit 6, [hl]
	res 6, [hl]
	call nz, VictoryRoad2Script_517c4
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	call nz, VictoryRoad2Script_517c9
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad2TrainerHeaders
	ld de, VictoryRoad2ScriptPointers
	ld a, [W_VICTORYROAD2CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VICTORYROAD2CURSCRIPT], a
	ret

VictoryRoad2Script_517c4: ; 517c4 (14:57c4)
	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH

VictoryRoad2Script_517c9: ; 517c9 (14:57c9)
	CheckEvent EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
	jr z, .asm_517da
	push af
	ld a, $15
	ld bc, $403
	call VictoryRoad2Script_517e2
	pop af
.asm_517da
	bit 7, a
	ret z
	ld a, $1d
	ld bc, $70b

VictoryRoad2Script_517e2: ; 517e2 (14:57e2)
	ld [wNewTileBlockID], a
	predef ReplaceTileBlock
	ret

VictoryRoad2ScriptPointers: ; 517eb (14:57eb)
	dw VictoryRoad2Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad2Script0: ; 517f1 (14:57f1)
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
	ld hl, wd126
	set 5, [hl]
	ret

CoordsData_51816: ; 51816 (14:5816)
	db $10,$01
	db $10,$09
	db $FF

VictoryRoad2TextPointers: ; 5181b (14:581b)
	dw VictoryRoad2Text1
	dw VictoryRoad2Text2
	dw VictoryRoad2Text3
	dw VictoryRoad2Text4
	dw VictoryRoad2Text5
	dw VictoryRoad2Text6
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad2TrainerHeaders: ; 51835 (14:5835)
VictoryRoad2TrainerHeader0: ; 51835 (14:5835)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0
	dw VictoryRoad2BattleText1 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText1 ; TextAfterBattle
	dw VictoryRoad2EndBattleText1 ; TextEndBattle
	dw VictoryRoad2EndBattleText1 ; TextEndBattle

VictoryRoad2TrainerHeader2: ; 51841 (14:5841)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2
	dw VictoryRoad2BattleText2 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText2 ; TextAfterBattle
	dw VictoryRoad2EndBattleText2 ; TextEndBattle
	dw VictoryRoad2EndBattleText2 ; TextEndBattle

VictoryRoad2TrainerHeader3: ; 5184d (14:584d)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3
	dw VictoryRoad2BattleText3 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText3 ; TextAfterBattle
	dw VictoryRoad2EndBattleText3 ; TextEndBattle
	dw VictoryRoad2EndBattleText3 ; TextEndBattle

VictoryRoad2TrainerHeader4: ; 51859 (14:5859)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4
	dw VictoryRoad2BattleText4 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText4 ; TextAfterBattle
	dw VictoryRoad2EndBattleText4 ; TextEndBattle
	dw VictoryRoad2EndBattleText4 ; TextEndBattle

VictoryRoad2TrainerHeader5: ; 51865 (14:5865)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_5
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_5
	dw VictoryRoad2BattleText5 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText5 ; TextAfterBattle
	dw VictoryRoad2EndBattleText5 ; TextEndBattle
	dw VictoryRoad2EndBattleText5 ; TextEndBattle

VictoryRoad2TrainerHeader6: ; 51871 (14:5871)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_6
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_6
	dw VictoryRoad2BattleText6 ; TextBeforeBattle
	dw VictoryRoad2BattleText6 ; TextAfterBattle
	dw VictoryRoad2BattleText6 ; TextEndBattle
	dw VictoryRoad2BattleText6 ; TextEndBattle

	db $ff

VictoryRoad2Text1: ; 5187e (14:587e)
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text2: ; 51888 (14:5888)
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text3: ; 51892 (14:5892)
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text4: ; 5189c (14:589c)
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text5: ; 518a6 (14:58a6)
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2Text6: ; 518b0 (14:58b0)
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad2BattleText6: ; 518ba (14:58ba)
	TX_FAR _VictoryRoad2BattleText6
	TX_ASM
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

VictoryRoad2BattleText1: ; 518ca (14:58ca)
	TX_FAR _VictoryRoad2BattleText1
	db "@"

VictoryRoad2EndBattleText1: ; 518cf (14:58cf)
	TX_FAR _VictoryRoad2EndBattleText1
	db "@"

VictoryRoad2AfterBattleText1: ; 518d4 (14:58d4)
	TX_FAR _VictoryRoad2AfterBattleText1
	db "@"

VictoryRoad2BattleText2: ; 518d9 (14:58d9)
	TX_FAR _VictoryRoad2BattleText2
	db "@"

VictoryRoad2EndBattleText2: ; 518de (14:58de)
	TX_FAR _VictoryRoad2EndBattleText2
	db "@"

VictoryRoad2AfterBattleText2: ; 518e3 (14:58e3)
	TX_FAR _VictoryRoad2AfterBattleText2
	db "@"

VictoryRoad2BattleText3: ; 518e8 (14:58e8)
	TX_FAR _VictoryRoad2BattleText3
	db "@"

VictoryRoad2EndBattleText3: ; 518ed (14:58ed)
	TX_FAR _VictoryRoad2EndBattleText3
	db "@"

VictoryRoad2AfterBattleText3: ; 518f2 (14:58f2)
	TX_FAR _VictoryRoad2AfterBattleText3
	db "@"

VictoryRoad2BattleText4: ; 518f7 (14:58f7)
	TX_FAR _VictoryRoad2BattleText4
	db "@"

VictoryRoad2EndBattleText4: ; 518fc (14:58fc)
	TX_FAR _VictoryRoad2EndBattleText4
	db "@"

VictoryRoad2AfterBattleText4: ; 51901 (14:5901)
	TX_FAR _VictoryRoad2AfterBattleText4
	db "@"

VictoryRoad2BattleText5: ; 51906 (14:5906)
	TX_FAR _VictoryRoad2BattleText5
	db "@"

VictoryRoad2EndBattleText5: ; 5190b (14:590b)
	TX_FAR _VictoryRoad2EndBattleText5
	db "@"

VictoryRoad2AfterBattleText5: ; 51910 (14:5910)
	TX_FAR _VictoryRoad2AfterBattleText5
	db "@"
