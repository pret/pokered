VictoryRoad1Script: ; 5da0a (17:5a0a)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	call nz, .next
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad1TrainerHeaders
	ld de, VictoryRoad1ScriptPointers
	ld a, [W_VICTORYROAD1CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VICTORYROAD1CURSCRIPT], a
	ret
.next
	CheckEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ret z
	ld a, $1d
	ld [wd09f], a
	ld bc, $604
	predef_jump ReplaceTileBlock

VictoryRoad1ScriptPointers: ; 5da3a (17:5a3a)
	dw VictoryRoad1Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad1Script0: ; 5da40 (17:5a40)
	CheckEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	jp nz, CheckFightingMapTrainers
	ld hl, CoordsData_5da5c
	call CheckBoulderCoords
	jp nc, CheckFightingMapTrainers
	ld hl, wd126
	set 5, [hl]
	SetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH
	ret

CoordsData_5da5c: ; 5da5c (17:5a5c)
	db $0D,$11,$FF

VictoryRoad1TextPointers: ; 5da5f (17:5a5f)
	dw VictoryRoad1Text1
	dw VictoryRoad1Text2
	dw PickUpItemText
	dw PickUpItemText
	dw BoulderText
	dw BoulderText
	dw BoulderText

VictoryRoad1TrainerHeaders: ; 5da6d (17:5a6d)
VictoryRoad1TrainerHeader0: ; 5da6d (17:5a6d)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_1_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_1_TRAINER_0
	dw VictoryRoad1BattleText1 ; TextBeforeBattle
	dw VictoryRoad1AfterBattleText1 ; TextAfterBattle
	dw VictoryRoad1EndBattleText1 ; TextEndBattle
	dw VictoryRoad1EndBattleText1 ; TextEndBattle

VictoryRoad1TrainerHeader1: ; 5da79 (17:5a79)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_1_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_1_TRAINER_1
	dw VictoryRoad1BattleText2 ; TextBeforeBattle
	dw VictoryRoad1AfterBattleText2 ; TextAfterBattle
	dw VictoryRoad1EndBattleText2 ; TextEndBattle
	dw VictoryRoad1EndBattleText2 ; TextEndBattle

	db $ff

VictoryRoad1Text1: ; 5da86 (17:5a86)
	TX_ASM
	ld hl, VictoryRoad1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad1Text2: ; 5da90 (17:5a90)
	TX_ASM
	ld hl, VictoryRoad1TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad1BattleText1: ; 5da9a (17:5a9a)
	TX_FAR _VictoryRoad1BattleText1
	db "@"

VictoryRoad1EndBattleText1: ; 5da9f (17:5a9f)
	TX_FAR _VictoryRoad1EndBattleText1
	db "@"

VictoryRoad1AfterBattleText1: ; 5daa4 (17:5aa4)
	TX_FAR _VictoryRoad1AfterBattleText1
	db "@"

VictoryRoad1BattleText2: ; 5daa9 (17:5aa9)
	TX_FAR _VictoryRoad1BattleText2
	db "@"

VictoryRoad1EndBattleText2: ; 5daae (17:5aae)
	TX_FAR _VictoryRoad1EndBattleText2
	db "@"

VictoryRoad1AfterBattleText2: ; 5dab3 (17:5ab3)
	TX_FAR _VictoryRoad1AfterBattleText2
	db "@"
