Route10_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route10TrainerHeader0
	ld de, Route10_ScriptPointers
	ld a, [wRoute10CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute10CurScript], a
	ret

Route10_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route10_TextPointers:
	dw Route10Text1
	dw Route10Text2
	dw Route10Text3
	dw Route10Text4
	dw Route10Text5
	dw Route10Text6
	dw Route10Text7
	dw PokeCenterSignText
	dw Route10Text9
	dw Route10Text10

Route10TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_0
	dw Route10BattleText1 ; TextBeforeBattle
	dw Route10AfterBattleText1 ; TextAfterBattle
	dw Route10EndBattleText1 ; TextEndBattle
	dw Route10EndBattleText1 ; TextEndBattle

Route10TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_1
	dw Route10BattleText2 ; TextBeforeBattle
	dw Route10AfterBattleText2 ; TextAfterBattle
	dw Route10EndBattleText2 ; TextEndBattle
	dw Route10EndBattleText2 ; TextEndBattle

Route10TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_2
	dw Route10BattleText3 ; TextBeforeBattle
	dw Route10AfterBattleText3 ; TextAfterBattle
	dw Route10EndBattleText3 ; TextEndBattle
	dw Route10EndBattleText3 ; TextEndBattle

Route10TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_3
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_3
	dw Route10BattleText4 ; TextBeforeBattle
	dw Route10AfterBattleText4 ; TextAfterBattle
	dw Route10EndBattleText4 ; TextEndBattle
	dw Route10EndBattleText4 ; TextEndBattle

Route10TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_4
	dw Route10BattleText5 ; TextBeforeBattle
	dw Route10AfterBattleText5 ; TextAfterBattle
	dw Route10EndBattleText5 ; TextEndBattle
	dw Route10EndBattleText5 ; TextEndBattle

Route10TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_10_TRAINER_5
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_10_TRAINER_5
	dw Route10BattleText6 ; TextBeforeBattle
	dw Route10AfterBattleText6 ; TextAfterBattle
	dw Route10EndBattleText6 ; TextEndBattle
	dw Route10EndBattleText6 ; TextEndBattle

	db $ff

Route10Text1:
	TX_ASM
	ld hl, Route10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText1:
	TX_FAR _Route10BattleText1
	db "@"

Route10EndBattleText1:
	TX_FAR _Route10EndBattleText1
	db "@"

Route10AfterBattleText1:
	TX_FAR _Route10AfterBattleText1
	db "@"

Route10Text2:
	TX_ASM
	ld hl, Route10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText2:
	TX_FAR _Route10BattleText2
	db "@"

Route10EndBattleText2:
	TX_FAR _Route10EndBattleText2
	db "@"

Route10AfterBattleText2:
	TX_FAR _Route10AfterBattleText2
	db "@"

Route10Text3:
	TX_ASM
	ld hl, Route10TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText3:
	TX_FAR _Route10BattleText3
	db "@"

Route10EndBattleText3:
	TX_FAR _Route10EndBattleText3
	db "@"

Route10AfterBattleText3:
	TX_FAR _Route10AfterBattleText3
	db "@"

Route10Text4:
	TX_ASM
	ld hl, Route10TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText4:
	TX_FAR _Route10BattleText4
	db "@"

Route10EndBattleText4:
	TX_FAR _Route10EndBattleText4
	db "@"

Route10AfterBattleText4:
	TX_FAR _Route10AfterBattleText4
	db "@"

Route10Text5:
	TX_ASM
	ld hl, Route10TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText5:
	TX_FAR _Route10BattleText5
	db "@"

Route10EndBattleText5:
	TX_FAR _Route10EndBattleText5
	db "@"

Route10AfterBattleText5:
	TX_FAR _Route10AfterBattleText5
	db "@"

Route10Text6:
	TX_ASM
	ld hl, Route10TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route10BattleText6:
	TX_FAR _Route10BattleText6
	db "@"

Route10EndBattleText6:
	TX_FAR _Route10EndBattleText6
	db "@"

Route10AfterBattleText6:
	TX_FAR _Route10AfterBattleText6
	db "@"

Route10Text9:
Route10Text7:
	TX_FAR _Route10Text7 ; _Route10Text9
	db "@"

Route10Text10:
	TX_FAR _Route10Text10
	db "@"
