VictoryRoad3Script: ; 44980 (11:4980)
	call VictoryRoad3Script_44996
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad3TrainerHeaders
	ld de, VictoryRoad3ScriptPointers
	ld a, [W_VICTORYROAD3CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_VICTORYROAD3CURSCRIPT], a
	ret

VictoryRoad3Script_44996: ; 44996 (11:4996)
	ld hl, wd126
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEventHL EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH1
	ret z
	ld a, $1d
	ld [wd09f], a
	ld bc, $503
	predef_jump ReplaceTileBlock

VictoryRoad3ScriptPointers: ; 449b1 (11:49b1)
	dw VictoryRoad3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad3Script0: ; 449b7 (11:49b7)
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
	ld hl, wd126
	set 5, [hl]
	SetEvent EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH1
	ret
.asm_449dc
	CheckAndSetEvent EVENT_VICTORY_ROAD_3_BOULDER_ON_SWITCH2
	jr nz, .asm_449fe
	ld a, HS_VICTORY_ROAD_3_BOULDER
	ld [wcc4d], a
	predef HideObject
	ld a, HS_VICTORY_ROAD_2_BOULDER
	ld [wcc4d], a
	predef_jump ShowObject

.coordsData_449f9: ; 449f9 (11:49f9)
	db $05,$03
	db $0F,$17
	db $FF

.asm_449fe
	ld a, VICTORY_ROAD_2
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

VictoryRoad3TextPointers: ; 44a24 (11:4a24)
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

VictoryRoad3TrainerHeaders: ; 44a38 (11:4a38)
VictoryRoad3TrainerHeader0: ; 44a38 (11:4a38)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_3_TRAINER_0
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_3_TRAINER_0
	dw VictoryRoad3BattleText2 ; TextBeforeBattle
	dw VictoryRoad3AfterBattleText2 ; TextAfterBattle
	dw VictoryRoad3EndBattleText2 ; TextEndBattle
	dw VictoryRoad3EndBattleText2 ; TextEndBattle

VictoryRoad3TrainerHeader2: ; 44a44 (11:4a44)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_3_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_3_TRAINER_2
	dw VictoryRoad3BattleText3 ; TextBeforeBattle
	dw VictoryRoad3AfterBattleText3 ; TextAfterBattle
	dw VictoryRoad3EndBattleText3 ; TextEndBattle
	dw VictoryRoad3EndBattleText3 ; TextEndBattle

VictoryRoad3TrainerHeader3: ; 44a50 (11:4a50)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_3_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_3_TRAINER_3
	dw VictoryRoad3BattleText4 ; TextBeforeBattle
	dw VictoryRoad3AfterBattleText4 ; TextAfterBattle
	dw VictoryRoad3EndBattleText4 ; TextEndBattle
	dw VictoryRoad3EndBattleText4 ; TextEndBattle

VictoryRoad3TrainerHeader4: ; 44a5c (11:4a5c)
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_3_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_3_TRAINER_4
	dw VictoryRoad3BattleText5 ; TextBeforeBattle
	dw VictoryRoad3AfterBattleText5 ; TextAfterBattle
	dw VictoryRoad3EndBattleText5 ; TextEndBattle
	dw VictoryRoad3EndBattleText5 ; TextEndBattle

	db $ff

VictoryRoad3Text1: ; 44a69 (11:4a69)
	TX_ASM
	ld hl, VictoryRoad3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text2: ; 44a73 (11:4a73)
	TX_ASM
	ld hl, VictoryRoad3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text3: ; 44a7d (11:4a7d)
	TX_ASM
	ld hl, VictoryRoad3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3Text4: ; 44a87 (11:4a87)
	TX_ASM
	ld hl, VictoryRoad3TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad3BattleText2: ; 44a91 (11:4a91)
	TX_FAR _VictoryRoad3BattleText2
	db "@"

VictoryRoad3EndBattleText2: ; 44a96 (11:4a96)
	TX_FAR _VictoryRoad3EndBattleText2
	db "@"

VictoryRoad3AfterBattleText2: ; 44a9b (11:4a9b)
	TX_FAR _VictoryRoad3AfterBattleText2
	db "@"

VictoryRoad3BattleText3: ; 44aa0 (11:4aa0)
	TX_FAR _VictoryRoad3BattleText3
	db "@"

VictoryRoad3EndBattleText3: ; 44aa5 (11:4aa5)
	TX_FAR _VictoryRoad3EndBattleText3
	db "@"

VictoryRoad3AfterBattleText3: ; 44aaa (11:4aaa)
	TX_FAR _VictoryRoad3AfterBattleText3
	db "@"

VictoryRoad3BattleText4: ; 44aaf (11:4aaf)
	TX_FAR _VictoryRoad3BattleText4
	db "@"

VictoryRoad3EndBattleText4: ; 44ab4 (11:4ab4)
	TX_FAR _VictoryRoad3EndBattleText4
	db "@"

VictoryRoad3AfterBattleText4: ; 44ab9 (11:4ab9)
	TX_FAR _VictoryRoad3AfterBattleText4
	db "@"

VictoryRoad3BattleText5: ; 44abe (11:4abe)
	TX_FAR _VictoryRoad3BattleText5
	db "@"

VictoryRoad3EndBattleText5: ; 44ac3 (11:4ac3)
	TX_FAR _VictoryRoad3EndBattleText5
	db "@"

VictoryRoad3AfterBattleText5: ; 44ac8 (11:4ac8)
	TX_FAR _VictoryRoad3AfterBattleText5
	db "@"
